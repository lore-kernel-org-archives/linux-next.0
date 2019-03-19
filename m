From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the mmc tree
Date: Tue, 19 Mar 2019 12:15:51 +1100
Message-ID: <20190319121551.14cbea26@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/RmII10Z40D161utywWTc15="; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>
List-Id: linux-next.vger.kernel.org

--Sig_/RmII10Z40D161utywWTc15=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mmc tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/mmc/host/dw_mmc.c: In function 'dw_mci_wait_hw_unbusy':
drivers/mmc/host/dw_mmc.c:239:16: warning: unused variable 'irqflags' [-Wun=
used-variable]
  unsigned long irqflags;
                ^~~~~~~~

Introduced by commit

  705a0f288113 ("mmc: dw_mmc: Add hardware unbusy interrupt support")

--=20
Cheers,
Stephen Rothwell

--Sig_/RmII10Z40D161utywWTc15=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyQQscACgkQAVBC80lX
0GzqDwf/T9CQ7of/d/SVo8uI5ZyIY0C1wvKQpXSVq0dPX9zFDdNX2WEfLlKMME0p
DBfihbPlBCXMumrlaEAVcYU2cDQwVqzrcJaydXWfk8F4G8foP1Jl31Ocau4TIsnz
wWP7nje6CI/u94lpCQ0nL7sbITj+DFD9SAwoyXPe5/T3RgrrbOhHE8bJZICbA5KV
zcGaAW0EmQq/FDoNTgkfDP9ceVX6MSsDyZuc//3QwthEBislgwjnlN6az6LYTrH1
5uyT9Mapn9fFkIYiyylqBU/cNcBg1adwMKm16+C0WOeDknyG90a3fZ1crpZUmffm
KgGn80+tVC/3D05dIkzymwYh+7sIuQ==
=wbSG
-----END PGP SIGNATURE-----

--Sig_/RmII10Z40D161utywWTc15=--
