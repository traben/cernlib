*
* $Id: ctq2opf.F,v 1.1.1.2 1996/10/30 08:27:44 cernlib Exp $
*
* $Log: ctq2opf.F,v $
* Revision 1.1.1.2  1996/10/30 08:27:44  cernlib
* Version 7.04
*
* Revision 1.1.1.1  1996/04/12 15:29:09  plothow
* Version 7.01
*
*
#include "pdf/pilot.h"
C     Version 2 CTEQ distribution function in a parametrized form.
C By: J. Botts, H.L. Lai, J.G. Morfin, J.F. Owens, J. Qiu, W.K. Tung & H. Weerts
C
C  To avoid the proliferation of parton distribution functions, we recommend
C  that
C  these distributions should replace Version 1 CTEQ distributions for all
C  general
C  usage. The differences between the two sets of distributions, as briefly
C  described below, do not significantly affect most applications for
C  fixed-target
C  and hadron-collider applications.
C
C  Both CTEQ1 and CTEQ2 distributions fit existing DIS, Drell-Yan and Direct
C  photon
C  data with excellent chi-squares. They represent two distinct ways to resolve
C  the inconsistency between CCFR and NMC measurements on F2 at small-x and the
C  neutrino dimuon measurements of s(x), as discovered by the CTEQ1 analysis:
C  in the CTEQ1 analysis, the F2 measurements of CCFR and NMC are taken
C   seriously,
C  leaving out the dimuon information on s(x); whereas in the CTEQ2 analysis,
C   the
C  latest CCFR NLO dimuon analysis of s(x) is used (within errors) as input
C   while
C  leaving out the small-x F2 data which conflict with this input. The small-x
C  behavior of the parton distributions are contrained in the latter case by the
C  newly released HERA data.  For details, see our forthcoming paper.
C
C     This file contains three versions of the same CTEQ2 parton distributions:
C
C Two "front-end" subprograms:
C     FUNCTION   Ctq2OPf  (Iset, Iparton, X, Q, Irt)
C                           returns the PROBABILITY density for a GIVEN flavor;
C     SUBROUTINE Ctq2OPs (Iset, Pdf, XX, QQ, Irt)
C                       returns an array of MOMENTUM densities for ALL flavors;
C One lower-level subprogram:
C     FUNCTION Ctq2OPd (Iset, Iprtn, XX, QQ, Irt)
C           returns the MOMENTUM density of a GIVEN valence or sea distribution.
C Supplementary functions to return the relevant QCD parameters and other
C information concerning these distributions are also included (see below).
C
C     Since this is an initial distribution of version 2, it is
C     useful for the authors to maintain a record of the distribution list in
C     case there are revisions or corrections.
C     In the interest of maintaining the integrity of this package,
C     please do not freely distribute this program package; instead, refer any
C     interested colleagues to direct their request for a copy to:
C     Botts@hades.ifh.de or Lai@cteq11.pa.msu.edu

C If you have detailed questions concerning these CTEQ2 distributions, direct
C inquires to Botts, Lai (see above) or Wu-Ki Tung (Tung@msupa.pa.msu.edu).

C     -------------------------------------------
C     Detailed instructions follow.

C     Name convention for CTEQ distributions:  CTEQnSx  where
C           n : version number                      (currently n = 2)
C           S : factorization scheme label: = [M D L] for [MS-bar DIS LO]
C               resp.
C           x : special characteristics, if any
C            (e.g. S(F) for singular (flat) small-x, L for "LEP lambda value")

C    Explanation of functional arguments:

C    Iset is the set label; in this version, Iset = 1, 2, 3, 4, 5, 6
C                           correspond to the following CTEQ global fits:

C          cteq2M  : best fit in the MS-bar scheme
C          cteq2MS : singular small-x
C          cteq2MF : flat small-x
C          cteq2ML : large lambda (Lambda(5) = 220 MeV)

C          cteq2L  : best fit in Leading order QCD

C          cteq2D  : best fit in the DIS scheme

C   Iprtn  is the parton label (6, 5, 4, 3, 2, 1, 0, -1, ......, -6)
C                          for (t, b, c, s, d, u, g, u_bar, ..., t_bar)

C   X, Q are the usual x, Q;
C   Irt is a return error code (see individual modules for explanation).
C
C     ---------------------------------------------
C --> QCD parameters for parton distribution set Iset can be obtained inside
C         the user's program by:
C     Dum = PrCtq2O
C    >        (Iset, Iord, Ischeme, MxFlv,
C    >         Alam4, Alam5, Alam6, Amas4, Amas5, Amas6,
C    >         Xmin, Qini, Qmax, ExpNor)
C     where all but the first argument are output parameters.
C     They should be self-explanatory -- see details under ENTRY PrCtq2O.

C  Since the QCD Lambda value for the various sets are needed more often than
C  the other parameters in most applications, a special function
C     Wlamd2O (Iset, Iorder, Neff)                    is provided
C  which returns the lambda value for Neff = 4,5,6 effective flavors as well as
C  the order these values pertain to.

C     ----------------------------------------------
C     The range of (x, Q) used in this round of global analysis is, approxi-
C     mately,  0.01 < x < 0.75 ; and 4 GeV^2 < Q^2 < 400 GeV^2 for fixed target
C     experiments and 0.0001 < x < 0.01 from first official data of HERA.

C    The range of (x, Q) used in the reparametrization of the QCD evolved
C    parton distributions is 10E-5 < x < 1 ; 1.6 GeV < Q < 1 TeV.  The
C    functional form of this parametrization is:

C      A0 * x^A1 * (1-x)^A2 * (1 + A3 * x^A4) * [log(1+1/x)]^A5

C   with the A'coefficients being smooth functions of Q.  For heavy quarks,
C   a threshold factor is applied to A0 which simulates the proper Q-dependence
C   of the QCD evolution in that region according to the renormalization
C   scheme defined in Collins-Tung, Nucl. Phys. B278, 934 (1986).

C   Since this function is positive definite and smooth, it provides sensible
C   extrapolations of the parton distributions if they are called beyond
C   the original range in an application. There is no artificial boundaries
C   or sharp cutoff's.
C    ------------------------------------------------

      FUNCTION Ctq2OPf  (Iset, Iparton, X, Q, Irt)

C   This function returns the CTEQ parton distributions f^Iset_Iprtn/proton
C   --- the PROBABILITY density

C   (Iset, Iparton, X, Q): explained above;

C    Irt : return error code: see module Ctq2OPd for explanation.

C     IMPLICIT DOUBLE PRECISION (A-H, O-Z)
C+SEQ, IMPDP.

      Ifl = Iparton
      JFL = ABS(Ifl)
C                                                             Valence
      IF (Ifl.Eq.1 .or. Ifl.Eq.2) THEN
        VL = Ctq2OPd (Iset, Ifl, X, Q, Irt)
      ELSE
        VL = 0.
      ENDIF
C                                                             Sea
      SEA = Ctq2OPd (Iset, -JFL, X, Q, Irt)
C                                              Full (probability) Distribution
      Ctq2OPf  = (VL + SEA) / X

      Return
C                         *************************
      END
