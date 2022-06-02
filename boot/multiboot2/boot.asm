.set CR0_PG, 1 << 31
.set CR0_PE, 1 << 0

.set CR4_PAE, 1 << 5
.set CR4_PGE, 1 << 7

.set EFER_LME, 1 << 8


.section .text
.code32


/* needed to make the linker see start */
.global start

/* landing from multiboot2 bootloader */
start:

  /* setup stack */
  mov $stack_bottom, %ebp
  mov $stack_bottom, %esp

  /* clean EFLAGS */
  pushl $0
  popf

  /* push ebx and eax to stack so kmain receive them as arguments */
  push %ebx /* info_ptr */
  push %eax /* magic */

  /* check if paging is enabled */
  _check_cr0_pg:
    mov %cr0, %ebx
    mov %ebx, %edx
    and $CR0_PG, %edx
    jz _setup_page_table

    /* otherwise, it's enabled, so disable it */
    _disable_cr0_pg:
      xor $CR0_PG, %ebx
      mov %ebx, %cr0


  _setup_page_table:
    mov $page_table, %ebx /* ebx stores page table address */
    mov $512, %ecx        /* ecx stores page counter */

    mov $0x00000000, %edx /* edx stores physical address + access bits*/
    or $0x03, %edx        /* all pages get the same access bits */

    _loop:
      cmp $0, %ecx        /* if counter is zero, end loop */
      jz _end

      mov %edx, (%ebx)    /* move physical address + access bits to page table address */

      dec %ecx            /* decrease counter */
      add $4096, %edx     /* increase physical address by 4KB */
      add $8, %ebx        /* increase page table address by 8, an entry size */
      jmp _loop

    _end:


  _enable_cr4_pae_pge:
    mov %cr4, %edx
    or $(CR4_PAE|CR4_PGE), %edx
    mov %edx, %cr4

  _set_cr3:
    mov $page_map_level_4, %eax
    mov %eax, %cr3

  _enable_LME:
    mov $0xc0000080, %ecx
    rdmsr
    or $EFER_LME, %eax
    wrmsr

  _enable_cr0_pg:
    mov %cr0, %ebx
    or $CR0_PG, %ebx
    mov %ebx, %cr0

  _set_gdt64:
    mov $GDT64_DESC, %eax
    lgdt (%eax)

  _farjump64:
    jmp $0x08, $_start64


.code64
  _start64:
    cli

    mov $0x10, %ax
    mov %ax, %ds
    mov %ax, %es
    mov %ax, %fs
    mov %ax, %gs
    mov %ax, %ss

    mov $IDT64_DESC, %eax
    lidt (%eax)

    /* recover magic number and info pointer */
    pop %rdx

    /* pass arguments to boot() */
    mov %edx, %edi
    shr $32, %rdx
    mov %edx, %esi

    call boot

   .h: jmp .h


.data
  .align 8

.section .bss
  .align 8

.section .stack
  .align 8

  /* stack in x86(-64) grows downwards in memory, top comes before bottom */
  stack_top:
    .skip 1024*16 /* 16kB for stack */
  stack_bottom:
