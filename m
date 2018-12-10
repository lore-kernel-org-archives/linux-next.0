From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Mon, 10 Dec 2018 12:36:33 +1100
Message-ID: <20181210123633.4a0e4409@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/p=0FB9cZnhPyV_t8ywI.Uig"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Amritha Nambiar <amritha.nambiar@intel.com>, Or Gerlitz <ogerlitz@mellanox.com>, aul Blakey <paulb@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/p=0FB9cZnhPyV_t8ywI.Uig
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/sched/cls_flower.c

between commit:

  35cc3cefc4de ("net/sched: cls_flower: Reject duplicated rules also under =
skip_sw")

from the net tree and commit:

  5c72299fba9d ("net: sched: cls_flower: Classify packets using port ranges=
")

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

diff --cc net/sched/cls_flower.c
index 71312d7bd8f4,85e9f8e1da10..000000000000
--- a/net/sched/cls_flower.c
+++ b/net/sched/cls_flower.c
@@@ -1238,16 -1355,18 +1355,16 @@@ static int fl_change(struct net *net, s
  	if (err)
  		goto errout_idr;
 =20
- 	if (!fold && fl_lookup(fnew->mask, &fnew->mkey)) {
 -	if (!tc_skip_sw(fnew->flags)) {
 -		if (!fold && __fl_lookup(fnew->mask, &fnew->mkey)) {
 -			err =3D -EEXIST;
 -			goto errout_mask;
 -		}
 -
 -		err =3D rhashtable_insert_fast(&fnew->mask->ht, &fnew->ht_node,
 -					     fnew->mask->filter_ht_params);
 -		if (err)
 -			goto errout_mask;
++	if (!fold && __fl_lookup(fnew->mask, &fnew->mkey)) {
 +		err =3D -EEXIST;
 +		goto errout_mask;
  	}
 =20
 +	err =3D rhashtable_insert_fast(&fnew->mask->ht, &fnew->ht_node,
 +				     fnew->mask->filter_ht_params);
 +	if (err)
 +		goto errout_mask;
 +
  	if (!tc_skip_hw(fnew->flags)) {
  		err =3D fl_hw_replace_filter(tp, fnew, extack);
  		if (err)

--Sig_/p=0FB9cZnhPyV_t8ywI.Uig
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwNwyEACgkQAVBC80lX
0GwgkQgAoYXAkaYZRPt2n0QzjxBlzlMVySFZYWlHf5xoa45EYMjfV3mx9KMFPqjv
jg8OwwLvTQTVQLRvvUtYrm7tDJePnqcsJXul0DRFzICyLFWZlTeKEPKN9LRz3o8e
qeIEDyDZafoORscVFsvhcRF9wIWVcTE7vMK+X4hqEGmwLCCQYTis3Lo85yagquTw
oKVMlZmuCD9TXhGQuYW1VTivM505GjuB8pFkzKGaQqvPEjK+kODUDH1YM/R70DxU
GsKEIcuBhizYQ18xGrKAZJJNXkmGlskNoA8zmy8MviacOqyoFdHVTG3PPmTfJmAd
mIUl1p0FTj9tskDfC8GK/F5tdct29w==
=f+4/
-----END PGP SIGNATURE-----

--Sig_/p=0FB9cZnhPyV_t8ywI.Uig--
