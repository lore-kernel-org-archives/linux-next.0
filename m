From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the rdma tree
Date: Mon, 2 Jul 2018 10:21:06 +1000
Message-ID: <20180702102106.4ac2bd17@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3A3sm3gFhnnudXWR9NN/qs/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Parav Pandit <parav@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/3A3sm3gFhnnudXWR9NN/qs/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/smc/smc_ib.c

between commit:

  ddb457c6993b ("net/smc: Replace ib_query_gid with rdma_get_gid_attr")

from the rdma tree and commit:

  be6a3f38ff2a ("net/smc: determine port attributes independent from pnet t=
able")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc net/smc/smc_ib.c
index 74f29f814ec1,36de2fd76170..000000000000
--- a/net/smc/smc_ib.c
+++ b/net/smc/smc_ib.c
@@@ -144,6 -143,62 +144,66 @@@ out
  	return rc;
  }
 =20
+ static int smc_ib_fill_gid_and_mac(struct smc_ib_device *smcibdev, u8 ibp=
ort)
+ {
 -	struct ib_gid_attr gattr;
 -	int rc;
 -
 -	rc =3D ib_query_gid(smcibdev->ibdev, ibport, 0,
 -			  &smcibdev->gid[ibport - 1], &gattr);
 -	if (rc || !gattr.ndev)
 -		return -ENODEV;
++	const struct ib_gid_attr *gattr;
++	int rc =3D 0;
+=20
 -	memcpy(smcibdev->mac[ibport - 1], gattr.ndev->dev_addr, ETH_ALEN);
 -	dev_put(gattr.ndev);
 -	return 0;
++	gattr =3D rdma_get_gid_attr(smcibdev->ibdev, ibport, 0);
++	if (IS_ERR(gattr))
++		return PTR_ERR(gattr);
++	if (!gattr->ndev) {
++		rc =3D -ENODEV;
++		goto done;
++	}
++	smcibdev->gid[ibport - 1] =3D gattr->gid;
++	memcpy(smcibdev->mac[ibport - 1], gattr->ndev->dev_addr, ETH_ALEN);
++done:
++	rdma_put_gid_attr(gattr);
++	return rc;
+ }
+=20
+ /* Create an identifier unique for this instance of SMC-R.
+  * The MAC-address of the first active registered IB device
+  * plus a random 2-byte number is used to create this identifier.
+  * This name is delivered to the peer during connection initialization.
+  */
+ static inline void smc_ib_define_local_systemid(struct smc_ib_device *smc=
ibdev,
+ 						u8 ibport)
+ {
+ 	memcpy(&local_systemid[2], &smcibdev->mac[ibport - 1],
+ 	       sizeof(smcibdev->mac[ibport - 1]));
+ 	get_random_bytes(&local_systemid[0], 2);
+ }
+=20
+ bool smc_ib_port_active(struct smc_ib_device *smcibdev, u8 ibport)
+ {
+ 	return smcibdev->pattr[ibport - 1].state =3D=3D IB_PORT_ACTIVE;
+ }
+=20
+ static int smc_ib_remember_port_attr(struct smc_ib_device *smcibdev, u8 i=
bport)
+ {
+ 	int rc;
+=20
+ 	memset(&smcibdev->pattr[ibport - 1], 0,
+ 	       sizeof(smcibdev->pattr[ibport - 1]));
+ 	rc =3D ib_query_port(smcibdev->ibdev, ibport,
+ 			   &smcibdev->pattr[ibport - 1]);
+ 	if (rc)
+ 		goto out;
+ 	/* the SMC protocol requires specification of the RoCE MAC address */
+ 	rc =3D smc_ib_fill_gid_and_mac(smcibdev, ibport);
+ 	if (rc)
+ 		goto out;
+ 	if (!strncmp(local_systemid, SMC_LOCAL_SYSTEMID_RESET,
+ 		     sizeof(local_systemid)) &&
+ 	    smc_ib_port_active(smcibdev, ibport))
+ 		/* create unique system identifier */
+ 		smc_ib_define_local_systemid(smcibdev, ibport);
+ out:
+ 	return rc;
+ }
+=20
  /* process context wrapper for might_sleep smc_ib_remember_port_attr */
  static void smc_ib_port_event_work(struct work_struct *work)
  {

--Sig_/3A3sm3gFhnnudXWR9NN/qs/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAls5b/IACgkQAVBC80lX
0Gzr0Af/VMEfivbvdiVq57zUT/IEn/2UFkN8IQMDIO0Tmzs5U4NzNuk+6ZZqsXoh
5SnhasStszQWZghjZgE8d1N6JSV4bedYzAD6uMiFqAL8RK8bl0zGaWDj4Tqsj/QN
S/q2LUapDimbkCm6VXsRSWQdCyYLbkbd6wbY+lVFeCIV91K0L+iQkNjCOnHm5syB
rmp6tXjHQ+/GCZbhUMv3xLKBtQ6+1IN/m2x+V75IL5lSt/u5J4pY0DGNuFjRIWK2
bvy+FVa9i75+HhMvFwiapBOrh/6plpoXYfBZ1on3KhqSO9LYIhGl2kinpgudCM4m
WOvR7uFbzOVOI5I+oFrg+kYPyZDDtQ==
=8ug9
-----END PGP SIGNATURE-----

--Sig_/3A3sm3gFhnnudXWR9NN/qs/--
