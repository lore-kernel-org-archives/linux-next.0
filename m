From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with the rdma-fixes tree
Date: Wed, 27 Jun 2018 10:07:26 +1000
Message-ID: <20180627100726.0092e8b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1OCkAc=bknYCZvLm7YUd7s2"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Leon Romanovsky <leonro@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/1OCkAc=bknYCZvLm7YUd7s2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/core/uverbs_cmd.c

between commit:

  940efcc8889f ("RDMA/uverbs: Protect from attempts to create flows on unsu=
pported QP")

from the rdma-fixes tree and commit:

  e99028ad76e7 ("RDMA/uverbs: Check existence of create_flow callback")

from the rdma tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/infiniband/core/uverbs_cmd.c
index 87ffeebc0b28,5fc14fde274c..000000000000
--- a/drivers/infiniband/core/uverbs_cmd.c
+++ b/drivers/infiniband/core/uverbs_cmd.c
@@@ -3559,11 -3554,11 +3554,16 @@@ int ib_uverbs_ex_create_flow(struct ib_
  		goto err_uobj;
  	}
 =20
 +	if (qp->qp_type !=3D IB_QPT_UD && qp->qp_type !=3D IB_QPT_RAW_PACKET) {
 +		err =3D -EINVAL;
 +		goto err_put;
 +	}
 +
+ 	if (!qp->device->create_flow) {
+ 		err =3D -EOPNOTSUPP;
+ 		goto err_put;
+ 	}
+=20
  	flow_attr =3D kzalloc(struct_size(flow_attr, flows,
  				cmd.flow_attr.num_of_specs), GFP_KERNEL);
  	if (!flow_attr) {

--Sig_/1OCkAc=bknYCZvLm7YUd7s2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsy1T4ACgkQAVBC80lX
0GyvCwf+NUrHCFgXKoyY1uGsJgyqvjNg3Me4Rnf6CcNiqLoayMim+nC17+gN6+OE
ssK4Cjr3EZvWXz+P+h0AMfTu2mQDtppqIYlvnhmSsqKZrjeL4XrUNLdcNFNnSgDL
PW59mFsNprLOKstL87t4khOTel8aJsK6Xughx6n/VI/ZBcOXpHBrBLdPVtKf1Qkp
PHIRi0EOBHb74MXUZPpK39q9kduQkLyz38tXHxkmVrKkczBnh6elavYA4QY2k2HW
4RolMP2xbnXNy+1GMcmy+RUBdzHyyur+sXtK6lZXwj0gSgivoezxI8PdsgfvERcb
6yBfFk4s21LNhzleXtBiO64G3pFuBQ==
=H7tt
-----END PGP SIGNATURE-----

--Sig_/1OCkAc=bknYCZvLm7YUd7s2--
