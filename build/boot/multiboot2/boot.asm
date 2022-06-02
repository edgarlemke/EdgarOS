.set CR0_PG, 1 << 31
.set CR0_PE, 1 << 0
.set CR4_PAE, 1 << 5
.set CR4_PGE, 1 << 7
.set EFER_LME, 1 << 8
.section .boot
.code32
.global start
start:
  mov $(stack_bottom - 0xffff800000000000), %ebp
  mov $(stack_bottom - 0xffff800000000000), %esp
  pushl $0
  popf
  push %ebx
  push %eax
  _check_cr0_pg:
    mov %cr0, %ebx
    mov %ebx, %edx
    and $CR0_PG, %edx
    jz _setup_page_table
    _disable_cr0_pg:
      xor $CR0_PG, %ebx
      mov %ebx, %cr0
  _setup_page_table:
    mov $(page_table - 0xffff800000000000), %ebx
    mov $512, %ecx
    mov $0x00000000, %edx
    or $0x03, %edx
    _loop:
      cmp $0, %ecx
      jz _end
      mov %edx, (%ebx)
      dec %ecx
      add $4096, %edx
      add $8, %ebx
      jmp _loop
    _end:
  _enable_cr4_pae_pge:
    mov %cr4, %edx
    or $(CR4_PAE|CR4_PGE), %edx
    mov %edx, %cr4
  _set_cr3:
    mov $(page_map_level_4 - 0xffff800000000000), %eax
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
    mov $(GDT64_DESC - 0xffff800000000000), %eax
    lgdt (%eax)
  _farjump64:
    jmp $0x08, $(_start64 - 0xffff800000000000)
.code64
  _start64:
    cli
    mov $0x10, %ax
    mov %ax, %ds
    mov %ax, %es
    mov %ax, %fs
    mov %ax, %gs
    mov %ax, %ss
    movabs $_higher_half, %rax
    jmp %rax
  _higher_half:
    mov $(0xffff800000000000), %rbx
    add %rbx, %rsp
    add %rbx, %rbp
    mov $0, %rax
    movabs %rax, page_map_level_4
    mov %cr3, %rax
    mov %rax, %cr3
    movabs $GDT64_DESC, %rax
    lgdt (%rax)
    mov $0x10, %ax
    mov %ax, %ss
    mov %ax, %ds
    mov %ax, %es
    mov %ax, %fs
    mov %ax, %gs
    movabs $_updated_cs, %rax
    pushq $0x08
    pushq %rax
    retfq
    _updated_cs:
    movabs $IDT64_DESC, %rax
    lidt (%rax)
    pop %rdx
    mov %edx, %edi
    shr $32, %rdx
    mov %edx, %esi
    call boot
   .h: jmp .h
.section .stack
  .align 8
  stack_top:
    .skip 1024*16
  stack_bottom:
