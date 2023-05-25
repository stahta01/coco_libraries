; =============================================================================
; Part of cocodefs.asm from https://github.com/tomctomc/coco_roms
; =============================================================================
                ORG         $0000
ENDFLG          RMB         1               ; STOP/END FLAG: POSITIVE=STOP, NEG=END
CHARAC          RMB         1               ; TERMINATOR FLAG 1
ENDCHR          RMB         1               ; TERMINATOR FLAG 2
TMPLOC          RMB         1               ; SCRATCH VARIABLE
IFCTR           RMB         1               ; IF COUNTER - HOW MANY IF STATEMENTS IN A LINE
DIMFLG          RMB         1               ; DV* ARRAY FLAG 0=EVALUATE, 1=DIMENSIONING
VALTYP          RMB         1               ; DV* *PV TYPE FLAG: 0=NUMERIC, $FF=STRING
GARBFL          RMB         1               ; TV STRING SPACE HOUSEKEEPING FLAG
ARYDIS          RMB         1               ; DISABLE ARRAY SEARCH: 00=ALLOW SEARCH
INPFLG          RMB         1               ; TV INPUT FLAG: READ=0, INPUT<>0
RELFLG          RMB         1               ; TV RELATIONAL OPERATOR FLAG
TEMPPT          RMB         2               ; PV TEMPORARY STRING STACK POINTER
LASTPT          RMB         2               ; PV ADDR OF LAST USED STRING STACK ADDRESS
TEMPTR          RMB         2               ; TEMPORARY POINTER
TMPTR1          RMB         2               ; TEMPORARY DESCRIPTOR STORAGE (STACK SEARCH)

; FLOATING POINT ACCUMULATOR #2 (MANTISSA ONLY)
FPA2            RMB         4               ; FLOATING POINT ACCUMULATOR #2 MANTISSA

BOTSTK          RMB         2               ; BOTTOM OF STACK AT LAST CHECK
TXTTAB          RMB         2               ; PV BEGINNING OF BASIC PROGRAM
VARTAB          RMB         2               ; PV START OF VARIABLES
ARYTAB          RMB         2               ; PV START OF ARRAYS
ARYEND          RMB         2               ; PV END OF ARRAYS (+1)
FRETOP          RMB         2               ; PV START OF STRING STORAGE (TOP OF FREE RAM)
STRTAB          RMB         2               ; PV START OF STRING VARIABLES
FRESPC          RMB         2               ; UTILITY STRING POINTER
MEMSIZ          RMB         2               ; PV TOP OF STRING SPACE
OLDTXT          RMB         2               ; SAVED LINE NUMBER DURING A "STOP"
BINVAL          RMB         2               ; BINARY VALUE OF A CONVERTED LINE NUMBER
OLDPTR          RMB         2               ; SAVED INPUT PTR DURING A "STOP"
TINPTR          RMB         2               ; TEMPORARY INPUT POINTER STORAGE
DATTXT          RMB         2               ; PV 'DATA' STATEMENT LINE NUMBER POINTER
DATPTR          RMB         2               ; PV 'DATA' STATEMENT ADDRESS POINTER
DATTMP          RMB         2               ; DATA POINTER FOR 'INPUT' & 'READ'
VARNAM          RMB         2               ; TV TEMP STORAGE FOR A VARIABLE NAME
VARPTR          RMB         2               ; TV POINTER TO A VARIABLE DESCRIPTOR
VARDES          RMB         2               ; TEMP POINTER TO A VARIABLE DESCRIPTOR
RELPTR          RMB         2               ; POINTER TO RELATIONAL OPERATOR PROCESSING ROUTINE
TRELFL          RMB         1               ; TEMPORARY RELATIONAL OPERATOR FLAG BYTE

; FLOATING POINT ACCUMULATORS #3,4 & 5 ARE MOSTLY USED AS SCRATCH PAD VARIABLES.

; FLOATING POINT ACCUMULATOR #3 :PACKED: ($40-$44)
V40             RMB         1
V41             RMB         1
V42             RMB         1
V43             RMB         1
V44             RMB         1

; FLOATING POINT ACCUMULATOR #4 :PACKED: ($45-$49)
V45             RMB         1
V46             RMB         1
V47             RMB         1
V48             RMB         2

; FLOATING POINT ACCUMULATOR #5 :PACKED: ($4A$4E)
V4A             RMB         1
V4B             RMB         2
V4D             RMB         2

; FLOATING POINT ACCUMULATOR #0
; 3456789012345 12345678901 123456789012345 12345678901234567890123456789012345
FP0EXP          RMB         1               ; PV FLOATING POINT ACCUMULATOR #0 EXPONENT
FPA0            RMB         4               ; PV FLOATING POINT ACCUMULATOR #0 MANTISSA
FP0SGN          RMB         1               ; PV FLOATING POINT ACCUMULATOR #0 SIGN
COEFCT          RMB         1               ; POLYNOMIAL COEFFICIENT COUNTER
STRDES          RMB         5               ; TEMPORARY STRING DESCRIPTOR
FPCARY          RMB         1               ; FLOATING POINT CARRY BYTE
; FLOATING POINT ACCUMULATOR #1
FP1EXP          RMB         1               ; PV FLOATING POINT ACCUMULATOR #1 EXPONENT
FPA1            RMB         4               ; PV FLOATING POINT ACCUMULATOR #1 MANTISSA
FP1SGN          RMB         1               ; PV FLOATING POINT ACCUMULATOR #1 SIGN
RESSGN          RMB         1               ; SIGN OF RESULT OF FLOATING POINT OPERATION
FPSBYT          RMB         1               ; FLOATING POINT SUB BYTE (FIFTH BYTE)
COEFPT          RMB         2               ; POLYNOMIAL COEFFICIENT POINTER
LSTTXT          RMB         2               ; CURRENT LINE POINTER DURING LIST
CURLIN          RMB         2               ; PV CURRENT LINE # OF BASIC PROGRAM, $FFFF = DIRECT
DEVCFW          RMB         1               ; TV TAB FIELD WIDTH
DEVLCF          RMB         1               ; TV TAB ZONE
DEVPOS          RMB         1               ; TV PRINT POSITION
DEVWID          RMB         1               ; TV PRINT WIDTH
PRTDEV          RMB         1               ; TV PRINT DEVICE: 0=NOT CASSETTE, -1=CASSETTE
DEVNUM          RMB         1               ; PV DEVICE NUMBER: -3=DLOAD, -2=PRINTER, -1=CASSETTE, 0=SCREEN, 1-15=DISK
CINBFL          RMB         1               ; PV CONSOLE IN BUFFER FLAG: 00=NOT EMPTY, $FF=EMPTY
RSTFLG          RMB         1               ; PV WARM START FLAG: $55=WARM, OTHER=COLD
RSTVEC          RMB         2               ; PV WARM START VECTOR - JUMP ADDRESS FOR WARM START
TOPRAM          RMB         2               ; PV TOP OF RAM
                RMB         2               ; SPARE: UNUSED VARIABLES
FILSTA          RMB         1               ; PV FILE STATUS FLAG: 0=CLOSED, 1=INPUT, 2=OUTPUT
CINCTR          RMB         1               ; PV CONSOLE IN BUFFER CHAR COUNTER
CINPTR          RMB         2               ; PV CONSOLE IN BUFFER POINTER
BLKTYP          RMB         1               ; TV CASS BLOCK TYPE: 0=HEADER, 1=DATA, $FF=EOF
BLKLEN          RMB         1               ; TV CASSETTE BYTE COUNT
CBUFAD          RMB         2               ; TV CASSETTE LOAD BUFFER POINTER
CCKSUM          RMB         1               ; TV CASSETTE CHECKSUM BYTE
CSRERR          RMB         1               ; TV ERROR FLAG/CHARACTER COUNT
CPULWD          RMB         1               ; TV PULSE WIDTH COUNT
CPERTM          RMB         1               ; TV BIT COUNTER
CBTPHA          RMB         1               ; TV BIT PHASE FLAG
CLSTSN          RMB         1               ; TV LAST SINE TABLE ENTRY
GRBLOK          RMB         1               ; TV GRAPHIC BLOCK VALUE FOR SET, RESET AND POINT
IKEYIM          RMB         1               ; TV INKEY$ RAM IMAGE
CURPOS          RMB         2               ; PV CURSOR LOCATION
ZERO            RMB         2               ; PV DUMMY - THESE TWO BYTES ARE ALWAYS ZERO
SNDTON          RMB         1               ; TV TONE VALUE FOR SOUND COMMAND
SNDDUR          RMB         2               ; TV DURATION VALUE FOR SOUND COMMAND
; THESE BYTES ARE MOVED DOWN FROM ROM
; INIT DESCRIPTION
; VALUE
CMPMID          RMB         1               ; 18 *PV 1200/2400 HERTZ PARTITION
CMP0            RMB         1               ; 24 *PV UPPER LIMIT OF 1200 HERTZ PERIOD
CMP1            RMB         1               ; 10 *PV UPPER LIMIT OF 2400 HERTZ PERIOD
SYNCLN          RMB         2               ; 128 *PV NUMBER OF $55'S TO CASSETTE LEADER
BLKCNT          RMB         1               ; 11 *PV CURSOR BLINK DELAY
LPTBTD          RMB         2               ; 88 *PV BAUD RATE CONSTANT (600)
LPTLND          RMB         2               ; 1 *PV PRINTER CARRIAGE RETURN DELAY
LPTCFW          RMB         1               ; 16 *PV TAB FIELD WIDTH
LPTLCF          RMB         1               ; 112 *PV LAST TAB ZONE
LPTWID          RMB         1               ; 132 *PV PRINTER WIDTH
LPTPOS          RMB         1               ; 0 *PV LINE PRINTER POSITION
EXECJP          RMB         2               ; LB4AA *PV JUMP ADDRESS FOR EXEC COMMAND
; THIS ROUTINE PICKS UP THE NEXT INPUT CHARACTER FROM
; BASIC. THE ADDRESS OF THE NEXT BASIC BYTE TO BE
; INTERPRETED IS STORED AT CHARAD.
GETNCH          RMB         6
; INC <CHARAD+1 *PV INCREMENT LS BYTE OF INPUT POINTER
; BNE GETCCH *PV BRANCH IF NOT ZERO (NO CARRY)
; INC <CHARAD *PV INCREMENT MS BYTE OF INPUT POINTER
GETCCH          RMB         1               ; PV OP CODE OF LDA EXTENDED
; FCB $B6 *PV OP CODE OF LDA EXTENDED
CHARAD          RMB         2               ; PV THESE 2 BYTES CONTAIN ADDRESS OF THE CURRENT
; CHARACTER WHICH THE BASIC INTERPRETER IS
; PROCESSING
; JMP BROMHK JUMP BACK INTO THE BASIC RUM
                RMB         3
VAB             RMB         1               ; = LOW ORDER FOUR BYTES OF THE PRODUCT
VAC             RMB         1               ; = OF A FLOATING POINT MULTIPLICATION
VAD             RMB         1               ; = THESE BYTES ARE USE AS RANDOM DATA
VAE             RMB         1               ; = BY THE RND STATEMENT
; EXTENDED BASIC VARIABLES
TRCFLG          RMB         1               ; PV TRACE FLAG 0=OFF ELSE=ON
USRADR          RMB         2               ; PV ADDRESS OF THE START OF USR VECTORS
FORCOL          RMB         1               ; PV FOREGROUND COLOR
BAKCOL          RMB         1               ; PV BACKGROUND COLOR
WCOLOR          RMB         1               ; TV WORKING COLOR BEING USED BY EX BASIC
ALLCOL          RMB         1               ; TV ALL PIXELS IN THIS BYTE SET TO COLOR OF VB3
PMODE           RMB         1               ; PV PMODE'S MODE ARGUMENT
ENDGRP          RMB         2               ; PV END OF CURRENT GRAPHIC PAGE
HORBYT          RMB         1               ; PV NUMBER OF BYTES/HORIZONTAL GRAPHIC LINE
BEGGRP          RMB         2               ; PV START OF CURRENT GRAPHIC PAGE
GRPRAM          RMB         1               ; PV START OF GRAPHIC RAM (MS BYTE)
HORBEG          RMB         2               ; DV* *PV HORIZ COORD - START POINT
VERBEG          RMB         2               ; DV* *PV VERT COORD - START POINT
CSSVAL          RMB         1               ; PV SCREEN'S COLOR SET ARGUMENT
SETFLG          RMB         1               ; PV PRESET/PSET FLAG: 0=PRESET, 1=PSET
HOREND          RMB         2               ; DV* *PV HORIZ COORD - ENDING POINT
VEREND          RMB         2               ; DV* *PV VERT COORD - ENDING POINT
HORDEF          RMB         2               ; PV HORIZ COORD - DEFAULT COORD
VERDEF          RMB         2               ; PV VERT COORD - DEFAULT COORD
; EXTENDED BASIC SCRATCH PAD VARIABLES
VCB             RMB         2
VCD             RMB         2
VCF             RMB         2
VD1             RMB         2
VD3             RMB         1
VD4             RMB         1
VD5             RMB         1
VD6             RMB         1
VD7             RMB         1
VD8             RMB         1
VD9             RMB         1
VDA             RMB         1
CHGFLG          RMB         1               ; TV FLAG TO INDICATE IF GRAPHIC DATA HAS BEEN CHANGED
TMPSTK          RMB         2               ; TV STACK POINTER STORAGE DURING PAINT
OCTAVE          RMB         1               ; PV OCTAVE VALUE (PLAY)
VOLHI           RMB         1               ; DV* *PV VOLUME HIGH VALUE (PLAY)
VOLLOW          RMB         1               ; DV* *PV VOLUME LOW VALUE (PLAY)
NOTELN          RMB         1               ; PV NOTE LENGTH (PLAY)
TEMPO           RMB         1               ; PV TEMPO VALUE (PLAY)
PLYTMR          RMB         2               ; TV TIMER FOR THE PLAY COMMAND
DOTVAL          RMB         1               ; TV DOTTED NOTE TIMER SCALE FACTOR
HRMODE          EQU         *
DLBAUD          RMB         1               ; DV* *PV DLOAD BAUD RATE CONSTANT $B0=300, $2C=1200
HRWIDTH         EQU         *
TIMOUT          RMB         1               ; DV* *PV DLOAD TIMEOUT CONSTANT
ANGLE           RMB         1               ; DV* *PV ANGLE VALUE (DRAW)
SCALE           RMB         1               ; DV* *PV SCALE VALUE (DRAW)
; DSKCON VARIABLES
DCOPC           RMB         1               ; PV DSKCON OPERATION CODE 0-3
DCDRV           RMB         1               ; PV DSKCON DRIVE NUMBER 03
DCTRK           RMB         1               ; PV DSKCON TRACK NUMBER 034
DSEC            RMB         1               ; PV DSKCON SECTOR NUMBER 1-18
DCBPT           RMB         2               ; PV DSKCON DATA POINTER
DCSTA           RMB         1               ; PV DSKCON STATUS BYTE
FCBTMP          RMB         2               ; TEMPORARY FCB POINTER
                RMB         13              ; SPARE: UNUSED VARIABLES
; BASIC EXBASIC DOSBASIC
SW3VEC          RMB         3               ; $XXXX $XXXX $3B3B SWI3 VECTOR
SW2VEC          RMB         3               ; $XXXX $XXXX $3B3B SWI2 VECTOR
SWIVEC          RMB         3               ; $XXXX $XXXX $XXXX SWI VECTOR
NMIVEC          RMB         3               ; $XXXX $XXXX $D7AE NMI VECTOR
IRQVEC          RMB         3               ; $A9B3 $894C $D7BC IRQ VECTOR
FRQVEC          RMB         3               ; $A0F6 $A0F6 $A0F6 FIRQ VECTOR
TIMVAL          EQU         *
USRJMP          RMB         3               ; JUMP ADDRESS FOR BASIC'S USR FUNCTION
; RMB 2 TIMER VALUE FOR EXBAS
; RMB 1 UNUSED BY EXBAS OR DISK BASIC
RVSEED          RMB         1               ; FLOATING POINT RANDOM NUMBER SEED EXPONENT
                RMB         4               ; MANTISSA: INITIALLY SET TO $804FC75259
