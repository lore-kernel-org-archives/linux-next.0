From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the f2fs tree with the vfs-fixes tree
Date: Mon, 14 May 2018 10:26:24 +1000
Message-ID: <20180514102624.76a4097e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/FX.w_LXXhlF0lvk7cs3ZkZe"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaegeuk Kim <jaegeuk@kernel.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Biggers <ebiggers@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/FX.w_LXXhlF0lvk7cs3ZkZe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the f2fs tree got a conflict in:

  fs/f2fs/namei.c

between commit:

  1e2e547a93a0 ("do d_instantiate/unlock_new_inode combinations safely")

from the vfs-fixes tree and commit:

  ab3835aae642 ("f2fs: call unlock_new_inode() before d_instantiate()")

from the f2fs tree.

I think that the vfs-fixes commit supercedes the f2fs tree one, so I
used that.

I fixed it up (see above) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/FX.w_LXXhlF0lvk7cs3ZkZe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlr417AACgkQAVBC80lX
0Gz5jQf8C2tM5iK7+efIUHPm6akWsXQDm/r3u2VCOemVNDfrPlev2BGdyC+N9pg0
RS1j9t3/05nk6O4ut809zFiVXDOwiM2Tutk/QLvcWpIHZXn6YRXv/KdxuXNiB8eO
qKQQzstkNEwDtqWdGou4txXK3WqQzpxsNNElfPbYQJ/82zJCfwPoB9LnJjyWEGcp
5uGgvBOHnf30D+6aLCvWzKBNTJffVvnELiL+4v5NOIsF7H2ia1n2xMIUvFeR0sG9
ohvAwGEICWvGu+JmBPJOvsJGf5Hxb7rYJAyf/tcQNx/T9kpmlG7EJ7wf/bTP+MVa
SWPTg4LInuo50Shz2pbUbIae/iCwQg==
=Qvv4
-----END PGP SIGNATURE-----

--Sig_/FX.w_LXXhlF0lvk7cs3ZkZe--
