From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Mon, 3 Dec 2018 12:50:41 +1100
Message-ID: <20181203125041.43c7cc9e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Um9+JVZzR5Tzltt1Un+xbg2"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, John Hurley <john.hurley@netronome.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Um9+JVZzR5Tzltt1Un+xbg2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/ethernet/netronome/nfp/flower/offload.c

between commits:

  b5f0cf083400 ("nfp: flower: prevent offload if rhashtable insert fails")

from the net tree and commit:

  7885b4fc8d8e ("nfp: flower: allow non repr netdev offload")

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

diff --cc drivers/net/ethernet/netronome/nfp/flower/offload.c
index 2f49eb75f3cc,545d94168874..000000000000
--- a/drivers/net/ethernet/netronome/nfp/flower/offload.c
+++ b/drivers/net/ethernet/netronome/nfp/flower/offload.c
@@@ -480,14 -469,10 +464,15 @@@ nfp_flower_add_offload(struct nfp_app *
  	err =3D rhashtable_insert_fast(&priv->flow_table, &flow_pay->fl_node,
  				     nfp_flower_table_params);
  	if (err)
 -		goto err_destroy_flow;
 +		goto err_release_metadata;
 +
- 	err =3D nfp_flower_xmit_flow(netdev, flow_pay,
++	err =3D nfp_flower_xmit_flow(app, flow_pay,
 +				   NFP_FLOWER_CMSG_TYPE_FLOW_ADD);
 +	if (err)
 +		goto err_remove_rhash;
 =20
- 	port->tc_offload_cnt++;
+ 	if (port)
+ 		port->tc_offload_cnt++;
 =20
  	/* Deallocate flow payload when flower rule has been destroyed. */
  	kfree(key_layer);

--Sig_/Um9+JVZzR5Tzltt1Un+xbg2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwEi/EACgkQAVBC80lX
0GzCTQf/WWTJ7sL324fQtSAMk+FGpwXtFSOstSYA4eMAvcel3lFL2+33p/+a35VJ
LCYN7dLwbrudXvk40RJiButA1Kjg894lN3/kixodznHyiuUNf951ASuLXWYpu0Sz
FbbRJaYt60IqdWTIviJM8Q33wPndSY5btFnyutQ2p/NVpUB6h8PI66j08HVRgjDI
nBA2218DbXEoWY15AcxPxRX9ypaW34+aGZEBRm/pwkxO7XmcIfngU6q/Ec8cmkio
VllA/ApYr+Xx02UTLwMZzQBB2dB6HHTeozgzrcZ2R85793dfCya0Jchk6y+atg2j
S9UogUv9g2yzk9HWUnDgN/wzNBpJFA==
=4/vs
-----END PGP SIGNATURE-----

--Sig_/Um9+JVZzR5Tzltt1Un+xbg2--