CASFLG          RMB         1               ; UPPER CASE/LOWER CASE FLAG: $FF=UPPER, 0=LOWER
DEBVAL          RMB         2               ; KEYBOARD DEBOUNCE DELAY (SET TO $45E)
EXPJMP          RMB         3               ; JUMP ADDRESS FOR EXPONENTIATION
; INITIALLY SET TO ERROR FOR BASIC, $8489 FOR EX BASIC
; COMMAND INTERPRETATION VECTOR TABLE
; FOUR SETS OF 10 BYTE TABLES:
; THE LAST USED TABLE MUST BE FOLLOWED BY A ZERO BYTE
; THE JUMP TABLE VECTORS (3,4 AND 8,9) POINT TO THE JUMP TABLE FOR
; THE FIRST TABLE. FOR ALL OTHER TABLES, THESE VECTORS POINT TO A
; ROUTINE WHICH WILL VECTOR YOU TO THE CORRECT JUMP TABLE.
; SUPER ENHANCED BASIC HAS MODIFIED THIS SCHEME SO THAT THE USER
; TABLE MAY NOT BE ACCESSED. ANY ADDITIONAL TABLES WILL HAVE TO BE
; ACCESSED FROM A NEW COMMAND HANDLER.
; BYTE DESCRIPTION
; 0 NUMBER OF RESERVED WORDS
; 1,2 LOOKUP TABLE OF RESERVED WORDS
; 3,4 JUMP TABLE FOR COMMANDS (FIRST TABLE)
; VECTOR TO EXPANSION COMMAND HANDLERS (ALL BUT FIRST TABLE)
; 5 NUMBER OF SECONDARY FUNCTIONS
; 6,7 LOOKUP TABLE OF SECONDARY FUNCTIONS (FIRST TABLE)
; VECTOR TO EXPANSION SECONDARY COMMAND HANDLERS (ALL BUT
; FIRST TABLE)
; 8,9 JUMP TABLE FOR SECONDARY FUNCTIONS
; 10 0 BYTE - END OF TABLE FLAG (LAST TABLE ONLY)

COMVEC          RMB         10              ; BASIC'S TABLE
                RMB         10              ; EX BASIC'S TABLE
                RMB         10              ; DISC BASIC'S TABLE (UNUSED BY EX BASIC)
; USR FUNCTION VECTOR ADDRESSES (EX BASIC ONLY)
USR0            RMB         2               ; USR 0 VECTOR
                RMB         2               ; USR 1
                RMB         2               ; USR 2
                RMB         2               ; USR 3
                RMB         2               ; USR 4
                RMB         2               ; USR 5
                RMB         2               ; USR 6
                RMB         2               ; USR 7
                RMB         2               ; USR 8
                RMB         2               ; USR 9
; THE ABOVE 20 BYTE USR ADDR VECTOR TABLE IS MOVED TO
; $95F-$972 BY DISC BASIC. THE 20 BYTES FROM $13E-$151
; ARE REDEFINED AS FOLLOWS:
; RMB 10 USER (SPARE) COMMAND INTERPRETATION TABLE SPACE
; FCB 0 END OF COMM INTERP TABLE FLAG
; RMB 9 UNUSED BY DISK BASIC
; COMMAND INTERPRETATION TABLE VALUES
; BYTE BASIC EX BASIC DISK BASIC
; 0 5 3 BASIC TABLE BASIC TABLE
; 1,2 $AA66
; 3,4 $AB67
; 5 20
; 6,7 $AB1A
; 8,9 $AA29
; 0 25 EX BASIC TABLE
; 1,2 $8183
; 3,4 $813C $CE2E ($CF0A 2.1)
; 5 14
; 6,7 $821E
; 8,9 $8168 $CE56 ($CF32 2.1)
; 0 19 (20 2.1) DISK BASIC TABLE
; 1,2 $C17F
; 3,4 $C2C0
; 5 6
; 6,7 $C201
; 8,9 $C236

KEYBUF          RMB         8               ; KEYBOARD MEMORY BUFFER
POTVAL          RMB         1               ; LEFT VERTICAL JOYSTICK DATA
                RMB         1               ; LEFT HORIZONTAL JOYSTICK DATA
                RMB         1               ; RIGHT VERTICAL JOYSTICK DATA
                RMB         1               ; RIGHT HORIZONTAL JOYSTICK DATA
