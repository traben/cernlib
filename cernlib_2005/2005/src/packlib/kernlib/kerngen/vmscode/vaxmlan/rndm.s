;
; $Id: rndm.s,v 1.1.1.1 1996/02/15 17:50:29 mclareni Exp $
;
; $Log: rndm.s,v $
; Revision 1.1.1.1  1996/02/15 17:50:29  mclareni
; Kernlib
;
;
 .TITLE RNDM
;++
; CERN PROGLIB# V104    RNDM            .VERSION KERNVAX  2.30  881021
; ORIG.  H.FORSBACH, WUPPERTAL, JUNE 82
; MOD.   J. VORBRUEGGEN 25/5/83, corr. 20/10/88 JZ
;
;       REAL FUNCTION RNDM (DUMMY)
;       UNIFORM RANDOM NUMBER GENERATOR FOR VAX 11-780
;       REWRITTEN FROM CERN IBM 370 VERSION
;       WITH THE IBM RANDOM NUMBER SEQUENCE
;       ONE PARAMETER VERSION
;
;--
        .IDENT  /01/
        .PSECT  $CODE,PIC,CON,REL,LCL,SHR,EXE,RD,NOWRT,LONG
        .ENTRY  RNDM,^M<>               ;SAVE NOTHING

        MOVL    MCGN,R0                 ;MOVE MCGN -> R0
        MULL2   #^D69069,R0             ;MULTIPLY WITH 69069 INTO R0
        MOVL    R0,MCGN                 ;STORE MCGN
        EXTZV   #8,#24,R0,R1            ;MANTISSA INTO R1
        CVTLF   R1,R0                   ;MANTISSA TO VAX-FLOATING
        EXTZV   #7,#5,R0,R1             ;GET NORMALIZATION SHIFT
        ADDL2   #^X68,R1                ;ADD 128-EXCESS AND AJUST
        INSV    R1,#7,#8,R0             ;PACK EXPONENT INTO R2
        RET
;
;       INTEGER*4 FUNCTION IRNDM (DUMMY)
;       UNIFORM DISTRIBUTED POSITIVE INTEGERS
;       WITH THE SAME SEQUENCE AS IBM 370
;
        .ENTRY  IRNDM,^M<>              ;SAVE NOTHING

        MULL2   #^D69069,MCGN           ;MULTIPLY WITH 69069
        EXTZV   #1,#31,MCGN,R0          ;CLEAR SIGN BIT AND STORE RESULT
        RET
;
;       SUBROUTINE RDMIN (MCGN)
;       MCGN IS THE STARTING VALUE OF RNDM
;
        .ENTRY  RDMIN,^M<>

        MOVL    @4(AP),MCGN
        RET
;
;       SUBROUTINE RDMOUT (MCGN)
;       MCGN IS THE LAST USED VALUE OF RNDM
;
        .ENTRY  RDMOUT,^M<>

        MOVL    MCGN,@4(AP)
        RET

        .PSECT  $LOCAL,PIC,CON,REL,LCL,NOSHR,NOEXE,RD,WRT,LONG

MCGN:   .LONG   ^D12345
        .END