From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the at91 tree
Date: Thu, 28 Mar 2019 07:31:25 +1100
Message-ID: <20190328073125.0e5a5668@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_aTV00d2J2HYQum21.OJM4q"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/_aTV00d2J2HYQum21.OJM4q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  080eb452bdc8 ("ARM: dts: at91: sama5d2_xplained: Add proper regulator sta=
tes for suspend-to-mem")
  2802bac0b675 ("ARM: dts: at91: sama5d2: add labels to soc dtsi for deriva=
tive boards")
  0c0fccec0545 ("ARM: at91: pm: do not disable/enable PLLA for ULP modes")
  9e35b518b8b2 ("ARM: at91: pm: disable RC oscillator in ULP0")
  1b86244a4d5e ("ARM: at91: pm: add ULP1 support for SAM9X60")
  0017bace228b ("ARM: at91: pm: add support for per SoC wakeup source confi=
guration")
  3201145a666b ("ARM: at91: pm: keep at91_pm_backup_init() only for SAMA5D2=
 SoCs")
  24c2ac08869b ("ARM: at91: pm: initial PM support for SAM9X60")
  0b072b0e1bd6 ("dt-bindings: arm: atmel: add binding for SAM9X60 SoC")
  783d37b06ad4 ("ARM: at91: pm: introduce at91_soc_pm structure")

are missing a Signed-off-by from their committers.

Rebasing will do that ...

--=20
Cheers,
Stephen Rothwell

--Sig_/_aTV00d2J2HYQum21.OJM4q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyb3Z0ACgkQAVBC80lX
0GzlYAf+LUJM5k2K633dhFHvMeEqgr5MqBcKHV/HUoPWsqlJpBVY1mVLdDldBdVs
WOi2l7Dyr8+clUzbdDdef903NNkcA7Pg8+lI2r1lzhz8GtuXhKE1sWU02FRb9XiJ
4mp0588tmKNpXE8AOxz0tecfnSZIJ/tkXmspc7dNCy9mhD4AC3EvbKeQa1qrK2Zv
r8Vg+LxuAtJ3G49+tM+4vh+Okhx7ZAF4IcgVy8CxSZZYWBoicLEQdaqzA4p9B3LF
DKq62PiMubPpf/yGKrDeMK6o6zXScPJy/zrT7Rdq9w1Q1fSlDU7BKEZ8TzdLlZgk
lBYfWSE7nFBxWQK8uQdaWJnO2qcy6g==
=xgyq
-----END PGP SIGNATURE-----

--Sig_/_aTV00d2J2HYQum21.OJM4q--