; BASIC'S RAM VECTORS - INITIALIZED TO RTS BY COLOR BASIC
; 25 SETS OF 3 BYTE INSTRUCTIONS WHICH ARE CALLED BY COLOR BASIC
; EXTENDED AND DISK BASIC. THEIR PURPOSE IS TO ALLOW ENHANCEMENTS (SUCH
; AS EX BASIC AND DOS BASIC) AS MORE ROMS ARE ADDED TO THE
; SYSTEM BY EFFECTIVELY ALLOWING MORE CODE TO BE ADDED TO THE
; ROUTINES IN EARLIER ROMS. THIS NEW CODE IS LOCATED IN THE NEW ROMS
; AND THE ADDRESS TO GET TO THE NEW CODE IS IN BYTES 1 & 2 OF THE
; RAM VECTOR. BYTE 0 WILL CONTAIN A $7E WHICH IS THE FIRST BYTE OF
; THE JMP INSTRUCTION.
; THE FIRST ADDRESS IN THIS TABLE IS THE ADDRESS IN BASIC WHICH
; CALLS THE RAM VECTOR, THE SECOND ADDRESS IS THE VALUE WHICH
; EX BASIC PUTS IN THE RAM VECTOR (IF ANY) AND THE THIRD ADDRESS
; IS THE VALUE WHICH DISK BASIC PUTS THERE (IF ANY)
; 2.0 2.1 1.0 1.1
RVEC0           RMB         3               ; $A5F6 $C426 $C44B OPEN COMMAND
RVEC1           RMB         3               ; $A5B9 $C838 $C888 DEVICE NUMBER VALIDITY CHECK
RVEC2           RMB         3               ; $A35F $C843 $C893 SET PRINT PARAMETERS
RVEC3           RMB         3               ; $A282 $8273 $CB4A $CC1C CONSOLE OUT
RVEC4           RMB         3               ; $A176 $8CF1 $C58F $C5BC CONSOLE IN
RVEC5           RMB         3               ; $A3ED $C818 $C848 INPUT DEVICE NUMBER CHECK
RVEC6           RMB         3               ; $A406 $C81B $C84B PRINT DEVICE NUMBER CHECK
RVEC7           RMB         3               ; $A426 $CA3B $CAE9 CLOSE ALL FILES
RVEC8           RMB         3               ; $A42D $8286 $CA4B $CAF9 CLOSE ONE FILE
RVEC9           RMB         3               ; $B918 $8E90 $8E90 $8E90 PRINT
RVEC10          RMB         3               ; $B061 $CC5B $CD35 INPUT
RVEC11          RMB         3               ; $A549 $C859 $C8A9 BREAK CHECK
RVEC12          RMB         3               ; $A390 $C6B7 $C6E4 INPUTTING A BASIC LINE
RVEC13          RMB         3               ; $A4BF $CA36 $CAE4 TERMINATING BASIC LINE INPUT
RVEC14          RMB         3               ; $A5CE $CA60 $C90C EOF COMMAND
RVEC15          RMB         3               ; $B223 $8846 $CDF6 $CED2 EVALUATE AN EXPRESSION
RVEC16          RMB         3               ; $AC46 $C6B7 $C6E4 RESERVED FOR ON ERROR GOTO COMMAND
RVEC17          RMB         3               ; $AC49 $88F0 $C24D $C265 ERROR DRIVER
RVEC18          RMB         3               ; $AE75 $829C $C990 $CA3E RUN
RVEC19          RMB         3               ; $BD22 $87EF ASCII TO FLOATING POINT CONVERSION
RVEC20          RMB         3               ; $AD9E $82B9 $C8B0 BASIC'S COMMAND INTERPRETATION LOOP
RVEC21          RMB         3               ; $A8C4 RESET/SET/POINT COMMANDS
RVEC22          RMB         3               ; $A910 CLS
; $8162 EXBAS' SECONDARY TOKEN HANDLER
; $8AFA EXBAS' RENUM TOKEN CHECK
; $975C $C29A $C2B2 EXBAS' GET/PUT
RVEC23          RMB         3               ; $B821 $8304 CRUNCH BASIC LINE
RVEC24          RMB         3               ; $B7C2 UNCRUNCH BASIC LINE

