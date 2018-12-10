From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the v4l-dvb tree
Date: Mon, 10 Dec 2018 16:53:51 +1100
Message-ID: <20181210165351.0976c1f8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mt+iqN82aymKltl3QQK8+IE"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>, Colin Ian King <colin.king@canonical.com>
List-Id: linux-next.vger.kernel.org

--Sig_/mt+iqN82aymKltl3QQK8+IE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/media/tegra-vde/tegra-vde.c

between commit:

  91dc5e91edf7 ("media: staging: tegra-vde: Replace debug messages with tra=
ce points")

from the v4l-dvb tree and commit:

  9483804a725a ("media: staging: tegra-vde: print long unsigned using %lu f=
ormat specifier")

from the staging tree.

I fixed it up (the former removed the code updated by the latter, so I
did that) and can carry the fix as necessary. This is now fixed as far
as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/mt+iqN82aymKltl3QQK8+IE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwN/28ACgkQAVBC80lX
0GwU5ggAoJPT0uHIP4eu2lYmOFyhI7q+GZtNz8JZr7FHY0pdGclpF/Qzd1NPko5w
XaktE9coLcwRKOyzDE8MXQ9nSghVDVghK3y2FHmd+W6AhnDm5Q3AAiRX6bgc+0Er
YJZjk/kdPJE/4E5aQGWqDjzWUsqyIUfU3s4SCY6xpNIKjbJRcQ8EnS6Rm8vQjsnn
Uo2ah41mSZphMjSBd0zFzfg5FpQrCX90PwVNu40WIeAbVZfE9jJDtz7yvvVf9FGY
tZC+4+rKSzEG0r7Q90hqXr8eu8iXP7CS23hwBj9zHbBX2VJhcjAuJkf2Sl67MVMd
9CEW8xmOIlrFxp8x+FIBV1uJaeiL/A==
=uGek
-----END PGP SIGNATURE-----

--Sig_/mt+iqN82aymKltl3QQK8+IE--
