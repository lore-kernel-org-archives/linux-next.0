From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the net-next tree
Date: Fri, 1 Feb 2019 07:35:53 +1100
Message-ID: <20190201073553.742ec57b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/S12qAWD6jV+QVQr2h6xSvrI"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Huazhong Tan <tanhuazhong@huawei.com>, Peng Li <lipeng321@huawei.com>
List-Id: linux-next.vger.kernel.org

--Sig_/S12qAWD6jV+QVQr2h6xSvrI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  9fc55413270f ("net: hns3: fix improper error handling in the hclge_init_a=
e_dev()")

Fixes tag

  Fixes: 288475b2ad01 ("{topost} net: hns3: refine umv space allocation")

has these problem(s):

  - Target SHA1 does not exist

I can't even find it by simple searches for the subject ...

--=20
Cheers,
Stephen Rothwell

--Sig_/S12qAWD6jV+QVQr2h6xSvrI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxTXCkACgkQAVBC80lX
0Gxhngf9FKIehBrEVoYr4sGGy/mNTpCNov8jsP5bHQWyjGKH8wDsvg0jLB27nDDv
FbajKS1lFA/2MXMc4k7nB0FoHPVlQ6rnliHId30YOJqQq3z5PKTMVo5050TvgGgR
iMwQVdyjj2O5vdrLCNP0f8s5P3O0Bp9CP8tRj7G2+ajscd3VLtu78mB8d+sOtaux
cmTVLDG9Uxtn3eM2koYd18qEMKhFdhj2qAiuoUpWHM/KGqHw3tQ+RzDe5g0sqDPU
NnEymkXbxfThEZnI9Yv7g3RBGk7G+G9P/U1F1STH4obTsVmzVvpK66OVBaGEVrdt
gRCvBRk//kgSMrqKx0XM2PE/2f27Jw==
=1XpU
-----END PGP SIGNATURE-----

--Sig_/S12qAWD6jV+QVQr2h6xSvrI--
