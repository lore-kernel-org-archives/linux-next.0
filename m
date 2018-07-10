From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with the rdma-fixes tree
Date: Tue, 10 Jul 2018 11:17:40 +1000
Message-ID: <20180710111740.5f345088@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Te+p1LKerFUhZtZMfBnBc/9"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Leon Romanovsky <leonro@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Te+p1LKerFUhZtZMfBnBc/9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/core/uverbs_cmd.c

between commit:

  4fae7f170416 ("RDMA/uverbs: Fix slab-out-of-bounds in ib_uverbs_ex_create=
_flow")

from the rdma-fixes tree and commit:

  2cc1e3b80942 ("IB/uverbs: Replace file->ucontext with file in uverbs_cmd.=
c")

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
index cc06e8404e9b,d048cabc4246..000000000000
--- a/drivers/infiniband/core/uverbs_cmd.c
+++ b/drivers/infiniband/core/uverbs_cmd.c
@@@ -3559,11 -3505,11 +3505,16 @@@ int ib_uverbs_ex_create_flow(struct ib_
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
@@@ -3583,15 -3529,13 +3534,15 @@@
  	flow_attr->flags =3D kern_flow_attr->flags;
  	flow_attr->size =3D sizeof(*flow_attr);
 =20
 -	kern_spec =3D kern_flow_attr + 1;
 +	kern_spec =3D kern_flow_attr->flow_specs;
  	ib_spec =3D flow_attr + 1;
  	for (i =3D 0; i < flow_attr->num_of_specs &&
 -	     cmd.flow_attr.size > offsetof(struct ib_uverbs_flow_spec, reserved)=
 &&
 -	     cmd.flow_attr.size >=3D
 -	     ((struct ib_uverbs_flow_spec *)kern_spec)->size; i++) {
 -		err =3D kern_spec_to_ib_spec(file, kern_spec, ib_spec, uflow_res);
 +			cmd.flow_attr.size >=3D sizeof(*kern_spec) &&
 +			cmd.flow_attr.size >=3D kern_spec->size;
 +	     i++) {
 +		err =3D kern_spec_to_ib_spec(
- 				file->ucontext, (struct ib_uverbs_flow_spec *)kern_spec,
++				file, (struct ib_uverbs_flow_spec *)kern_spec,
 +				ib_spec, uflow_res);
  		if (err)
  			goto err_free;
 =20

--Sig_/Te+p1LKerFUhZtZMfBnBc/9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltECTQACgkQAVBC80lX
0Gwx0wf/T1xiq4+0+/x3zkIaiz4fgpeOo7TCASY5+s3c+UBoxI9ZvLyWKaqiE3Z+
wrRnEAckCBYX78e0BDFXVkj+2Ca03/e+9WRxeoC5eYYvbujXAeE4ySmGxXfjO18B
G6QINMvKxPdilfxLfH5SofdViJiVs5TlGxOKoOjo0IaHZJcgY2gx9wOHmeIdNjeI
VJs2CYK8law/Gmx+3Zc1xIqNnsA3iUi4WNSeoyNPv8Aki8gMblFGs6mXThLHn1UT
Hf3jfC6Q7hy7L4Fnnl0TiPg+oKgJBTVWMjThSalRJVnuhgmoRmLdJbEAyZTi3ema
6/PAewnTtEkBRFUY8y2XcaPy/oarTw==
=lZby
-----END PGP SIGNATURE-----

--Sig_/Te+p1LKerFUhZtZMfBnBc/9--
