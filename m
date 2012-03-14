From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (arm-soc
 tree related)
Date: Thu, 15 Mar 2012 10:59:01 +1100
Message-ID: <20120315105901.7b10c9f4de9374a613436988@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__15_Mar_2012_10_59_01_+1100_U5VFoU_AFfkY1o5U"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Walle <michael@walle.cc>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__15_Mar_2012_10_59_01_+1100_U5VFoU_AFfkY1o5U
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (powerpc
allmodconfig) failed like this:

drivers/ata/sata_mv.c:4185:1: error: '__mod_of_device_table' aliased to und=
efined symbol 'mvsdio_dt_ids'

Caused by commit f1e1e148c5cb ("ARM: kirkwood: sata_mv: add device tree
binding").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Thu__15_Mar_2012_10_59_01_+1100_U5VFoU_AFfkY1o5U
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPYTDFAAoJEECxmPOUX5FEBGIQAIvorg+dCoOegf47h/iQoyu4
PV0gngbzTTMIO0lWL7jnQxbqne2ZhkwtbwDCW4A3R+FDLj7U6Prw0Mtlrr25acX2
T3U9/6qchLuVw6M2bGflyXHKsQBdEnDP5vTb4ZzoFA+LHnuFzTOH9jqvnkGSIdBD
ESP6/h4ZtC7h2GKVPM4njnHOHCgo53Q/opg79CsqZ+UO3T37cMFRhlYiJ5ZFWfwX
DKGDBV3pL3S1MVe+vPKvyKnZGavn44QOdSPwD7sjrpZ2+Iz2M6Qu8+ske8WuDhoN
/uUCeOA0UOTAbNPP8NnjD9DqmvMm9hI8xlDvyYc4K/VPgySWT1kdvUov/AcayqG7
anR6HXuyf3SX3jYym3iUfuBCEOZDQYqpIq2DdWM8WkJc5w2uftm5oZez/plBlLkE
fwXg7Ed/0/YLlWm5OhoPjml3tRriev05r2wASH3w7lvVS4Hm6r1ndp5rXt/dYvqU
tnQ5xSb/FUWjzpKtCBQskVvvzlpoGZuL/eZG8Nv4mxGg0fPj63e+dwEyd8ME+AlG
N2H2IyBdOQNF7DYYSbV9t0+cxNrKzs/Eqqx23Kdr9equVy9wP4yHPwmKX61O9gh3
w4v1dVRf0z4QZc/KiK5oQjWPuGuxpUu4avuqST5R9GGB4r/DYhQu1S+/5Bes9fa7
/lYP/ck+m/VVkL11nPKE
=f0Su
-----END PGP SIGNATURE-----

--Signature=_Thu__15_Mar_2012_10_59_01_+1100_U5VFoU_AFfkY1o5U--
