From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the v4l-dvb-fixes tree
Date: Mon, 26 Feb 2018 09:50:31 +1100
Message-ID: <20180226095031.74f46e71@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/kLnQLeJoDsenAWekz+/8sDx"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/kLnQLeJoDsenAWekz+/8sDx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

After merging the v4l-dvb-fixes tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

WARNING: modpost: missing MODULE_LICENSE() in drivers/media/common/videobuf=
2/vb2-trace.o
see include/linux/module.h for more information

Exposed by commit

  e77c31ed60d1 ("media: videobuf2: fix build issues with vb2-trace")

--=20
Cheers,
Stephen Rothwell

--Sig_/kLnQLeJoDsenAWekz+/8sDx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqTPbcACgkQAVBC80lX
0GzgWAf/bLpHttIwBEkhY3WzbVDzC9d6E2QFPBJupnBuLk8mHXl0iNTppXyG5Iq/
EvTb+xNbQRDKvwMFhHZbKpku8ew96QK40mFYLfIXQBY8eHs+jOnrK+dRjae/MJeQ
hrcejHitaT5y0RiLjo2CFnuFspXR2jD4/5IafVpkSe5zXxNV79WsUOdmrX2mcZkU
VNGTK2cIyUuqVfCpC1E51oVeCQ1vUsEtc6RtM4we5PIuhI0/dPWDWZyoBLIQHDJY
4aomOWy1ltSiyljJM9X2Ko3v+4I8TTeJTSPSpuKwxt10HbRKS9p3W7minbwl/aXC
E3kYnSqRsDqhkXccFAbC85bFWvlKlw==
=bfBj
-----END PGP SIGNATURE-----

--Sig_/kLnQLeJoDsenAWekz+/8sDx--
