From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Wed, 7 Dec 2011 10:52:52 +1100
Message-ID: <20111207105252.25156be522cc26b520eac8f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__7_Dec_2011_10_52_52_+1100_hUws5Zn40Fw8ZpLX"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, Lauri Hintsala <lauri.hintsala@bluegiga.com>, Shawn Guo <shawn.guo@linaro.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__7_Dec_2011_10_52_52_+1100_hUws5Zn40Fw8ZpLX
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

Today's linux-next merge of the arm-soc tree got conflicts in
arch/arm/mach-mxs/mach-m28evk.c and
arch/arm/mach-mxs/mach-stmp378x_devb.c between commit d4e717535e94 ("ARM:
restart: mxs: use new restart hook") from the arm tree and commit
8d2d2d1d7e96 ("ARM: mxs: fix machines' initializers order") from the
arm-soc tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mach-mxs/mach-m28evk.c
index 7799cd9,6b00577..0000000
--- a/arch/arm/mach-mxs/mach-m28evk.c
+++ b/arch/arm/mach-mxs/mach-m28evk.c
@@@ -361,7 -361,6 +361,7 @@@ static struct sys_timer m28evk_timer =3D=20
  MACHINE_START(M28EVK, "DENX M28 EVK")
  	.map_io		=3D mx28_map_io,
  	.init_irq	=3D mx28_init_irq,
- 	.init_machine	=3D m28evk_init,
  	.timer		=3D &m28evk_timer,
+ 	.init_machine	=3D m28evk_init,
 +	.restart	=3D mxs_restart,
  MACHINE_END
diff --cc arch/arm/mach-mxs/mach-stmp378x_devb.c
index 857e857,6834dea..0000000
--- a/arch/arm/mach-mxs/mach-stmp378x_devb.c
+++ b/arch/arm/mach-mxs/mach-stmp378x_devb.c
@@@ -115,7 -115,6 +115,7 @@@ static struct sys_timer stmp378x_dvb_ti
  MACHINE_START(STMP378X, "STMP378X")
  	.map_io		=3D mx23_map_io,
  	.init_irq	=3D mx23_init_irq,
- 	.init_machine	=3D stmp378x_dvb_init,
  	.timer		=3D &stmp378x_dvb_timer,
+ 	.init_machine	=3D stmp378x_dvb_init,
 +	.restart	=3D mxs_restart,
  MACHINE_END

--Signature=_Wed__7_Dec_2011_10_52_52_+1100_hUws5Zn40Fw8ZpLX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJO3qrUAAoJEECxmPOUX5FE+LoP/A7ACnJXayTXkVxoPjX97c8I
7iBXkzTJ2EtER81cOzicRqp6gCBmFfv5cK1qRy521GAWkE84Rq0yEid3m88lqyn9
BKmqu2/jixDGUXAPap4cT2Ms1hyEeDJR3jNjqSh4ilXJi63CHQoLuxMXjF/0RxoV
I8DD6izt8R1vYue2jBQmXjZzOgbK6SC8WyWgu2MhaHCj7/Hr0O3L/JrMdyofyl7I
xuVSxHGxb6AQfENZtiO7t6P4fLlnnKAmmVYOdsn7iFy4TeUwTc4XB6+mXA9le6KT
Ui9p0Awe5HvSNpPOZJg3EOzE6f+gqt3L/T3CW6F68jnbMPHWtLFZAUR6HSjVI/tJ
ijXAtuKJlZBqRuBOgRtlhIjQ7l1OMS02c6ZNiLkfs2D0khTduWlxoL8i/+PO1beM
TMd/qWg3q17TNFuQ1w0nRj6p//g+TR8vVEJYUuNPLYwrQExjakzjbmoV+dkeNc4Y
/oxptlVpzREmjs9XQyekqdzIu4WZdEN1XOolygG0qRsP6UbC1S5jVhbNml1VwFQn
K5t98Xb3vuTLqPajHcBluU/uoiXzeBpIDDsJXB9mt95gRAezXsk4c8bR4j7wAmQP
exC7YavKM+IbCwetw5mWVihoGXNU9nLyplyy7ne5yuc6VUAYL7VNTpX1Y/XVR0Zc
H+PO4zwp5upMvln+NnhW
=BNDp
-----END PGP SIGNATURE-----

--Signature=_Wed__7_Dec_2011_10_52_52_+1100_hUws5Zn40Fw8ZpLX--
