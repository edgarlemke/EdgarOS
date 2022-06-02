/*
Python to generate this:

s=""".global isr_00
.type isr_00, @function
isr_00:
 .align 4

 call isr_00_c

 iretq
"""

for c in range(0x00,0x20):
  print(s.replace("isr_00","isr_0x%.2x"%c))

*/

.text
.code64

.global isr_0x00
.type isr_0x00, @function
isr_0x00:
 .align 4

 call isr_0x00_c

 iretq

.global isr_0x01
.type isr_0x01, @function
isr_0x01:
 .align 4

 call isr_0x01_c

 iretq

.global isr_0x02
.type isr_0x02, @function
isr_0x02:
 .align 4

 call isr_0x02_c

 iretq

.global isr_0x03
.type isr_0x03, @function
isr_0x03:
 .align 4

 call isr_0x03_c

 iretq

.global isr_0x04
.type isr_0x04, @function
isr_0x04:
 .align 4

 call isr_0x04_c

 iretq

.global isr_0x05
.type isr_0x05, @function
isr_0x05:
 .align 4

 call isr_0x05_c

 iretq

.global isr_0x06
.type isr_0x06, @function
isr_0x06:
 .align 4

 call isr_0x06_c

 iretq

.global isr_0x07
.type isr_0x07, @function
isr_0x07:
 .align 4

 call isr_0x07_c

 iretq

.global isr_0x08
.type isr_0x08, @function
isr_0x08:
 .align 4

 call isr_0x08_c

 iretq

.global isr_0x09
.type isr_0x09, @function
isr_0x09:
 .align 4

 call isr_0x09_c

 iretq

.global isr_0x0a
.type isr_0x0a, @function
isr_0x0a:
 .align 4

 call isr_0x0a_c

 iretq

.global isr_0x0b
.type isr_0x0b, @function
isr_0x0b:
 .align 4

 call isr_0x0b_c

 iretq

.global isr_0x0c
.type isr_0x0c, @function
isr_0x0c:
 .align 4

 call isr_0x0c_c

 iretq

.global isr_0x0d
.type isr_0x0d, @function
isr_0x0d:
 .align 4

 call isr_0x0d_c

 iretq

.global isr_0x0e
.type isr_0x0e, @function
isr_0x0e:
 .align 4

 call isr_0x0e_c

 iretq

.global isr_0x0f
.type isr_0x0f, @function
isr_0x0f:
 .align 4

 call isr_0x0f_c

 iretq

.global isr_0x10
.type isr_0x10, @function
isr_0x10:
 .align 4

 call isr_0x10_c

 iretq

.global isr_0x11
.type isr_0x11, @function
isr_0x11:
 .align 4

 call isr_0x11_c

 iretq

.global isr_0x12
.type isr_0x12, @function
isr_0x12:
 .align 4

 call isr_0x12_c

 iretq

.global isr_0x13
.type isr_0x13, @function
isr_0x13:
 .align 4

 call isr_0x13_c

 iretq

.global isr_0x14
.type isr_0x14, @function
isr_0x14:
 .align 4

 call isr_0x14_c

 iretq

.global isr_0x15
.type isr_0x15, @function
isr_0x15:
 .align 4

 call isr_0x15_c

 iretq

.global isr_0x16
.type isr_0x16, @function
isr_0x16:
 .align 4

 call isr_0x16_c

 iretq

.global isr_0x17
.type isr_0x17, @function
isr_0x17:
 .align 4

 call isr_0x17_c

 iretq

.global isr_0x18
.type isr_0x18, @function
isr_0x18:
 .align 4

 call isr_0x18_c

 iretq

.global isr_0x19
.type isr_0x19, @function
isr_0x19:
 .align 4

 call isr_0x19_c

 iretq

.global isr_0x1a
.type isr_0x1a, @function
isr_0x1a:
 .align 4

 call isr_0x1a_c

 iretq

.global isr_0x1b
.type isr_0x1b, @function
isr_0x1b:
 .align 4

 call isr_0x1b_c

 iretq

.global isr_0x1c
.type isr_0x1c, @function
isr_0x1c:
 .align 4

 call isr_0x1c_c

 iretq

.global isr_0x1d
.type isr_0x1d, @function
isr_0x1d:
 .align 4

 call isr_0x1d_c

 iretq

.global isr_0x1e
.type isr_0x1e, @function
isr_0x1e:
 .align 4

 call isr_0x1e_c

 iretq

.global isr_0x1f
.type isr_0x1f, @function
isr_0x1f:
 .align 4

 call isr_0x1f_c

 iretq
