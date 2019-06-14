; boomerang-defs.asm

                        *pragmapush list    ; Save state of list pragma
                        pragma nolist       ; Turn off assembly listing and exclude from symbol list

                        ifndef BOOMERANG_DEFS  ; Load defines only once


; Boomerang 2MB Memory board by BoysonTech
; https://boysontech.com/marketplace/
BOOMERANG_LED           equ $ffef           ; Programmable Tricolor LED on Guardian+ CPU/DAT board
                                            ; Bit 7:6 - 00 = Set Red, Green and Blue intensity
                                            ;           01 = Set Red intensity
                                            ;           10 = Set Green intensity
                                            ;           11 = Set Blue intensity
                                            ; Bit 5   - n/a
                                            ; Bit 4:0 - Intensity (0-31)


; The LED can also operate in "speed" mode, where the red LED will signify
; the CoCo running in "slow" mode and the green LED denotes "fast" mode. To
; activate, see "special mode" below.


; Boomerang magic addresses to place device in "special mode"
BOOMERANG_MAGIC_1       equ $fdfd           ; Read BOOMERANG_MAGIC_1-6 sequential, followed by             (READ ONLY)
BOOMERANG_MAGIC_2       equ $fd55           ; either BOOMERANG_512K, BOOMERANG_512K_TURBO,                 (READ ONLY)
BOOMERANG_MAGIC_3       equ $fdaa           ; BOOMERANG_2M or BOOMERANG_2M_TUBRO.                          (READ ONLY)
BOOMERANG_MAGIC_4       equ $fdff           ;                                                              (READ ONLY)
BOOMERANG_MAGIC_5       equ $fd00           ;                                                              (READ ONLY)
BOOMERANG_MAGIC_6       equ $fdff           ;                                                              (READ ONLY)


; Boomerang "special modes" options
BOOMERANG_512K          equ $fd01           ; Enable 512K mode                                             (READ ONLY)
BOOMERANG_512K_TURBO    equ $fd81           ; Enable 512K and turbo LED mode                               (READ ONLY)
BOOMERANG_2M            equ $fd00           ; Enable 2M mode                                               (READ ONLY)
BOOMERANG_2M_TURBO      equ $fd80           ; Enable 2M and turbo LED mode                                 (READ ONLY)


enable_boomerang_magic  macro
                        sta BOOMERANG_MAGIC_1
                        sta BOOMERANG_MAGIC_2
                        sta BOOMERANG_MAGIC_3
                        sta BOOMERANG_MAGIC_4
                        sta BOOMERANG_MAGIC_5
                        sta BOOMERANG_MAGIC_6
                        endm


enable_boomerang_512k   macro
                        enable_boomerang_magic
                        sta BOOMERANG_512K
                        endm


enable_boomerang_2m     macro
                        enable_boomerang_magic
                        sta BOOMERANG_2M
                        endm


enable_boomerang_512k_turbo  macro
                        enable_boomerang_magic
                        sta BOOMERANG_512K_TURBO
                        endm


enable_boomerang_2m_turbo  macro
                        enable_boomerang_magic
                        sta BOOMERANG_2M_TURBO
                        endm

BOOMERANG_DEFS          equ 1               ; Set flag for defines being loaded
                        endc
                        *pragmapop list     ; restore assembly listing to previous state