From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the overlayfs tree with Linus' tree
Date: Mon, 4 Jun 2018 10:31:04 +1000
Message-ID: <20180604103042.43fe18fe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ObuA55/wXhkXoZl=D3CUkEq"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
List-Id: linux-next.vger.kernel.org

--Sig_/ObuA55/wXhkXoZl=D3CUkEq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Miklos,

Today's linux-next merge of the overlayfs tree got a conflict in:

  fs/open.c

between commit:

  af04fadcaa93 ("Revert "fs: fold open_check_o_direct into do_dentry_open"")

from Linus' tree and commit:

  e0e3f7de6435 ("vfs: simplify dentry_open()")

from the overlayfs tree.

I have no idea how to fix this up ... so I just used the overlayfs
version for now.  I assume that this will need more work before being
merged into Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ObuA55/wXhkXoZl=D3CUkEq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsUiEgACgkQAVBC80lX
0Gx/eAf+MVEZvCWUex0LVL9GBbwVQBVfNghccQM4gMc1VMQ5T8TXYpcdn2muQmRP
8LIH5lB86d52AbtM6EfOiH/g2+0yz1rFehjd5tgM1kZMPR0JB/DsWUlcPAyEHPUQ
jJlO2cdXVxz5knCTbXLKATQRurPxBsq68xHzDMr0mH1LFS/LspWgDr81spG+3k3T
w/tCIkXkxL1Sk75nx9GChTCAaVngWcC6yqvw3/uKcJ+zvjTrIVZUcLXqpgrLvar3
LX81nN6G3xXqbuFDaRlXOz9SNcVnmy8/Xn26R1PqNoSMvOKwSJ97DQ6Wx+HQ/aOm
cNCZCmmU+bIbGyhqHFOqIoznkiUl/w==
=XTWb
-----END PGP SIGNATURE-----

--Sig_/ObuA55/wXhkXoZl=D3CUkEq--
