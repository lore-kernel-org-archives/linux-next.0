From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the imx-mxs tree
Date: Tue, 23 Apr 2019 08:45:01 +1000
Message-ID: <20190423084501.15824b18@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gEokQ+0QF4RgqbAyZFJpool"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Fabio Estevam <festevam@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/gEokQ+0QF4RgqbAyZFJpool
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the imx-mxs tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/boot/dts/imx7d-zii-rpu2.dts:46.12-50.4: Warning (io_channels_prope=
rty): /iio-hwmon: Missing property '#io-channel-cells' in node /soc/aips-bu=
s@30400000/adc@30610000 or bad phandle (referred from io-channels[0])

Caused by commit

  69ab5392f517 ("ARM: dts: Add support for ZII i.MX7 RPU2 board")

--=20
Cheers,
Stephen Rothwell

--Sig_/gEokQ+0QF4RgqbAyZFJpool
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly+Q+0ACgkQAVBC80lX
0GyIsggAo75ay3PgqQ0OwkeFeB9Dq1ZztKdAc2wkfr6+bM3f19sNnzqyDMWhCY7M
HUL4hFCLotb2Puj6KdtA1ygwSi6fB5t/d6Iq+OIWzlDU2smhXYeXMA/PGQ5DGFwY
2KE+RbzCJvEPnCCPDqd2iKgHmK1RhpgsXPIXp244Bq03ekdl5AlkiPXQcVGuzPjc
96pPI7cKwhvcBFDlxJ48LjJ8sRgJlAFCnlQQun2cc+N33QRJYjSF3l0XTnmQ60MM
liHiKTGSOF9Uh7VRbpu6T3XDcUm4vcfrgiiZxkNK9x5v2kyBb8ebOEIlOPMdgIVx
Gq5Y9kfp5lcn39SG0BQHVbP50uU3EQ==
=u3EY
-----END PGP SIGNATURE-----

--Sig_/gEokQ+0QF4RgqbAyZFJpool--
