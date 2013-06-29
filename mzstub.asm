;
; @project: sunrise (2011)
;  @author: Vitaliy Krutko (aka asmforce)
;   @email: asmforce@ukr.net asmxforce@gmail.com
;  @target: pe ms-dos stub
;   @initialization: 30.08.2011
;   @last-change: 30.08.2011
;  @original-filename: mzstub.asm
;

%include "org.asm"
%include "config.asm"


org( mzhead, MZ_HEAD_ORG, 0x00 )

	dw MZ_SIGNATURE
	dw MZ_LAST_PAGE_SIZE
	dw MZ_PAGE_COUNT
	dw MZ_RELOCATION_ENTRIES
	dw (MZ_HEAD_SIZE/MZ_PARAGRAPH_SIZE)
	dw MZ_MIN_ALLOCATE
	dw MZ_MAX_ALLOCATE
	dw MZ_SS, MZ_SP
	dw MZ_CHECKSUM
	dw MZ_IP, MZ_CS
	dw MZ_RELOCATION_TABLE_ORG
	dw MZ_OVERLAY_COUNT
	dw 0, 0 ; reserved


org( mzcode, MZ_CODE_ORG, 0x00 )

;	push cs
;	pop ds
;	mov dx, message-mzcode
;	mov ah, 0x09
;	int 0x21
	mov ax, 0x4C01
	int 0x21


org( PE_HLRECORD_ORG, 0x00 )

	dd PE_HEAD_ORG

;message:
;	db MZ_ERROR_MESSAGE, 0x0D, 0x0A, 0x24


org( pehead, PE_HEAD_ORG, 0x00 )

	dd PE_SIGNATURE
