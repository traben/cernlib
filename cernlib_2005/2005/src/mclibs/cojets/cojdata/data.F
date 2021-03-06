*
* $Id: data.F,v 1.1.1.1 1996/01/11 14:15:01 mclareni Exp $
*
* $Log: data.F,v $
* Revision 1.1.1.1  1996/01/11 14:15:01  mclareni
* Cojets
*
*
#include "cojets/pilot.h"
      BLOCK DATA COJDAT
C     *****************
#if defined(CERNLIB_SINGLE)
      IMPLICIT REAL (A-H,O-Z)
#endif
#if defined(CERNLIB_DOUBLE)
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
#endif
#include "cojets/alqgen.inc"
#include "cojets/bopar.inc"
#include "cojets/cmpsca.inc"
#include "cojets/cutoff.inc"
#include "cojets/data1.inc"
#include "cojets/data2.inc"
#include "cojets/data3.inc"
#include "cojets/decpar.inc"
#include "cojets/edpar.inc"
#include "cojets/eicht.inc"
#include "cojets/event.inc"
#include "cojets/evint.inc"
#include "cojets/evtype.inc"
#include "cojets/flapre.inc"
#include "cojets/forgen.inc"
#include "cojets/fratab.inc"
#include "cojets/fstate.inc"
#include "cojets/iflghv.inc"
#include "cojets/inifl.inc"
#include "cojets/inmat.inc"
#include "cojets/intype.inc"
#include "cojets/itapes.inc"
#include "cojets/jet.inc"
#include "cojets/jetset.inc"
#include "cojets/kdump.inc"
#include "cojets/keybre.inc"
#include "cojets/keyjet.inc"
#include "cojets/keys.inc"
#include "cojets/kfact.inc"
#include "cojets/khadro.inc"
#include "cojets/maxn.inc"
#include "cojets/mb.inc"
#include "cojets/nevol.inc"
#include "cojets/nflav.inc"
#include "cojets/nkinpt.inc"
#include "cojets/nleave.inc"
#include "cojets/nquaz.inc"
#include "cojets/over.inc"
#include "cojets/par.inc"
#include "cojets/parq.inc"
#include "cojets/parqua.inc"
#include "cojets/photbe.inc"
#include "cojets/qcds.inc"
#include "cojets/spyfor.inc"
#include "cojets/stable.inc"
#include "cojets/tabpsq.inc"
#include "cojets/tabqrk.inc"
#include "cojets/tleave.inc"
#include "cojets/top.inc"
#include "cojets/weakbo.inc"
#include "cojets/weakon.inc"
#include "cojets/zwpar.inc"
C
C-- INTYPE FLAGS CONVENTIONAL VS. READIN INPUT
      DATA INTYPE/0/
C-- FLAG TO KEEP STABLE PARTICLES ONLY
      DATA NOUNST/.TRUE./
C-- K FACTOR (FROM UA1)
      DATA FACTK/2./
C-- (UNEVOLVED) PARTON DENSITY PARAMETRIZATION
      DATA IEICHT/1/
C-- TOP QUARK MASS SET TO ZERO TO MONITOR POSSIBLE INPUT FROM CARDS
      DATA TOPMAS/0./
C-- GF FERMI CONSTANT, ALPHA QED, SIN(THETA)**2 WEINBERG-SALAM,
C-- COS(CABIBBO ANGLE)
      DATA GF/1.166372E-5/,S2THW/.215/,COSCAB/.9737/
      DATA ZGAM,WGAM,ZCHDEC,WCHDEC/4*0./
C-- MAX (BOMSMX-BOMSMN)/BOMSMN RATIO ALLOWED IN IPUT
      DATA BRATIO/1./,BOMSMN,BOMSMX/2*0./
C
C-- FRAGMENTATION PACKAGE
C   ---------------------
      DATA PUD/0.4/,PS1/3*0.5,3*0.75/,PISOPN/0.5/,PBARYO/0.1/
     +,SIGMAQ/0.6/,SIGMAG/0.6/,CX2Q/0.77/,CX2G/0.77/,EFGMIN/0.2/
      DATA BZDMIX/.20/,BZSMIX/0./,CND1/1.8/,CND2/0.8/
      DATA MESO/31,1,3,8,14,22,2,32,5,10,16,24,4,6,33,12,18,26,7,9,11,
     +34,20,28,13,15,17,19,35,30,21,23,25,27,29,36/
      DATA CMIX/2*0.5,1.,2*0.5,1.,2*0.25,0.5,2*0.,1./
      DATA WTCOR/16.,150.,2.,5.,15.,60.,250.,1500.,12000.,120000./
      DATA CHA1/'UD','DU','US','SU','DS','SD','CU','UC','CD','DC','CS',
     +'SC','BU','UB','BD','DB','BS','SB','BC','CB','TU','UT','TD','DT',
     +'TS','ST','TC','CT','TB','BT','UU','DD','SS','CC','BB','TT'/
      DATA IDENTF/352*0/,IDB/352*0/
      DATA CHA3/'    ','STAB'/
      DATA EPSPET/.25,2*.001/
      DATA FRGTHO/.FALSE./,FTHOMP/2./,ETHOMP/34./
C
C-- BERENDS ET AL. PACKAGE
C   ----------------------
C-- PHOTON ENERGY CUTOFF
      DATA BEQ0/1./
C
C-- MNBIAS PARAMETERS
      DATA CLPRO/0.7/,PT2PRO/0.15/
      DATA FMULMB,FPTMB/2*1./
      DATA RETPIZ/0.257/
      DATA RPAIR/13.6,20.2,2.5,2.7,1.5,1.5,0.5,0.125,0.125/
C
C-- QZEV = INITIAL SCALE FOR PARTON DENSITIES EVOLUTION (GEV)
      DATA QZEV/4./
