From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Date: Mon, 6 Aug 2018 12:01:31 +1000
Message-ID: <20180806120131.169f70f3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Zj.KEDY3uN5lYsg_mN5C6Ol"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/Zj.KEDY3uN5lYsg_mN5C6Ol
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/core/uverbs_main.c

between commit:

  1eb9364ce81d ("IB/uverbs: Fix ordering of ucontext check in ib_uverbs_wri=
te")

from Linus' tree and commit:

  a9b66d6453d7 ("IB/uverbs: Do not block disassociate during write()")

from the rdma tree.

I fixed it up (I am not entirely sure this is correct, but see below) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/infiniband/core/uverbs_main.c
index 2094d136513d,6f62146e9738..000000000000
--- a/drivers/infiniband/core/uverbs_main.c
+++ b/drivers/infiniband/core/uverbs_main.c
@@@ -748,24 -758,8 +758,18 @@@ static ssize_t ib_uverbs_write(struct f
  		return ret;
 =20
  	srcu_key =3D srcu_read_lock(&file->device->disassociate_srcu);
- 	ib_dev =3D srcu_dereference(file->device->ib_dev,
- 				  &file->device->disassociate_srcu);
- 	if (!ib_dev) {
- 		ret =3D -EIO;
- 		goto out;
- 	}
 =20
 +	/*
 +	 * Must be after the ib_dev check, as once the RCU clears ib_dev =3D=3D
 +	 * NULL means ucontext =3D=3D NULL
 +	 */
 +	if (!file->ucontext &&
 +	    (command !=3D IB_USER_VERBS_CMD_GET_CONTEXT || extended)) {
 +		ret =3D -EINVAL;
 +		goto out;
 +	}
 +
- 	if (!verify_command_mask(ib_dev, command, extended)) {
+ 	if (!verify_command_mask(file, command, extended)) {
  		ret =3D -EOPNOTSUPP;
  		goto out;
  	}

--Sig_/Zj.KEDY3uN5lYsg_mN5C6Ol
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltnq/sACgkQAVBC80lX
0Gy5gAf9GksJSgpLQ8wN/vpyH5Z7wrL/lg+4FQ0z64925H9MwXl9/ysskiR3m6oh
BuPGCn6xZbeJfEpwPY8d2Fc0kSvHnzIxfl6M67ePxpM1nx1MsUyNXheq1NtJ3oGt
tG7WW1L2VLWfoPApBsZN8719L/ADPyl3p2ik96f7qgduzNWX0H714RELgNUesY1A
a8PE2IjN7pfnzJWA0WjRN2HhU4kmqH9kFggkYZfLNXBtbjKcs8zyn4F5l8S3WgaI
f5bRw2EVdFop1KKff0ff+mgfVHH1Tj/X3B8226v2NTlQZpYsrlbd9KuG0Bm4zSkW
C0V2X2UULzYBb6yjkC8Fo10EXkR0dQ==
=lEbX
-----END PGP SIGNATURE-----

--Sig_/Zj.KEDY3uN5lYsg_mN5C6Ol--
