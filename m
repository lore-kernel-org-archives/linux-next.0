From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the devicetree tree
Date: Thu, 11 Apr 2019 07:27:58 +1000
Message-ID: <20190411072758.4fa7b9a8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/LQokV/iAjCunMV7O7o+hXwJ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: linux-next.vger.kernel.org

--Sig_/LQokV/iAjCunMV7O7o+hXwJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rob,

In commit

  7800990023f4 ("of: use correct function prototype for of_overlay_fdt_appl=
y()")

Fixes tag

  Fixes: commit 39a751a4cb7e ("of: change overlay apply input data from unf=
lattened to FDT")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/LQokV/iAjCunMV7O7o+hXwJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyuX94ACgkQAVBC80lX
0GyX+Af9HttUtYMG3UDHyUHqYx5Zr/yb8Y9lDg9zvZaCVaL3XW4ddRTY4sOVhHdp
R8ghiyfyqvgk63ZFvRLIA1DHBPoPyrhOgHNZ8sMU4pwnDfYTZDtixck1bRl/524w
1x+lRqWCCD6RCLPfpy12Rms90Gl7UQ6CD8Xm6CFYtOUm97eQTUizzw8ugE9HCOmq
0tTqIUuYPjSqcBbkl2fOTeiPfqfhw9Nn+FeEZWjrGXcCPpPygXsRfdr7U3XoqzKx
TUtYftGqaVqcIUAaVp81KDFzyAJNof4UUd09ROmEmuRSvDjYydGfNYE4kDT1JD9G
jedBFTr8BpsHV5OR+Y0XDEVncD0OjQ==
=pVTM
-----END PGP SIGNATURE-----

--Sig_/LQokV/iAjCunMV7O7o+hXwJ--
