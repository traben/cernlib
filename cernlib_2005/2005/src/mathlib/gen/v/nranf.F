*
* $Id: nranf.F,v 1.1.1.1 1996/04/01 15:02:54 mclareni Exp $
*
* $Log: nranf.F,v $
* Revision 1.1.1.1  1996/04/01 15:02:54  mclareni
* Mathlib gen
*
*
#include "gen/pilot.h"
#if (!defined(CERNLIB_CDC))&&(!defined(CERNLIB_VAX)||defined(CERNLIB_FORTRAN))
      SUBROUTINE NRAN(VECTOR,N)
      DIMENSION VECTOR(N)
      DO 100 I=1,N
      VECTOR(I) = RNDM(I)
  100 CONTINUE
      RETURN
      END
      SUBROUTINE NRANIN (V)
      CALL RDMIN(V)
      RETURN
      END
      SUBROUTINE NRANUT (V)
      CALL RDMOUT(V)
      RETURN
      END
#endif
