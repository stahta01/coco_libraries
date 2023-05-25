; =============================================================================
; Part of cocodefs.asm from https://github.com/tomctomc/coco_roms
; =============================================================================
; PSEUDO OPS
SKP1            EQU         $21             ; OP CODE OF BRN SKIP ONE BYTE
SKP2            EQU         $8C             ; SKIP TWO BYTES actually a CMPX #$xxxx instruction (3 clocks)
SKP1LD          EQU         $86             ; OP CODE OF LDA # - SKIP THE NEXT BYTE