C
C-- INPUT PARAMETERS
C   ----------------
C- ECM = C.M. ENERGY (GEV)
C- ALAMB = QCD LAMBDA (GEV)
C- PTMIN = MIN PT CUTOFF FOR HARD PARTONS (GEV/C)
C- PTMGE = IF PTMGE.GT.PTMIN GENERATE ONLY HARD EVENTS WITH PT.GT.PTMGE
C- PT2INT = MEAN KT**2 OF INITIAL PARTONS, BEFORE EVOLUTION ((GEV/C)**2)
C- SIGINL = TOTAL INELASTIC X-SECTION (MB) (DEFAULT SET IN PREGEN)
C- IPBAR = 1 ANTIPROTON-PROTON, OTHERWISE PROTON-PROTON
C- NFLAV= NO. OF QUARK FLAVORS
C-
C- TLEAVE = EVENT GENERATION STOPS WHEN TIME LEFT < TLEAVE
C- NLEAVE = EVENT GENERATION STOPS WHEN NO. OF GENERATED EVENTS > NLEAVE
C- NSIGMA = NO. OF POINTS TO BE CALCULATED FOR THE X-SECTION DETERMINATI
C- FRATAB = FRACTION OF EXECUTION TIME RESERVED TO PRETABULATION
C-    (DEFAULT AND MINIMUM VALUES 0.1 NORMALLY, 0.3 FOR FORCED
C-    GENERATION OF HEAVY FLAVORS - SET EQUAL TO 1. IF NSIGMA > 0)
C- NDUMP = NO. OF EVENTS TO DUMP
C- NJUMP = NO. OF EVENTS JUMPED IN BETWEEN DUMPED EVENTS
C-
C- IPTWGT = 1 : EVENTS WEIGHTED BY FUNCTION PTWGT, = 0 : UNWEIGHTED
C-   (IPTWGT AUTOMATICALLY SET = 0 IF PTMGE .GT. PTMIN)
C- FRAGEH = APPROXIMATE FRACTION OF HARD EVENTS (ONLY FOR IPTWGT=1)
C- KMPSCA = NO. OF PARTON COLLISIONS PER EVENT --
C-    ADDITIONAL PARTON COLLISIONS ARE PURELY HADRONIC
C- IEVTYP = TYPE OF (FIRST) PARTON COLLISION
C-    1 - PURELY HADRONIC
C-    2 - Z PRODUCTION
C-    3 - W PRODUCTION
C-    4 - DRELL YAN PRODUCTION
C-    (DEFAULT 1)
C- IDECBO = Z/W/GM DECAY CHANNEL, AS SHOWN BELOW - IF 0 Z/W/GM IS LEFT
C-    UNDECAYED - IF A NEGATIVE INTEGER, DECAY CHANNEL IS CHOSEN AT RAND
C-    ACCORDING TO BR'S
C-    Z :
C-        1 - E-   E+
C-        2 - MU-  MU+
C-        3 - TAU- TAU+
C-        4 - NUE  NUEB
C-        5 - NUM  NUMB
C-        6 - NUT  NUTB
C-        7 - UP   UB
C-        8 - DN   DB
C-        9 - ST   SB
C-       10 - CH   CB
C-       11 - BT   BB
C-       12 - TP   TB
C-    W+ :
C-        1 - NUE  E+
C-        2 - NUM  MU+
C-        3 - NUT  TAU+
C-        4 - UP   DB
C-        5 - CH   SB
C-        6 - TP   BB
C-    W- : SAME CHANNEL NO.S AS FOR W+, WITH CHARGE CONJ. DECAY MODES
C-    DRELL YAN :
C-        1 - E-   E+
C-        2 - MU-  MU+
C-        3 - TAU- TAU+
C- LWIDTH = IF 0 W/Z WIDTH IS SET TO 0, IF 1 IT IS GIVEN THE STANDARD
C-    MODEL VALUE (DEFAULT 1)
C- LEPRAD = IF 0 E.M. RADIATIVE EFFECTS IN W/Z LEPTONIC DECAYS ARE
C-    NEGLECTED, IF 1 THEY ARE INCLUDED ACCORDING TO LAPORTA AND
C-    ODORICO, NP B266 (1986) 633 (O(ALPHA)+EXPONENTIATION), IF 2
C-    THEY ARE INCLUDED ACCORDING TO BERENDS AND KLEISS, LEIDEN
C-    PREPRINT (1983) (O(ALPHA) ONLY)
C- KYTQED = CONTROLS QED RADIATION IN TOP DECAYS. LIKE LEPRAD.
C-
C- KHADRO = IF 0 PARTICLE GENERATION IS INHIBITED, EXCEPT FOR
C-          Z/W/DY-LEPTONS
C- NODECY = IF .TRUE. ALL PRIMARY PARTICLES ARE NOT LET TO DECAY
      DATA ECM/630./,ALAMB/.2/,PTMIN/4.001/,PTMAX/0./,PT2INT/0.4/
      DATA SIGINL/0./
      DATA IPBAR/1/,PTMGE/0./,NFLAV/5/
      DATA TLEAVE/30./,NLEAVE/1000000000/,NSIGMA/0/,NDUMP/5/,NJUMP/1/
      DATA FRATAB/0.10/
      DATA IPTWGT/0/, FRAGEH/.5/
      DATA IEVTYP/1/,KMPSCA/1/
      DATA IDECBO/-100/,LWIDTH/1/,LEPRAD/1/,KYTQED/1/
      DATA KHADRO/1/,NODECY/.FALSE./,NOFRGM/.FALSE./
