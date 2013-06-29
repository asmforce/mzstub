;
; @project: sunrise (2011)
;  @author: Vitaliy Krutko (aka asmforce)
;   @email: asmforce@ukr.net asmxforce@gmail.com
;  @target: pe ms-dos stub
;   @initialization: 30.08.2011
;   @last-change: 30.08.2011
;  @original-filename: config.asm
;


%define MZ_SIGNATURE		0x5A4D
%define MZ_HEAD_ORG		0
%define MZ_HEAD_SIZE		0x20

; header location record
%define PE_HLRECORD_ORG		0x3C
; main segment offset
%define MZ_CODE_ORG		(MZ_HEAD_ORG+MZ_HEAD_SIZE)
%define MZ_CODE_SIZE		(PE_HLRECORD_ORG-MZ_CODE_ORG)

%define MZ_SIZE			0x40
;%define MZ_SIZE			0x70
%define MZ_PAGE_SIZE		0x200
%define MZ_PARAGRAPH_SIZE	0x10
%define MZ_LAST_PAGE_SIZE	(MZ_SIZE % MZ_PAGE_SIZE)
%define MZ_PAGE_COUNT		((MZ_SIZE - MZ_LAST_PAGE_SIZE) % MZ_PAGE_SIZE + 1)
%define MZ_RELOCATION_ENTRIES	0

%define MZ_MIN_ALLOCATE		0x100
%define MZ_MAX_ALLOCATE		0x100

; relatively the main segment
%define MZ_SP			(MZ_MIN_ALLOCATE*MZ_PARAGRAPH_SIZE+MZ_CODE_SIZE)
%define MZ_SS			0
%define MZ_CS			0
%define MZ_IP			0

%define MZ_CHECKSUM		0

; relocation table offset (must be 0x40 for `pe`)
%define MZ_RELOCATION_TABLE_ORG	0x40
%define MZ_OVERLAY_COUNT	0

%define MZ_ERROR_MESSAGE	"This program cannot be run in DOS mode!"
;%define MZ_ERROR_MESSAGE	"This portable executable is unable to run under this operation system!"

%define PE_SIGNATURE		0x00004550
%define PE_HEAD_ORG		MZ_SIZE
