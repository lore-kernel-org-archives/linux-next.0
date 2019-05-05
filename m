From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the kbuild tree
Date: Mon, 6 May 2019 08:40:36 +1000
Message-ID: <20190506084036.5b6f9118@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NzQYtNnh15ga6P8Xh8q/xgA"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexey Gladkov <gladkov.alexey@gmail.com>, "G, Manjunath Kondaiah" <manjugk@ti.com>, Tony Lindgren <tony@atomide.com>
List-Id: linux-next.vger.kernel.org

--Sig_/NzQYtNnh15ga6P8Xh8q/xgA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

After merging the kbuild tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from include/linux/module.h:18,
                 from arch/arm/plat-omap/dma.c:28:
arch/arm/plat-omap/dma.c:1452:26: error: expected ',' or ';' before 'DRIVER=
_NAME'
 MODULE_ALIAS("platform:" DRIVER_NAME);
                          ^~~~~~~~~~~
include/linux/moduleparam.h:26:47: note: in definition of macro '__MODULE_I=
NFO'
   =3D __MODULE_INFO_PREFIX __stringify(tag) "=3D" info
                                               ^~~~
include/linux/module.h:164:30: note: in expansion of macro 'MODULE_INFO'
 #define MODULE_ALIAS(_alias) MODULE_INFO(alias, _alias)
                              ^~~~~~~~~~~
arch/arm/plat-omap/dma.c:1452:1: note: in expansion of macro 'MODULE_ALIAS'
 MODULE_ALIAS("platform:" DRIVER_NAME);
 ^~~~~~~~~~~~

Presumably caused by commit

  6a26793a7891 ("moduleparam: Save information about built-in modules in se=
parate file")

(since that is the only change from Friday, I thnk)

DRIVER_NAME is not defined and this kbuild tree change has exposed it.  It =
has been this way since commit

  f31cc9622d75 ("OMAP: DMA: Convert DMA library into platform driver")

=46rom v2.6.38-rc1 in 2012.

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 6 May 2019 08:35:02 +1000
Subject: [PATCH] arm: omap: remove unused MODULE_ALIAS from dma.c

DRIVER_NAME has nevern been defined, so this cannot have ever been used.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/arm/plat-omap/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/plat-omap/dma.c b/arch/arm/plat-omap/dma.c
index d4012d6c0dcb..4c6d9f4b43b7 100644
--- a/arch/arm/plat-omap/dma.c
+++ b/arch/arm/plat-omap/dma.c
@@ -1449,7 +1449,7 @@ static void __exit omap_system_dma_exit(void)
=20
 MODULE_DESCRIPTION("OMAP SYSTEM DMA DRIVER");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:" DRIVER_NAME);
+// MODULE_ALIAS("platform:" DRIVER_NAME);
 MODULE_AUTHOR("Texas Instruments Inc");
=20
 /*
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/NzQYtNnh15ga6P8Xh8q/xgA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzPZmQACgkQAVBC80lX
0GyDwAf/SgYmPrtTF8+iUUauV0KdwI6l+a4qYYskl9tAgfH/axW6hQVf26j0aIic
55u/4T7IXQjAec6jxmv7XDxr2DVxh2P5T3SdSXk8cK8lwCRhSMsVi+IewcHerYaN
4Ckfh+oXYu90R9I+CjduPY8hKerB+90BUPHcW9fbNHO24iiuI+K+rYGzV1q5RuJV
AhYau2ZgLUg+yUcc6g7waN4LDdiop1yClQP8oF5wwavQk8jaIQGGJDO6cmejJ8U6
AUlYQePyun88mHa8Sk55h5NOxA1YWkygNHYEn+coQnjtGiVDc9pvbqK6Y0w7UeIo
H7kh7+4X7CJf3wQ9QpGpq8mA8OtuTw==
=k50I
-----END PGP SIGNATURE-----

--Sig_/NzQYtNnh15ga6P8Xh8q/xgA--
