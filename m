From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Wed, 13 Feb 2019 11:33:27 +1100
Message-ID: <20190213113327.78a7ceac@canb.auug.org.au>
References: <20190213111325.30cfc931@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6ZgmXHY6zflD8dOhO0L_Ve_"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190213111325.30cfc931@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Cong Wang <xiyou.wangcong@gmail.com>, Vlad Buslov <vladbu@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/6ZgmXHY6zflD8dOhO0L_Ve_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 13 Feb 2019 11:13:25 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the net-next tree got a conflict in:
>=20
>   net/sched/cls_tcindex.c
>=20
> between commits:
>=20
>   8015d93ebd27 ("net_sched: fix a race condition in tcindex_destroy()")
>   033b228e7f26 ("net_sched: fix a memory leak in cls_tcindex")
>=20
> from the net tree and commit:
>=20
>   12db03b65c2b ("net: sched: extend proto ops to support unlocked classif=
iers")
>=20
> from the net-next tree.
>=20
> I fixed it up (see the final resolution when linux-next is published)
> and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be
> mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.

Actually, see the below resolution.

--=20
Cheers,
Stephen Rothwell

diff --cc net/sched/cls_tcindex.c
index 38bb882bb958,14d6b4058045..e6cf20bc8e80
--- a/net/sched/cls_tcindex.c
+++ b/net/sched/cls_tcindex.c
@@@ -559,34 -563,15 +560,34 @@@ static void tcindex_destroy(struct tcf_
  			    struct netlink_ext_ack *extack)
  {
  	struct tcindex_data *p =3D rtnl_dereference(tp->root);
 -	struct tcf_walker walker;
 +	int i;
 =20
  	pr_debug("tcindex_destroy(tp %p),p %p\n", tp, p);
 -	walker.count =3D 0;
 -	walker.skip =3D 0;
 -	walker.fn =3D tcindex_destroy_element;
 -	tcindex_walk(tp, &walker, true);
 =20
 -	call_rcu(&p->rcu, __tcindex_destroy);
 +	if (p->perfect) {
 +		for (i =3D 0; i < p->hash; i++) {
 +			struct tcindex_filter_result *r =3D p->perfect + i;
 +
 +			tcf_unbind_filter(tp, &r->res);
 +			if (tcf_exts_get_net(&r->exts))
 +				tcf_queue_work(&r->rwork,
 +					       tcindex_destroy_rexts_work);
 +			else
 +				__tcindex_destroy_rexts(r);
 +		}
 +	}
 +
 +	for (i =3D 0; p->h && i < p->hash; i++) {
 +		struct tcindex_filter *f, *next;
 +		bool last;
 +
 +		for (f =3D rtnl_dereference(p->h[i]); f; f =3D next) {
 +			next =3D rtnl_dereference(f->next);
- 			tcindex_delete(tp, &f->result, &last, NULL);
++			tcindex_delete(tp, &f->result, &last, false, NULL);
 +		}
 +	}
 +
 +	tcf_queue_work(&p->rwork, tcindex_destroy_work);
  }
 =20
 =20

--Sig_/6ZgmXHY6zflD8dOhO0L_Ve_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxjZdcACgkQAVBC80lX
0GzwXwf+P/P0Pvg5DWt7UC+QZRPFZyQHcozuS3V7I0ubGDP+KUp6vR4QWGmTE8PK
NC0tm4ZE4z9tfjtnHFP3SRDOQpn26KbwCVHgZlKU7/Ws28ep89lgOmTt1/fa8iLg
DsVKmhfj+DcZ4VPIocXYKNFn+no0/6wjOuMJOHWnFD498a4l3ZQ3asbWqQ/6uBS+
BCVRxa6TRBLA3DM+Djy2PpEqI13wB3MAQp+JvCkOBztdBR4UOQnVy4pNDpF4OmOs
ujG22TNcq+km/2zmjuZap0gn779F8D8Y8aprbhHY9A+AWWH1S95Sdp0U5AxRQKW3
N6R+qcUBCpyrIvNBV4+MjuFDEE8jJQ==
=+ZAS
-----END PGP SIGNATURE-----

--Sig_/6ZgmXHY6zflD8dOhO0L_Ve_--
