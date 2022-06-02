.section .header
.code32

.SET MAGIC, 0xe85250d6
.SET ARCH,  0 /* i386 */
.SET HEADER_LENGTH, header_end - header
.SET CHECKSUM, -(MAGIC + ARCH + HEADER_LENGTH)

.SET END_TAG, 0
.SET END_TAG_LENGTH, tags_end - end_tag

header:
 .align 8

 .long MAGIC
 .long ARCH
 .long HEADER_LENGTH
 .long CHECKSUM

 tags:

   info_request:
     .align 8

     .short 1
     .short 0
     .long  info_request_end - info_request

     /* mbi_tag_types u32 array */
     .long 6 /* memory map */

   info_request_end:

   end_tag:
     .align 8

     .short END_TAG
     .short 0
     .long  END_TAG_LENGTH

 tags_end:

header_end:
