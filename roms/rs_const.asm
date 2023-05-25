; =============================================================================
; Part of cocodefs.asm from https://github.com/tomctomc/coco_roms
; =============================================================================
APOSTROPHE      EQU         39              ; APOSTROPHE
BS              EQU         $08             ; BACKSPACE
CR              EQU         $0D             ; ENTER KEY
ESC             EQU         $1B             ; ESCAPE CODE
LF              EQU         $0A             ; LINE FEED
FORMF           EQU         $0C             ; FORM FEED
SPACE           EQU         $20             ; SPACE (BLANK)
STKBUF          EQU         58              ; STACK BUFFER ROOM
DEBDEL          EQU         $45E            ; DEBOUNCE DELAY
LBUFMX          EQU         250             ; MAX NUMBER OF CHARS IN A BASIC LINE
MAXLIN          EQU         $FA             ; MAXIMUM MS BYTE OF LINE NUMBER
DOSBUF          EQU         $2600           ; RAM LOAD LOCATION FOR THE DOS COMMAND
DIRLEN          EQU         32              ; NUMBER OF BYTES IN DIRECTORY ENTRY
SECLEN          EQU         256             ; LENGTH OF SECTOR IN BYTES
SECMAX          EQU         18              ; MAXIMUM NUMBER OF SECTORS PER TRACK
TRKLEN          EQU         SECMAX*SECLEN   ; LENGTH OF TRACK IN BYTES
TRKMAX          EQU         35              ; MAX NUMBER OF TRACKS
FATLEN          EQU         6+(TRKMAX-1)*2  ; FILE ALLOCATION TABLE LENGTH
GRANMX          EQU         (TRKMAX-1)*2    ; MAXIMUM NUMBER OF GRANULES
FCBLEN          EQU         SECLEN+25       ; FILE CONTROL BLOCK LENGTH
INPFIL          EQU         $10             ; INPUT FILE TYPE
OUTFIL          EQU         $20             ; OUTPUT FILE TYPE
RANFIL          EQU         $40             ; RANDOM/DIRECT FILE TYPE
