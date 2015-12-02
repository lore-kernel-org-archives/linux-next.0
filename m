From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the v4l-dvb tree with the arm-soc tree
Date: Wed, 2 Dec 2015 13:36:26 +0000
Message-ID: <20151202133626.c5d9729eb0ffa811fb1ebe8e@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__2_Dec_2015_13_36_26_+0000_iCp=0bhJ6r6/RPFb"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57704 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932108AbbLBNgh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2015 08:36:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

--Signature=_Wed__2_Dec_2015_13_36_26_+0000_iCp=0bhJ6r6/RPFb
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Today's linux-next merge of the v4l-dvb tree got a conflict in
arch/arm/mach-pxa/palmz72.c, arch/arm/mach-pxa/palmtreo.c and
arch/arm/mach-pxa/mioa701.c between commit 4c25c5d2985c1 ("ARM:
pxa: make more mach/*.h files local") from the arm-soc tree and commit a71d=
aaa10ec2e325f ("[media] move media platform data to
linux/platform_data/media") from the v4l-dvb tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

diff --cc arch/arm/mach-pxa/mioa701.c
index a315f6e3c4a6,ccfd2b63c6a4..000000000000
--- a/arch/arm/mach-pxa/mioa701.c
+++ b/arch/arm/mach-pxa/mioa701.c
@@@ -52,9 -52,9 +52,9 @@@
  #include <linux/platform_data/keypad-pxa27x.h>
  #include <linux/platform_data/video-pxafb.h>
  #include <linux/platform_data/mmc-pxamci.h>
 -#include <mach/udc.h>
 -#include <mach/pxa27x-udc.h>
 +#include "udc.h"
 +#include "pxa27x-udc.h"
- #include <linux/platform_data/camera-pxa.h>
+ #include <linux/platform_data/media/camera-pxa.h>
  #include <mach/audio.h>
  #include <mach/smemc.h>
  #include <media/soc_camera.h>
diff --cc arch/arm/mach-pxa/palmtreo.c
index b2aae54bed42,2dc56062fb7e..000000000000
--- a/arch/arm/mach-pxa/palmtreo.c
+++ b/arch/arm/mach-pxa/palmtreo.c
@@@ -43,8 -43,8 +43,8 @@@
  #include <linux/platform_data/usb-ohci-pxa27x.h>
  #include <mach/pxa2xx-regs.h>
  #include <linux/platform_data/asoc-palm27x.h>
- #include <linux/platform_data/camera-pxa.h>
+ #include <linux/platform_data/media/camera-pxa.h>
 -#include <mach/palm27x.h>
 +#include "palm27x.h"
 =20
  #include <sound/pxa2xx-lib.h>
 =20
diff --cc arch/arm/mach-pxa/palmz72.c
index abba86f3e254,e3df17a7e8d4..000000000000
--- a/arch/arm/mach-pxa/palmz72.c
+++ b/arch/arm/mach-pxa/palmz72.c
@@@ -44,12 -44,12 +44,12 @@@
  #include <linux/platform_data/video-pxafb.h>
  #include <linux/platform_data/irda-pxaficp.h>
  #include <linux/platform_data/keypad-pxa27x.h>
 -#include <mach/udc.h>
 +#include "udc.h"
  #include <linux/platform_data/asoc-palm27x.h>
 -#include <mach/palm27x.h>
 +#include "palm27x.h"
 =20
 -#include <mach/pm.h>
 +#include "pm.h"
- #include <linux/platform_data/camera-pxa.h>
+ #include <linux/platform_data/media/camera-pxa.h>
 =20
  #include <media/soc_camera.h>
 =20

--Signature=_Wed__2_Dec_2015_13_36_26_+0000_iCp=0bhJ6r6/RPFb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWXvPaAAoJECTWi3JdVIfQfiYH/13rubXwmraVpY3toTKYEJnX
TAlYcICZuHh9vrnZ66p6l1j+DokgsuVtAuGVeaMOY9GfR/Uuhs64Pf6usIIENYnB
I2lE+GwQqJdVNirOolTsdkI4xDr1t2AJoqjXHC5doFGyr52gImQ8RoieStt27BlN
TDQLkjMjuGq9ZJbZPNgD6tPnHU0QNM/Et+Mht4esgnz2UhOlR4BIjHl+fw3pMOSJ
ARp6UFqb+yNAMaRSJCL5vgMayYJj1f1jMTAZGN0tGiZhxsAtzaShdY3k81CfxBFp
7hG0G9BPIfz7VtemljRUlu2jC418nSm/7cOVR0/TAIrUXhnFVfGQPkw1C9PyeW0=
=Vqlk
-----END PGP SIGNATURE-----

--Signature=_Wed__2_Dec_2015_13_36_26_+0000_iCp=0bhJ6r6/RPFb--
