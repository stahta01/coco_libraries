; =============================================================================
; Part of cocodefs.asm from https://github.com/tomctomc/coco_roms
; =============================================================================

                include     coco3-defs.asm

DA              EQU         PIA1_DATA_A
DSKREG          EQU         FDC_CTRL
FDCREG          EQU         FDC_COMMAND
INIT0           EQU         GIME_INIT0
INIT1           EQU         GIME_INIT1
MMUREG          EQU         GIME_MMU0
PALETREG        EQU         GIME_PALETTE
PIA0            EQU         PIA0_BASE
PIA1            EQU         PIA1_BASE
ROMCLR          EQU         ROM_MODE_ENABLE
SAMREG          EQU         SAM_V_BASE
V_BORDER        EQU         GIME_BORDER_PALETTE
V_TIMER         EQU         GIME_TIMER
VIDEOMOD        EQU         GIME_VIDEO_MODE
