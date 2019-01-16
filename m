From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the v4l-dvb tree
Date: Thu, 17 Jan 2019 08:02:48 +1100
Message-ID: <20190117080248.6f26b8fc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_B7K4PT4YEFOcVN4J6y=5Xy"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: linux-next.vger.kernel.org

--Sig_/_B7K4PT4YEFOcVN4J6y=5Xy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

[I am experimenting with checking the Fixes tags in commits in linux-next.
Please let me know if you think I am being too strict.]

Hi Mauro,

Commit

  961304d17a61 ("media: dt-bindings: media: i2c: Fix i2c address for OV5645=
 camera sensor")

has a malformed Fixes tag.

The subject in the Fixes tag is usually surrounded by (" and ").

--=20
Cheers,
Stephen Rothwell

--Sig_/_B7K4PT4YEFOcVN4J6y=5Xy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw/m/gACgkQAVBC80lX
0Gw7lAf+L1EVf1ZqsEhsfzzNyjD0kxf/zFmqGC/S3+YrjwUOA498RvswZdM39veC
pwxL5M9ZrzOEUqamf5mxqpAoqBz+Gy8jevv7QnLbmSAZ2DZGCAZbScGyoge2M26O
KRa4AnHL9e9hBRJl63F6He9RAdbJAaT4aKwFtw/pu+nSV48B4kTlWZzRZoraMDiz
Qv7Aic87G/k/a8X67jsI9KqVOi3mpOVkDpo/sgW97aY0OANz+FCPZst/GOpsk7ic
F4uBomatvO5PlSFzrM1rq9q7Ahquef79JmDZwHsG4vp/mgL8sRclsGcc6Vc/hzH2
0AXeAiUDhMJIE8zm1ZlaKZG+MXTSlg==
=7daM
-----END PGP SIGNATURE-----

--Sig_/_B7K4PT4YEFOcVN4J6y=5Xy--
