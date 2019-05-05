From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the kbuild tree
Date: Mon, 6 May 2019 09:35:53 +1000
Message-ID: <20190506093553.29bae34c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/dKOG3wgtOe87O4AvhMc3+p0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexey Gladkov <gladkov.alexey@gmail.com>, Tarun Kanti DebBarma <tarun.kanti@ti.com>, Tony Lindgren <tony@atomide.com>
List-Id: linux-next.vger.kernel.org

--Sig_/dKOG3wgtOe87O4AvhMc3+p0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

After merging the kbuild tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from include/linux/module.h:18,
                 from drivers/clocksource/timer-ti-dm.c:40:
drivers/clocksource/timer-ti-dm.c:973:26: error: expected ',' or ';' before=
 'DRIVER_NAME'
 MODULE_ALIAS("platform:" DRIVER_NAME);
                          ^~~~~~~~~~~
include/linux/moduleparam.h:26:47: note: in definition of macro '__MODULE_I=
NFO'
   =3D __MODULE_INFO_PREFIX __stringify(tag) "=3D" info
                                               ^~~~
include/linux/module.h:164:30: note: in expansion of macro 'MODULE_INFO'
 #define MODULE_ALIAS(_alias) MODULE_INFO(alias, _alias)
                              ^~~~~~~~~~~
drivers/clocksource/timer-ti-dm.c:973:1: note: in expansion of macro 'MODUL=
E_ALIAS'
 MODULE_ALIAS("platform:" DRIVER_NAME);
 ^~~~~~~~~~~~

Caused by commit

  6a26793a7891 ("moduleparam: Save information about built-in modules in se=
parate file")

DRIVER_NAME is not defined and this kbuild tree change has exposed it.
It has been this way since commit

  df28472a1b28 ("ARM: OMAP: dmtimer: platform driver")

=46rom v3.2-rc1 in 2011.

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 6 May 2019 09:26:24 +1000
Subject: [PATCH] arm: omap: remove unused MODULE_ALIAS from timer-ti-dm.c

DRIVER_NAME has never been defined, so this cannot have ever been used.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/clocksource/timer-ti-dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-ti-dm.c b/drivers/clocksource/timer-=
ti-dm.c
index ee8ec5a8cb16..b357bd56ba63 100644
--- a/drivers/clocksource/timer-ti-dm.c
+++ b/drivers/clocksource/timer-ti-dm.c
@@ -970,5 +970,5 @@ module_platform_driver(omap_dm_timer_driver);
=20
 MODULE_DESCRIPTION("OMAP Dual-Mode Timer Driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:" DRIVER_NAME);
+// MODULE_ALIAS("platform:" DRIVER_NAME);
 MODULE_AUTHOR("Texas Instruments Inc");
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/dKOG3wgtOe87O4AvhMc3+p0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzPc1kACgkQAVBC80lX
0Gxr1Af8DKZ9JrIfv7exUvhT8Rcv4g4bDS9JEsr7MXHdqV9DckXWJWm1AKuUtdtr
mV4dDMj/P9xuQ6eJJWxXC9VM8nA5Z/GCgj/+BJaSZdQrcZjE3Q+keaef/yZH9bNG
BpCn2dtVLqXtMphYL5gCR3AZ/MZMr+/pZVcLH5P048In7Y/4nvSUCuuIzOnDJSJ1
cKbDrOaBC4zzfYemVRvUOFMfxgvC2NnZDtfnAuK9tUxLDCe+ROzVl7s4ABoMTm1X
IsLDl65ver+SXOsSp3AXtx6xdGXAdeGl9Mv+uamTsOEEQSYhgAwh68cG2Ag5MBKD
E0KSY5kgeu5BPcnSvK7h2BvFRuSmZQ==
=1jHs
-----END PGP SIGNATURE-----

--Sig_/dKOG3wgtOe87O4AvhMc3+p0--