STRSTK          RMB         8*5             ; STRING DESCRIPTOR STACK
CFNBUF          RMB         9               ; CASSETTE FILE NAME BUFFER
CASBUF          RMB         256             ; CASSETTE FILE DATA BUFFER
LINHDR          RMB         2               ; LINE INPUT BUFFER HEADER
LINBUF          RMB         LBUFMX+1        ; BASIC LINE INPUT BUFFER
STRBUF          RMB         41              ; STRING BUFFER
VIDRAM          RMB         512             ; VIDEO DISPLAY AREA
; OF ADDITIONAL RAM VARIABLE STORAGE (DISK BASIC ONLY)
DBUF0           RMB         SECLEN          ; I/O BUFFER #0
DBUF1           RMB         SECLEN          ; I/O BUFFER #1
FATBL0          RMB         FATLEN          ; FILE ALLOCATION TABLE - DRIVE 0
FATBL1          RMB         FATLEN          ; FILE ALLOCATION TABLE - DRIVE 1
FATBL2          RMB         FATLEN          ; FILE ALLOCATION TABLE - DRIVE 2
FATBL3          RMB         FATLEN          ; FILE ALLOCATION TABLE - DRIVE 3
FCBV1           RMB         16*2            ; FILE BUFFER VECTORS (15 USER, 1 SYSTEM)
RNBFAD          RMB         2               ; START OF FREE RANDOM FILE BUFFER AREA
FCBADR          RMB         2               ; START OF FILE CONTROL BLOCKS
DNAMBF          RMB         8               ; DISK FILE NAME BUFFER
DEXTBF          RMB         3               ; DISK FILE EXTENSION NAME BUFFER
DFLTYP          RMB         1               ; DV* DISK FILE TYPE: 0=BASIC, 1=DATA, 2=MACHINE
; LANGUAGE, 3=TEXT EDITOR SOURCE FILE
DASCFL          RMB         1               ; DV* ASCII FLAG: 0=CRUNCHED OR BINARY, $FF=ASCII
DRUNFL          RMB         1               ; RUN FLAG: (IF BIT 1=1 THEN RUN, IF BIT 0=1, THEN CLOSE
; ALL FILES BEFORE RUNNING)
DEFDRV          RMB         1               ; DEFAULT DRIVE NUMBER
FCBACT          RMB         1               ; NUMBER OF FCBS ACTIVE
DRESFL          RMB         1               ; RESET FLAG: <>0 WILL CAUSE A 'NEW' & SHUT DOWN ALL FCBS
DLODFL          RMB         1               ; LOAD FLAG: CAUSE A 'NEW' FOLLOWING A LOAD ERROR
DMRGFL          RMB         1               ; MERGE FLAG: 0=N0 MERGE, $FF=MERGE
DUSRVC          RMB         20              ; DISK BASIC USR COMMAND VECTORS
; DISK FILE WORK AREA FOR DIRECTORY SEARCH
; EXISTING FILE
V973            RMB         1               ; SECTOR NUMBER
V974            RMB         2               ; RAM DIRECTORY IMAGE ADDRESS
V976            RMB         1               ; FIRST GRANULE NUMBER
; UNUSED FILE
V977            RMB         1               ; SECTOR NUMBER
V978            RMB         2               ; RAM DIRECTORY IMAGE ADDRESS
WFATVL          RMB         2               ; WRITE FAT VALUE: NUMBER OF FREE GRANULES WHICH MUST BE TAKEN
; FROM THE FAT TO TRIGGER A WRITE FAT TO DISK SEQUENCE
DFFLEN          RMB         2               ; DIRECT ACCESS FILE RECORD LENGTH
DR0TRK          RMB         4               ; CURRENT TRACK NUMBER, DRIVES 0,1,2,3
NMIFLG          RMB         1               ; NMI FLAG: 0=DON'T VECTOR <>0=YECTOR OUT
DNMIVC          RMB         2               ; NMI VECTOR: WHERE TO JUMP FOLLOWING AN NMI
; INTERRUPT IF THE NMI FLAG IS SET
RDYTMR          RMB         1               ; MOTOR TURN OFF TIMER
DRGRAM          RMB         1               ; RAM IMAGE OF DSKREG ($FF40)
DVERFL          RMB         1               ; VERIFY FLAG: 0=OFF, $FF=ON
ATTCTR          RMB         1               ; READ/WRITE ATTEMPT COUNTER: NUMBER OF TIMES THE
; DISK WILL ATTEMPT TO RETRIEVE OR WRITE DATA
; BEFORE IT GIVES UP AND ISSUES AN ERROR.
DFLBUF          RMB         SECLEN          ; INITIALIZED TO SECLEN BY DISKBAS