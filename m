From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Mon, 9 Jul 2018 10:46:38 +1000
Message-ID: <20180709104638.2dbfd48e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/j4u=J+N0W/DuI_wqnoij4VC"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Davide Caratti <dcaratti@redhat.com>, Vlad Buslov <vladbu@mellanox.com>, Jiri Pirko <jiri@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/j4u=J+N0W/DuI_wqnoij4VC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/sched/act_csum.c

between commit:

  11a245e2f7bf ("net/sched: act_csum: fix NULL dereference when 'goto chain=
' is used")

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

diff --cc net/sched/act_csum.c
index 6e7124e57918,bd232d3bd022..000000000000
--- a/net/sched/act_csum.c
+++ b/net/sched/act_csum.c
@@@ -597,9 -603,8 +603,9 @@@ static int tcf_csum_dump(struct sk_buf
  	struct tcf_csum_params *params;
  	struct tc_csum opt =3D {
  		.index   =3D p->tcf_index,
- 		.refcnt  =3D p->tcf_refcnt - ref,
- 		.bindcnt =3D p->tcf_bindcnt - bind,
+ 		.refcnt  =3D refcount_read(&p->tcf_refcnt) - ref,
+ 		.bindcnt =3D atomic_read(&p->tcf_bindcnt) - bind,
 +		.action  =3D p->tcf_action,
  	};
  	struct tcf_t t;
 =20

--Sig_/j4u=J+N0W/DuI_wqnoij4VC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltCsG4ACgkQAVBC80lX
0GzV1gf+LmaWWvp/3F3qcOeJxD4wNZC3fC3kqSobZGMHfqj7ZXvrvcYmLupQqQCl
yR5hfeYXSWo92AB2Y8n3SoqISA0LxUOFkIxASH2CkKVtGx8WLcMnCMO4ZEfy9YOK
sblxxOH80xga1Jd/kstAeWt9aub7e/DFzltdNCDJcKrKmlauCLRez3kavOLG1X3u
/ZMXyGanM1gTUM5dzT15cJC+VmQYV8MOvftIOrWqg+KPdEK1cg9doE44h3TCAtrh
6CKSryKb7rtD4Wex0RO9xUe7Dtu4Blh+mLBL+S07e1WY48Wb70B/DazhwXztoOVV
5zH/hl0EeUnoyBs1vp4wWunqIyY9bg==
=p/CG
-----END PGP SIGNATURE-----

--Sig_/j4u=J+N0W/DuI_wqnoij4VC--
