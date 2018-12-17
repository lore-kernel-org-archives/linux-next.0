From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the mfd tree
Date: Mon, 17 Dec 2018 16:38:58 +1100
Message-ID: <20181217163858.099428ad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VgN_NUCJtzMpivRt4VDof3K"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Keerthy <j-keerthy@ti.com>, Sebastian Reichel <sebastian.reichel@collabora.com>
List-Id: linux-next.vger.kernel.org

--Sig_/VgN_NUCJtzMpivRt4VDof3K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mfd tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/mfd/tps65218.c: In function 'tps65218_probe':
drivers/mfd/tps65218.c:247:3: error: label 'err_irq' used but not defined
   goto err_irq;
   ^~~~

Caused by commit

  05ba643fa2ce ("mfd: tps65218: Use devm_regmap_add_irq_chip and clean up e=
rror path in probe()")

I have used the mfd tree from next-20181214 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/VgN_NUCJtzMpivRt4VDof3K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwXNnIACgkQAVBC80lX
0GyHwgf8D0NZxXYySDWUpahKbTIy6PrD+Ah+49QgpAsOn9SrluxZki/v1PoLO57a
W3jC0jqvVSQHS2bi4WkgW9tgKjb94I1wsb3lvVblPUg6C3A/QsORuXLLXTlAzx8M
uXl8KKUYzg4mRUgc98H9OixDCyJYh7Jubv/HJzQn/q0mF4BJ3FQMqGsmFcb/8PZB
8afFfQP9eoGcQEHFEM4+QreBzIu1MnP8Tv1S2gZpP2JzrYhIIsldHvptPgHdUoFH
07Is1K7h7H0UYrI1ShDH+2i5oEBja7D/mdZlOwBSCydNSiFsYz1HI6MDGZEai3/P
cU3TyVFypB88CM5EuSx/ndfxa3QS8g==
=/5hz
-----END PGP SIGNATURE-----

--Sig_/VgN_NUCJtzMpivRt4VDof3K--
