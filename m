From: Michael Neuling <mikey@neuling.org>
Subject: Re: [Patch next] powerpc: pseries/dtl.c should include asm/firmware.h
Date: Thu, 02 Apr 2009 11:34:03 +1100
Message-ID: <25834.1238632443@neuling.org>
References: <20090401164450.f8192631.sfr@canb.auug.org.au> <49D3419E.7000005@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bilbo.ozlabs.org ([203.10.76.25]:53471 "EHLO bilbo.ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760410AbZDBAeH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Apr 2009 20:34:07 -0400
In-reply-to: <49D3419E.7000005@in.ibm.com> 
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>
Cc: linuxppc-dev@ozlabs.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, jk@ozlabs.org

> randconfig build on powerpc failed with :
>=20
>=20
> arch/powerpc/platforms/pseries/dtl.c: In function =C2=91dtl_init=C2=92=
:
> arch/powerpc/platforms/pseries/dtl.c:238: error: implicit declaration=
 of func
tion =C2=91firmware_has_feature=C2=92
> arch/powerpc/platforms/pseries/dtl.c:238: error: =C2=91FW_FEATURE_SPL=
PAR=C2=92 undeclared
 (first use in this function)
> arch/powerpc/platforms/pseries/dtl.c:238: error: (Each undeclared ide=
ntifier=20
is reported only once
> arch/powerpc/platforms/pseries/dtl.c:238: error: for each function it=
 appears
 in.)
>=20
> Signed-off-by : Sachin Sant <sachinp@in.ibm.com>
> ---

It's great that you're sending patches to fix these issues but it's not
quite formatted as the maintainers like.

The patch needs to be included inline in the message, rather than as an
attachment.  You can see it as an attachment here:
  http://ozlabs.org/pipermail/linuxppc-dev/2009-April/070122.html
=2E. as opposed to the required inline format like this patch:
  http://ozlabs.org/pipermail/linuxppc-dev/2009-April/070120.html

Adding a diffstat would also be nice.

Mikey

>=20
>=20
>=20
> --------------050404090408000502010008
> Content-Type: text/x-patch;
>  name=3D"fix-dtl-build-break.patch"
> Content-Transfer-Encoding: 8bit
> Content-Disposition: inline;
>  filename=3D"fix-dtl-build-break.patch"
>=20
> * Fixes the following build error
> *
> * arch/powerpc/platforms/pseries/dtl.c: In function =E2=80=98dtl_init=
=E2=80=99:
> * arch/powerpc/platforms/pseries/dtl.c:238:
> *       error: implicit declaration of function =E2=80=98firmware_has=
_feature=E2=80=99
> * arch/powerpc/platforms/pseries/dtl.c:238:
> *       error: =E2=80=98FW_FEATURE_SPLPAR=E2=80=99 undeclared (first =
use in this function)
> * arch/powerpc/platforms/pseries/dtl.c:238:
> *        error: (Each undeclared identifier is reported only once
> * arch/powerpc/platforms/pseries/dtl.c:238:=20
> *        error: for each function it appears in.)
>=20
> Signed-off-by : Sachin Sant <sachinp@in.ibm.com>
> ---
>=20
> diff -Naurp a/arch/powerpc/platforms/pseries/dtl.c b/arch/powerpc/pla=
tforms/p
series/dtl.c
> --- a/arch/powerpc/platforms/pseries/dtl.c	2009-04-01 15:46:59.000000=
000 +
0530
> +++ b/arch/powerpc/platforms/pseries/dtl.c	2009-04-01 15:47:58.000000=
000 +
0530
> @@ -25,6 +25,7 @@
>  #include <asm/smp.h>
>  #include <asm/system.h>
>  #include <asm/uaccess.h>
> +#include <asm/firmware.h>
> =20
>  #include "plpar_wrappers.h"
> =20
>=20
> --------------050404090408000502010008
> Content-Type: text/plain; charset=3D"us-ascii"
> MIME-Version: 1.0
> Content-Transfer-Encoding: 7bit
> Content-Disposition: inline
>=20
> _______________________________________________
> Linuxppc-dev mailing list
> Linuxppc-dev@ozlabs.org
> https://ozlabs.org/mailman/listinfo/linuxppc-dev
> --------------050404090408000502010008--
>=20
