From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the net-next tree
Date: Fri, 19 Oct 2018 11:18:05 +1100
Message-ID: <20181019111805.28860f73@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/25FRB+FpKCG6tOkPrliMHXx"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Bloch <markb@mellanox.com>, Leon Romanovsky <leonro@mellanox.com>, Paul Blakey <paulb@mellanox.com>, Saeed Mahameed <saeedm@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/25FRB+FpKCG6tOkPrliMHXx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/infiniband/hw/mlx5/flow.c: In function 'mlx5_ib_handler_MLX5_IB_MET=
HOD_CREATE_FLOW':
drivers/infiniband/hw/mlx5/flow.c:163:12: error: 'struct mlx5_flow_act' has=
 no member named 'has_flow_tag'; did you mean 'flow_tag'?
   flow_act.has_flow_tag =3D true;
            ^~~~~~~~~~~~
            flow_tag

Caused by commit

  d5634fee245f ("net/mlx5: Add a no-append flow insertion mode")

interacting with commit

  ba4a41198324 ("RDMA/mlx5: Add support for flow tag to raw create flow")

from the rdma tree.

I have applied the following merge fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 19 Oct 2018 11:10:39 +1100
Subject: [PATCH] net/mlx5: fix up for has_flow_tag changing to a flag

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/infiniband/hw/mlx5/flow.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/mlx5/flow.c b/drivers/infiniband/hw/mlx5=
/flow.c
index e57435cb6d96..f86cdcafdafc 100644
--- a/drivers/infiniband/hw/mlx5/flow.c
+++ b/drivers/infiniband/hw/mlx5/flow.c
@@ -160,7 +160,7 @@ static int UVERBS_HANDLER(MLX5_IB_METHOD_CREATE_FLOW)(
 			ret =3D -EINVAL;
 			goto err_out;
 		}
-		flow_act.has_flow_tag =3D true;
+		flow_act.flags |=3D FLOW_ACT_HAS_TAG;
 	}
=20
 	flow_handler =3D mlx5_ib_raw_fs_rule_add(dev, fs_matcher, &flow_act,
--=20
2.18.0

--=20
Cheers,
Stephen Rothwell

--Sig_/25FRB+FpKCG6tOkPrliMHXx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvJIr0ACgkQAVBC80lX
0Gy3ZQf/dkbUZFpTwz6UXdJ5lIbzK7EJDhqgxc0Zc0qbgVCSjwgP2XcbQpWVCN8u
aruu20oocXNRHK8FK/T7944nyv6cJ12mBYweb7+3JpVHffKO3CTi9N7ZN+s7jCZc
ZPnVH4gQKB9CDzQ+N/VnUFPIaAhstAGTugDLk1oorKLNGRpbFMm1iAO2bbLeb0nA
D8fTe0yulgRFvsTR87Go/9izQw3Ty1MJzAmxTjlRYEbF/X99JsYwBDzKju0leOBQ
8XHJWxpns3+KIFhFmGYqSscSt6ReMYiB3yxYZAAONW99UaRHsA7M5Rd20Sz0kMeA
lypqxMvrra1Q+I0/vp/oHJPE43qYYA==
=kUuI
-----END PGP SIGNATURE-----

--Sig_/25FRB+FpKCG6tOkPrliMHXx--
