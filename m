From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the v4l-dvb tree
Date: Thu, 17 May 2018 14:17:27 +1000
Message-ID: <20180517141727.3119e1da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VDskecHVq82fb9TxccKhCFK"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alan Cox <alan@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/VDskecHVq82fb9TxccKhCFK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/media/atomisp/TODO

between commit:

  51b8dc5163d2 ("media: staging: atomisp: Remove driver")

from the v4l-dvb tree and commit:

  1bd421154821 ("staging: atomisp: Augment TODO file with GPIO work item")

from the staging tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/VDskecHVq82fb9TxccKhCFK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlr9AlcACgkQAVBC80lX
0GwJLAf/VZ+BycYvK+7jWCqN9o/7YALaOwXxFdqD4XGhlJ9+RQCgwhyoNrP7maVR
U0rbFrAkUV83bqT5jupQCHMwd8xna9bquBLohfq6KYEvhA8e1ozAULsIQPiJNKD2
rQOjyQHK8Cmh/VLpeDECJbgFrotCC/D+ypfAxxWUEKbRg9ukZwRaFtE9eTKm3QbV
APJpX8pUNd6Xs/Ey24yyc8GTRRMhzIuLn6L3i75OdNlM2LwOmBgxftjbE2CRlvM3
8C+AqbHPxyFRsp66Bsz4yk82bo3tfsdY17SfvgQ3CB8YUAZBUulwNQzbiS4uwFb0
cchSwAyhyM2IbIwYwmjJVGnxNgWEzQ==
=hzCw
-----END PGP SIGNATURE-----

--Sig_/VDskecHVq82fb9TxccKhCFK--
