From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the kbuild tree
Date: Mon, 6 May 2019 09:46:09 +1000
Message-ID: <20190506094609.08e930f2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/CR4+aiKReV8EW1m/Ae3tHph"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexey Gladkov <gladkov.alexey@gmail.com>, Keshava Munegowda <keshava_mgowda@ti.com>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/CR4+aiKReV8EW1m/Ae3tHph
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

After merging the kbuild tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from include/linux/module.h:18,
                 from drivers/mfd/omap-usb-tll.c:21:
drivers/mfd/omap-usb-tll.c:462:26: error: expected ',' or ';' before 'USBHS=
_DRIVER_NAME'
 MODULE_ALIAS("platform:" USBHS_DRIVER_NAME);
                          ^~~~~~~~~~~~~~~~~
include/linux/moduleparam.h:26:47: note: in definition of macro '__MODULE_I=
NFO'
   =3D __MODULE_INFO_PREFIX __stringify(tag) "=3D" info
                                               ^~~~
include/linux/module.h:164:30: note: in expansion of macro 'MODULE_INFO'
 #define MODULE_ALIAS(_alias) MODULE_INFO(alias, _alias)
                              ^~~~~~~~~~~
drivers/mfd/omap-usb-tll.c:462:1: note: in expansion of macro 'MODULE_ALIAS'
 MODULE_ALIAS("platform:" USBHS_DRIVER_NAME);
 ^~~~~~~~~~~~

Caused by commit

  6a26793a7891 ("moduleparam: Save information about built-in modules in se=
parate file")

USBHS_DRIVER_NAME is not defined and this kbuild tree change has
exposed it. It has been this way since commit

  16fa3dc75c22 ("mfd: omap-usb-tll: HOST TLL platform driver")

=46rom v3.7-rc1 in 2012.

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 6 May 2019 09:39:14 +1000
Subject: [PATCH] mfd: omap: remove unused MODULE_ALIAS from omap-usb-tll.c

USBHS_DRIVER_NAME has never been defined, so this cannot have ever
been used.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/mfd/omap-usb-tll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
index 446713dbee27..1cc8937e8bec 100644
--- a/drivers/mfd/omap-usb-tll.c
+++ b/drivers/mfd/omap-usb-tll.c
@@ -459,7 +459,7 @@ EXPORT_SYMBOL_GPL(omap_tll_disable);
=20
 MODULE_AUTHOR("Keshava Munegowda <keshava_mgowda@ti.com>");
 MODULE_AUTHOR("Roger Quadros <rogerq@ti.com>");
-MODULE_ALIAS("platform:" USBHS_DRIVER_NAME);
+// MODULE_ALIAS("platform:" USBHS_DRIVER_NAME);
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("usb tll driver for TI OMAP EHCI and OHCI controllers");
=20
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/CR4+aiKReV8EW1m/Ae3tHph
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzPdcEACgkQAVBC80lX
0GxRtgf/e4cAutpXCFPWNpdmLJnz0yR+k9CtPgawB6u1/5hoPk0nFrY6BSHplimw
R86/j8j4hVk03/XwtcaSFisjnzUgiNIM8+yVUMVYGtom+3xK/4yEn6PlWwYrl0HQ
lnizluSirfMH8ud7QqWxm2MqlCnVRSWJb3u+3JsiIcJCbKr723Us3HIKJZKh+S/u
+qw9zlpc9sU97BAY0nTxtUQTUuALqxPf/jyWz9gGOyvauumswYCos1JkUxs3ihj6
ha+ZIrygWOufUqtlaD5soxj1lGMvJayvv+tznMpA3EPlP0cQNl1GQHlT/ZUNLbxm
VjXqChR6XiteulrDomTgyTyIiI3ZeA==
=R5xM
-----END PGP SIGNATURE-----

--Sig_/CR4+aiKReV8EW1m/Ae3tHph--
