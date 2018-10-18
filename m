From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Fri, 19 Oct 2018 10:56:59 +1100
Message-ID: <20181019105659.6078540c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2/pj58AD0yRgD987x1Ant66"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nikolay Aleksandrov <nikolay@cumulusnetworks.com>, David Ahern <dsahern@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/2/pj58AD0yRgD987x1Ant66
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/ipv4/ipmr_base.c

between commit:

  eddf016b9104 ("net: ipmr: fix unresolved entry dumps")

from the net tree and commit:

  e1cedae1ba6b ("ipmr: Refactor mr_rtm_dumproute")

from the net-next tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc net/ipv4/ipmr_base.c
index eab8cd5ec2f5,844806120f44..000000000000
--- a/net/ipv4/ipmr_base.c
+++ b/net/ipv4/ipmr_base.c
@@@ -268,6 -268,83 +268,81 @@@ int mr_fill_mroute(struct mr_table *mrt
  }
  EXPORT_SYMBOL(mr_fill_mroute);
 =20
+ static bool mr_mfc_uses_dev(const struct mr_table *mrt,
+ 			    const struct mr_mfc *c,
+ 			    const struct net_device *dev)
+ {
+ 	int ct;
+=20
+ 	for (ct =3D c->mfc_un.res.minvif; ct < c->mfc_un.res.maxvif; ct++) {
+ 		if (VIF_EXISTS(mrt, ct) && c->mfc_un.res.ttls[ct] < 255) {
+ 			const struct vif_device *vif;
+=20
+ 			vif =3D &mrt->vif_table[ct];
+ 			if (vif->dev =3D=3D dev)
+ 				return true;
+ 		}
+ 	}
+ 	return false;
+ }
+=20
+ int mr_table_dump(struct mr_table *mrt, struct sk_buff *skb,
+ 		  struct netlink_callback *cb,
+ 		  int (*fill)(struct mr_table *mrt, struct sk_buff *skb,
+ 			      u32 portid, u32 seq, struct mr_mfc *c,
+ 			      int cmd, int flags),
+ 		  spinlock_t *lock, struct fib_dump_filter *filter)
+ {
+ 	unsigned int e =3D 0, s_e =3D cb->args[1];
+ 	unsigned int flags =3D NLM_F_MULTI;
+ 	struct mr_mfc *mfc;
+ 	int err;
+=20
+ 	if (filter->filter_set)
+ 		flags |=3D NLM_F_DUMP_FILTERED;
+=20
+ 	list_for_each_entry_rcu(mfc, &mrt->mfc_cache_list, list) {
+ 		if (e < s_e)
+ 			goto next_entry;
+ 		if (filter->dev &&
+ 		    !mr_mfc_uses_dev(mrt, mfc, filter->dev))
+ 			goto next_entry;
+=20
+ 		err =3D fill(mrt, skb, NETLINK_CB(cb->skb).portid,
+ 			   cb->nlh->nlmsg_seq, mfc, RTM_NEWROUTE, flags);
+ 		if (err < 0)
+ 			goto out;
+ next_entry:
+ 		e++;
+ 	}
 -	e =3D 0;
 -	s_e =3D 0;
+=20
+ 	spin_lock_bh(lock);
+ 	list_for_each_entry(mfc, &mrt->mfc_unres_queue, list) {
+ 		if (e < s_e)
+ 			goto next_entry2;
+ 		if (filter->dev &&
+ 		    !mr_mfc_uses_dev(mrt, mfc, filter->dev))
+ 			goto next_entry2;
+=20
+ 		err =3D fill(mrt, skb, NETLINK_CB(cb->skb).portid,
+ 			   cb->nlh->nlmsg_seq, mfc, RTM_NEWROUTE, flags);
+ 		if (err < 0) {
+ 			spin_unlock_bh(lock);
+ 			goto out;
+ 		}
+ next_entry2:
+ 		e++;
+ 	}
+ 	spin_unlock_bh(lock);
+ 	err =3D 0;
+ 	e =3D 0;
+=20
+ out:
+ 	cb->args[1] =3D e;
+ 	return err;
+ }
+ EXPORT_SYMBOL(mr_table_dump);
+=20
  int mr_rtm_dumproute(struct sk_buff *skb, struct netlink_callback *cb,
  		     struct mr_table *(*iter)(struct net *net,
  					      struct mr_table *mrt),

--Sig_/2/pj58AD0yRgD987x1Ant66
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvJHcsACgkQAVBC80lX
0GxWhwf8CEjTDnVF76wae/xjCYK3Y+FSWuXSPhJYQdrt9ZMK63/VUGep4tHArp+d
G9HhJPkQZWZit2arSbavVZKqMwnLzflwopCSxIG6UigNOck5QUDubCWJ/wZOHgHq
TDI0CWoqKvLO1q8HJvLlWBwWQcIQPRbIzVzWuQ0KylAn5Tv3JwW3rqXYghuTqUT1
vlSS6jdDq/oobBDFawlNNw8t+eq1nXHuIKehA2KkxCPHYr4SHM2oiEeYuULNpRHl
yk4WN92bLsmy7gNiutSNNXyN1ApSbhuW0QF/Uup4AQXgRZgWrZ4wGVvtQqaRhEex
Lg4rnWmt+W7R9C/gKpJDIwswr52lcg==
=rsI6
-----END PGP SIGNATURE-----

--Sig_/2/pj58AD0yRgD987x1Ant66--
