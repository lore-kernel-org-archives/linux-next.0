From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nfs-anna tree with the nfs tree
Date: Fri, 22 Feb 2019 10:23:40 +1100
Message-ID: <20190222102340.3298742c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/8y0o.51I1gOnmRaJ+ngAOPT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Anna Schumaker <Anna.Schumaker@Netapp.com>, Trond Myklebust <trondmy@gmail.com>, NFS Mailing List <linux-nfs@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/8y0o.51I1gOnmRaJ+ngAOPT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nfs-anna tree got a conflict in:

  fs/nfs/pagelist.c

between commit:

  df3accb84960 ("NFS: Pass error information to the pgio error cleanup rout=
ine")

from the nfs tree and commit:

  7517d01d20e1 ("FS: Pass error information to the pgio error cleanup routi=
ne")

from the nfs-anna tree.

I fixed it up (I just use the former version (since there are
other changes to this file in that tree)) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

There are a few common patches (as differetn commits) in these 2 trees,
so one should be cleaned up, please.

--=20
Cheers,
Stephen Rothwell

--Sig_/8y0o.51I1gOnmRaJ+ngAOPT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxvMvwACgkQAVBC80lX
0GxtXwf/R9n7ATjU16gHD2JUuETP140yf0RXsfcAR5m/W8fecSuKyPbPyD6DKJLs
mHRseG32w/pBZl+chE2gNGE0FgxHbzuBT2iE4iYx664jJ2AscdPoL0MU9FpbTRNu
Bk4njvTgBlR6hVsy2ttM9jUkWyT/UYQxhDm8oCtAZb37GDTOrvEE4HSNdI0iAXqD
YZfEm+f+NIXwnkoZkJfUNNqMEzEItFXdJKjdimQlnsAERE7U1B7tbGMwZDNwrL+o
g5/+GgZmBXd8dYx0xBZIwT+l2FRjqRNm1I2zovpPYZz7mj7VuWvaq3GLzsV7YVv6
NfAFIxGu60kCIIamYYppapYRqvCAKA==
=sBbd
-----END PGP SIGNATURE-----

--Sig_/8y0o.51I1gOnmRaJ+ngAOPT--
