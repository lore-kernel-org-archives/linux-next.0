From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Thu, 20 Dec 2018 12:56:35 +1100
Message-ID: <20181220125635.76ae89ad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/rN_.1I6oz98LMOcMEqK5afx"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Petr Machata <petrm@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/rN_.1I6oz98LMOcMEqK5afx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/vxlan.c

between commits:

  6db924687139 ("vxlan: Fix error path in __vxlan_dev_create()")
  ce5e098f7a10 ("vxlan: changelink: Fix handling of default remotes")

from the net tree and commit:

  0e6160f3f5a9 ("vxlan: vxlan_fdb_notify(): Make switchdev notification con=
figurable")

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

diff --cc drivers/net/vxlan.c
index 0565f8880199,71c3b7b6b1ab..000000000000
--- a/drivers/net/vxlan.c
+++ b/drivers/net/vxlan.c
@@@ -3297,16 -3483,9 +3484,16 @@@ static int __vxlan_dev_create(struct ne
 =20
  	list_add(&vxlan->next, &vn->vxlan_list);
  	return 0;
 +
  errout:
 +	/* unregister_netdevice() destroys the default FDB entry with deletion
 +	 * notification. But the addition notification was not sent yet, so
 +	 * destroy the entry by hand here.
 +	 */
  	if (f)
- 		vxlan_fdb_destroy(vxlan, f, false);
+ 		vxlan_fdb_destroy(vxlan, f, false, false);
 +	if (unregister)
 +		unregister_netdevice(dev);
  	return err;
  }
 =20
@@@ -3540,8 -3719,10 +3727,9 @@@ static int vxlan_changelink(struct net_
  {
  	struct vxlan_dev *vxlan =3D netdev_priv(dev);
  	struct vxlan_rdst *dst =3D &vxlan->default_dst;
+ 	unsigned long old_age_interval;
  	struct vxlan_rdst old_dst;
  	struct vxlan_config conf;
 -	struct vxlan_fdb *f =3D NULL;
  	int err;
 =20
  	err =3D vxlan_nl2conf(tb, data,
@@@ -3564,13 -3749,13 +3756,14 @@@
  					   vxlan->cfg.dst_port,
  					   old_dst.remote_vni,
  					   old_dst.remote_vni,
- 					   old_dst.remote_ifindex, 0);
+ 					   old_dst.remote_ifindex,
+ 					   true);
 =20
  		if (!vxlan_addr_any(&dst->remote_ip)) {
 -			err =3D vxlan_fdb_create(vxlan, all_zeros_mac,
 +			err =3D vxlan_fdb_update(vxlan, all_zeros_mac,
  					       &dst->remote_ip,
  					       NUD_REACHABLE | NUD_PERMANENT,
 +					       NLM_F_APPEND | NLM_F_CREATE,
  					       vxlan->cfg.dst_port,
  					       dst->remote_vni,
  					       dst->remote_vni,

--Sig_/rN_.1I6oz98LMOcMEqK5afx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwa9tMACgkQAVBC80lX
0GxyhAf/RTpapDLHDtZ8Owg+OB7R34ZbrO5YNvGQeyTipJsnH8tqucKSY0H6LPqf
j2U1UR9PUSEwYllH5YUSBEETT4Y2DVHHC8I6c3GPGFwGyLt+AtXhK1j/99swKQ5g
tqnCQdu0pti/1d9FomXs+5tcN4HY9liWGB4eNlBBrqeojzNjMzp7y8Bnb7HDH16/
G1CQgl4H/yzFM957tzhz5Qs0tlkz38rxShDa/xT0/sA8k1iCJZLMUtx0Dj2EXvEq
PPNtNnoAhuXfppKT2aDPpMzjqZDmLA4DzoXtj0mFbf+XUblq/LR6pSApozKYklwD
AjeiRHBbVesVli47Sj6wjx5QtplBsQ==
=qH2F
-----END PGP SIGNATURE-----

--Sig_/rN_.1I6oz98LMOcMEqK5afx--
