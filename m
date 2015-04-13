From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Date: Mon, 13 Apr 2015 13:05:57 +1000
Message-ID: <20150413130557.75fc7f0f@canb.auug.org.au>
References: <20150410201143.4adb51b0@canb.auug.org.au>
	<2431868.FjHG917i2e@avalon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/j3okhGV2l4CU+mO.RpgH4_v"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47414 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752542AbbDMDGD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 12 Apr 2015 23:06:03 -0400
In-Reply-To: <2431868.FjHG917i2e@avalon>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hyun Kwon <hyun.kwon@xilinx.com>, Radhey Shyam Pandey <radheys@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, Hans Verkuil <hans.verkuil@cisco.com>

--Sig_/j3okhGV2l4CU+mO.RpgH4_v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Fri, 10 Apr 2015 15:45:11 +0300 Laurent Pinchart <laurent.pinchart@ideas=
onboard.com> wrote:
>
> On Friday 10 April 2015 20:11:43 Stephen Rothwell wrote:
> > Hi Mauro,
> >=20
> > After merging the v4l-dvb tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> >=20
> > drivers/media/platform/xilinx/xilinx-dma.c:15:35: fatal error:
> > linux/amba/xilinx_dma.h: No such file or directory #include
> > <linux/amba/xilinx_dma.h>
> >                                    ^
> >=20
> > Caused by commit df3305156f98 ("[media] v4l: xilinx: Add Xilinx Video
> > IP core").
> >=20
> > I have reverted that commit (and the 2 following it) for today.
>=20
> linux/amba/xilinx_dma.h has been moved to linux/dma/xilinx_dma.h by
>=20
> commit 937abe88aea3161cd3a563e577fc9cf4522c7aad
> Author: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
> Date:   Mon Mar 2 23:24:24 2015 +0530
>=20
>     dmaengine: xilinx-dma: move header file to common location
>    =20
>     This patch moves the xilinx_dma.h header file
>     to the include/linux/dma.
>    =20
>     Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
>     Signed-off-by: Vinod Koul <vinod.koul@intel.com>
>=20
> Could you update the path instead of reverting the commits ?

I applied this:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 13 Apr 2015 12:48:27 +1000
Subject: [PATCH] v4l: xilinx: fix for include file movement

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/media/platform/xilinx/xilinx-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/pla=
tform/xilinx/xilinx-dma.c
index 10209c294168..efde88adf624 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -12,7 +12,7 @@
  * published by the Free Software Foundation.
  */
=20
-#include <linux/amba/xilinx_dma.h>
+#include <linux/dma/xilinx_dma.h>
 #include <linux/lcm.h>
 #include <linux/list.h>
 #include <linux/module.h>
--=20
2.1.4


Someone needs to tell Linus when the merge happens.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/j3okhGV2l4CU+mO.RpgH4_v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVKzKZAAoJEMDTa8Ir7ZwV1zkP/1IppVMyoQR/FUBAz7L2cHwX
/gDwOZvyE6Vz9jwwoZ/V4bTgIOKm3y9bpl8091WJdFQ+iSj7jliHm7aSKY7aEZsP
JWgIVz///XjzwcLIUSqeQKfKo0zZvruOUVRpg7MP14/klRpfNCIUwtGgNUZkHpIH
kLiMA+CcddwcIfAI4r1P16m4NfYb/GNPXzgDp0fmtzVy+5hKxDFvyIJ6cWm9a+yM
RPqXTaFQNp/btyLgLEct7OEXy3/fosDa56HpXtBPP3l4rLzca2lHyTTsEKNqZ4lK
Wmi+vmL2yeGIBDE3zL/5ukAYn7ie5KvgDvcoMKRtesbnkz9xMX6xCYkAlrG+F0en
RDUHumUMdLc+3Q5fTFLW06Ul30UC+NrGntWrfBvMkpLF1rJvPXGkk6xAHbORYpCy
xuP/DJqHCsl9Ye5R8KgsEnYh7Pt9d60G3fL0f+sfPAfhiIsKepD5BoEfab+LnRO/
l6CjflQvmM9wW4bs8sfZfLLSxlJB99r2acEnzQlVgaeDIScQp74dlLUlg3zoihsg
EyTFVhPE0fhfAtTK9mAImbXKO5DdSiRhfORR+VTsMJR+Vh5kiWU3Dd8CAxiSh/pa
CSUWOCxFfD0GR/hqSPHXk5kO3egCuDHVqVF8+y5J2l9+3YkC77hd8uqdvD5ettQp
WLXpJoBW3dAimi8fo99m
=WcQJ
-----END PGP SIGNATURE-----

--Sig_/j3okhGV2l4CU+mO.RpgH4_v--
