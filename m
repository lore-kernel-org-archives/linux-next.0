From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Mon, 9 Jul 2018 11:03:58 +1000
Message-ID: <20180709110358.338e5113@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9PpNYWlCsVIL+lh_In2gPfm"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Davide Caratti <dcaratti@redhat.com>, Vlad Buslov <vladbu@mellanox.com>, Jiri Pirko <jiri@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/9PpNYWlCsVIL+lh_In2gPfm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/sched/act_tunnel_key.c

between commit:

  38230a3e0e09 ("net/sched: act_tunnel_key: fix NULL dereference when 'goto=
 chain' is used")

from the net tree and commit:

  036bb44327f5 ("net: sched: change type of reference and bind counters")

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

diff --cc net/sched/act_tunnel_key.c
index 9bc6c2ae98a5,3ec585d58762..000000000000
--- a/net/sched/act_tunnel_key.c
+++ b/net/sched/act_tunnel_key.c
@@@ -252,9 -477,8 +477,9 @@@ static int tunnel_key_dump(struct sk_bu
  	struct tcf_tunnel_key_params *params;
  	struct tc_tunnel_key opt =3D {
  		.index    =3D t->tcf_index,
- 		.refcnt   =3D t->tcf_refcnt - ref,
- 		.bindcnt  =3D t->tcf_bindcnt - bind,
+ 		.refcnt   =3D refcount_read(&t->tcf_refcnt) - ref,
+ 		.bindcnt  =3D atomic_read(&t->tcf_bindcnt) - bind,
 +		.action   =3D t->tcf_action,
  	};
  	struct tcf_t tm;
 =20

--Sig_/9PpNYWlCsVIL+lh_In2gPfm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltCtH4ACgkQAVBC80lX
0Gx3BwgAi4vk3GYrxETkRJFC4YltgXQX5XuXZRioXt26KtfPe9XkMPydt8yFykp1
B17hdMzT07CIyxXXh9yPrblVcOj9ASekjgd8UU2JVahH5w1JmybFGSOYWWmLtSs5
BjORfp/ZWOcaI7d8FHnrItlXI9ud+HQwJhIBeUDmYPrInqXGEKPpIg+bSIXCvAAE
mcd+in8o0DytVwbPdzbJXMQ+8bmS7AMGSf5U/8xEnoiFAc8x9NEsro+CgojElnqO
gDkV/+i6x6qcy3MbYA2QYqcAo5a1OcsJnwHXyCmMtRzZzTIMIXaEI/nHFcrSKRti
aIMAaHwTpJMgA2O7IL4ruT/dGUMeDQ==
=1VZg
-----END PGP SIGNATURE-----

--Sig_/9PpNYWlCsVIL+lh_In2gPfm--
