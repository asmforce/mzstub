;
; @project: sunrise (2011)
;  @author: Vitaliy Krutko (aka asmforce)
;   @email: asmforce@ukr.net asmxforce@gmail.com
;  @target: pe ms-dos stub
;   @initialization: 30.08.2011
;   @last-change: 30.08.2011
;  @original-filename: org.asm
;

; simple fillblock
%define org(bytes,fillbyte)           \
  times (bytes)-($-$$) db (fillbyte)

; labeled fillblock
%define org(label,bytes,fillbyte)     \
  label:                              \
  times (bytes)-($-$$) db (fillbyte)
