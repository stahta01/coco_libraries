; =============================================================================
; Part of cocodefs.asm from https://github.com/tomctomc/coco_roms
; =============================================================================
                ORG         $8000
EXBAS           EQU         *               ; $8000
                RMB         $2000           ; EXTENDED BASIC ROM
BASIC           EQU         *               ; $A000
                RMB         $2000           ; COLOR BASIC ROM
ROMPAK          EQU         *               ; $C000
DOSBAS          RMB         $2000           ; DISK BASIC ROM/ENHANCED BASIC INIT CODE
                RMB         $1F00           ; ENHANCED BASIC