C
C-- QCD CASCADE PARAMETERS
C   ----------------------
C- QZ = NON-PERTURBATIVE CUTOFF FOR GLUONS AND LIGHT QUARKS
C- QZMASS( ) = SET EQUAL TO QMAS( ) IN SBLOCK (QUARK MASSES), USED TO
C- INCREASE NON-PERTURBATIVE CUTOFFS FOR HEAVY QUARKS
C- ***(1ST DIMENSION OF TABPSQ( , ) MUST BE .GE.(NO. OF DIFFERENT QUARK
C- ***MASSES + 1))
C- NCASC = MAX NO. OF CASCADES (PER PARTON CHANNEL) IN INITIAL PRETAB.
C- IZFAST = 1, FASTEST SECONDARY LEG IN A BRANCHING DEVELOPS FIRST (THE
C-    OTHER ONE DEVELOPS IN LEFTOVER PHASE-SPACE) -- OTHERWISE FIRST
C-    LEG TO DEVELOP IS CHOSEN AT RANDOM (DIFFERENCES IN THE RESULTS
C-    ARE MINIMAL) (FOR TIMELIKE CASCADES)
C- KEYBRE = 0 -- FULL QCD BREMS., 1 -- LONG. EFFECTS ONLY, 2 -- SCAL.
C-    VIOL. OF PARTON DENS. ONLY, 3 -- NO QCD BREMS. AT ALL
C- KYTQCD = CONTROLS QCD RADIATION IN TOP DECAYS. LIKE KEYBRE WITH
C-    THE VALUE 2 MISSING
      DATA QZ/3./
      DATA NCASC/100000/
      DATA IZFAST/0/
      DATA KEYBRE/0/,KYTQCD/0/
C
C-- DEFINE PROCEDURE IN CASE OF DIMENSION OVERFLOW
C-- (KOVER=1 -- PRINT DIAGNOSTICS, SET WEIGHT=0., AND GO ON FOR UP TO
C--  100 OVERFLOWS, AFTER WHICH DO AS FOR KOVER=-1)
C-- (KOVER=-1 -- PRINT DIAGNOSTICS AND STOP THROUGH PROVOCATED ERROR
C--  TO ACTIVATE MEMORY DUMP)
      DATA KOVER/1/
C
C-- CODING ARRAYS
      DATA IFCODE/1,-1,2,-2,3/
      DATA IMATCH/2,1,1,3*6,4, 1,2,1,3*6,4, 1,1,2,3*6,4,
     1            3*6,9,8,8,7, 3*6,8,9,8,7, 3*6,8,8,9,7,
     2            3*4,3*7,5/
      DATA IMATBO/0,1,2,4*0, 1,2*0,2,3*0, 2,2*0,1,3*0,
     1            0,2,1,4*0, 5*0,1,0,     4*0,1,2*0,
     2            7*0/
      DATA ICHRGQ/2,-1,-1,2,-1,2,0/
C-- INITIAL SETTINGS
      DATA WTYPE/' '/
      DATA KFORSL,LFORSL,NFORSL,NFORCE,NSTOPD,IFL/6*0/
      DATA XMIN/1./,ALQF/0./
      DATA RDECAY/352*20/
      DATA NEVENT/0/,NEVENB/0/
      DATA NQUAZ/0/,NJSETZ/0/
      DATA NEVOL/0/,KFRFLA/0/,KPRHEV/0/,NHVREJ/0/
      DATA NKINPT/0/
      DATA KEYS/10*.FALSE./
      DATA PMAS/352*0./,QMAS/6*0./
      DATA SPYC,SPYB,SPYT,SPYQ,SPYCEL,SPYBEL,SPYTEL/7*-1./
      DATA SPYOVR/-1./
      DATA FLAPRE/-1./
      DATA MNBOOK,MMBOOK,MNPART,MNQUA,MNCUEV,MNCUEJ,MNJTP,MNJSET,MNDEC
     */9*0/
      DATA KTPFRM/1/
      DATA WEAKBO/0./,BOMASS/-1./,IDECWK/0/,WIDTH/0./
      DATA KOPTWZ/1/,WZTHRS/-1./,DELTAR/-1./
C-- TAPE UNITS
      DATA ITDKY/1/,ITLIS/6/
      END
