From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with the nfs-anna tree
Date: Mon, 24 Dec 2018 14:13:52 +1100
Message-ID: <20181224141352.461303be@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ZiqOiSW+DWuqJF10AK2ju+9"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Anna Schumaker <Anna.Schumaker@Netapp.com>, Trond Myklebust <trondmy@gmail.com>, NFS Mailing List <linux-nfs@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chuck Lever <chuck.lever@oracle.com>, Kamal Heib <kamalheib1@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ZiqOiSW+DWuqJF10AK2ju+9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  net/sunrpc/xprtrdma/fmr_ops.c

between commit:

  d31f8deac38d ("xprtrdma: Remove support for FMR memory registration")

from the nfs-anna tree and commit:

  3023a1e93656 ("RDMA: Start use ib_device_ops")

from the rdma tree.

I fixed it up (the former removed the file, so I did that) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZiqOiSW+DWuqJF10AK2ju+9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwgTvAACgkQAVBC80lX
0GzP5Qf/TSckfmIpZ0ub/Q/xz/cTlbLYXfLcjUR7cFYw/tWmGILGer262rFKyInQ
EkJSJIDlC1J4j8kCyRUn2jXT7XUovFLv1yT6Q+cEpl4PAAsGnTCM+H/FTDAHj3r4
egiVxbJDigkFuFUHAJYlxLw6KUqwZ2QPvpj9fhSG+5TKgeQ97hi9DvGvodh4ABRa
2MkYpa8gEPeh2AdYEeUzJ6EJXxqIDa6QIqhg/uSUcbzKKKxcZAg1r3C3qUOTt/re
6sWb/3H6Lc2iO+pE+ALnOYvsay9Rh1A/LdAICygMklVg04HFKpBKOQy6XR2JPy+8
XPbfaX/PoPd/n9lsBBMDdHbjiQDZ5A==
=e/Po
-----END PGP SIGNATURE-----

--Sig_/ZiqOiSW+DWuqJF10AK2ju+9--
