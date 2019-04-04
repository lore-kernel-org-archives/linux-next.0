From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the at91 tree with the at91-fixes tree
Date: Fri, 5 Apr 2019 09:15:19 +1100
Message-ID: <20190405091519.48aa4098@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bS0DsbD3k/Dgz/eh1700zt+"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Peng Hao <peng.hao2@zte.com.cn>, Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: linux-next.vger.kernel.org

--Sig_/bS0DsbD3k/Dgz/eh1700zt+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the at91 tree got a conflict in:

  arch/arm/mach-at91/pm.c

between commit:

  ba5e60c9b75d ("arm/mach-at91/pm : fix possible object reference leak")

from the at91-fixes tree and commit:

  c3f5b8fde71f ("ARM: at91: pm: introduce at91_soc_pm structure")

from the at91 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm/mach-at91/pm.c
index 2a757dcaa1a5,5571658b3c46..000000000000
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@@ -620,10 -676,8 +676,10 @@@ static int __init at91_pm_backup_init(v
  	return 0;
 =20
  securam_fail:
 +	put_device(&pdev->dev);
 +securam_fail_no_ref_dev:
- 	iounmap(pm_data.sfrbu);
- 	pm_data.sfrbu =3D NULL;
+ 	iounmap(soc_pm.data.sfrbu);
+ 	soc_pm.data.sfrbu =3D NULL;
  	return ret;
  }
 =20

--Sig_/bS0DsbD3k/Dgz/eh1700zt+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlymgfcACgkQAVBC80lX
0GyPowgAhuq7czn+9VRhS9GwHQlBbt0Ko0+qKjQKfc4Czbi97g+DYoO8cZqUnrIm
u52MSWHJ8DIXq/2fu24Fk2za3WsUwp6GmXAiCma1UBhftY0zDoc9hOd9G/S3vORV
9DiYLuvO949odXaQyufRJHeMdS20OY2Gb2BENgSB8p0R/xjssmLwbQdLow3KPrli
zKEvMZP5LEKn8pkR8E252yQmYhHFtAucw2n00iNDJGz/aLYI/8zOCEl03W4AXSmj
D+F95JSWbrm2ReIvpixVN9GfiQSm2V2+Jxnyx1ijlAiweVJ4ZVKPYT2jRbznbaIt
tHm0+iJS0a/fYLWrDJ0MFBW8pUaVUg==
=GQmp
-----END PGP SIGNATURE-----

--Sig_/bS0DsbD3k/Dgz/eh1700zt+--
