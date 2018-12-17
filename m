From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Mon, 17 Dec 2018 11:13:28 +1100
Message-ID: <20181217111328.220b2827@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/q8.eSqx1J_GEU5DOsNGz2_F"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Atul Gupta <atul.gupta@chelsio.com>, Santosh Rastapur <santosh@chelsio.com>, Ganesh Goudar <ganeshgr@chelsio.com>
List-Id: linux-next.vger.kernel.org

--Sig_/q8.eSqx1J_GEU5DOsNGz2_F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/crypto/chelsio/chtls/chtls_cm.c

between commit:

  0c3a16be700e ("crypto/chelsio/chtls: send/recv window update")

from the net tree and commit:

  02d805dc5fe3 ("cxgb4: use new fw interface to get the VIN and smt index")

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

diff --cc drivers/crypto/chelsio/chtls/chtls_cm.c
index 931b96c220af,228b91b7d6b5..000000000000
--- a/drivers/crypto/chelsio/chtls/chtls_cm.c
+++ b/drivers/crypto/chelsio/chtls/chtls_cm.c
@@@ -1079,11 -1074,10 +1079,10 @@@ static struct sock *chtls_recv_sock(str
  	csk->txq_idx =3D (rxq_idx < cdev->lldi->ntxq) ? rxq_idx :
  			port_id * step;
  	csk->sndbuf =3D newsk->sk_sndbuf;
- 	csk->smac_idx =3D cxgb4_tp_smt_idx(cdev->lldi->adapter_type,
- 					 cxgb4_port_viid(ndev));
+ 	csk->smac_idx =3D ((struct port_info *)netdev_priv(ndev))->smt_idx;
 -	tp->rcv_wnd =3D select_rcv_wnd(csk);
  	RCV_WSCALE(tp) =3D select_rcv_wscale(tcp_full_space(newsk),
 -					   WSCALE_OK(tp),
 +					   sock_net(newsk)->
 +						ipv4.sysctl_tcp_window_scaling,
  					   tp->window_clamp);
  	neigh_release(n);
  	inet_inherit_port(&tcp_hashinfo, lsk, newsk);

--Sig_/q8.eSqx1J_GEU5DOsNGz2_F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwW6igACgkQAVBC80lX
0GwlZwgAiVlyeC6woMsnwzRjXR9oiS1AUffMkAZ1nTVy/hIVPd088AbOBBpv38Wq
NtpIlMS1fGK4eJix6NPcNqqrMNhSnIRi2l7lyaJBCWIsz8tdWfnr7kpTTxv5GwZT
u785sTxgs2Qjs0W0J6BFPCmbXy9+sq29zR9BLsOfKquo/HUmJSW1DHCQY0TcedrM
Scq1GX0ESEjAqU9xtZyYVtGpJOafjd5AEUAAZJgJ2zCuzUTHRwFcyc74dufdlmdY
exGu1TuU4c8ycocr3OZdK7PMAKwuMMvZ7crifNsWSQf/eNbaWGdU9+hsB1wTU+rR
CXBBF0ZKR76sUZbRAazfzeF0Sas9Rw==
=lWkU
-----END PGP SIGNATURE-----

--Sig_/q8.eSqx1J_GEU5DOsNGz2_F--
