From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Mon, 17 Dec 2018 11:31:06 +1100
Message-ID: <20181217113106.32d98f30@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/UrkNE1PzDhRILSpE4niyV_7"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/UrkNE1PzDhRILSpE4niyV_7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/ipv6/ip6_output.c

between commit:

  8203e2d844d3 ("net: clear skb->tstamp in forwarding paths")

from the net tree and commit:

  f839a6c92504 ("net: Do not route unicast IP packets twice")

from the net-next tree.

I fixed it up (I was not quite sure of the correct ordering - see below)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc net/ipv6/ip6_output.c
index 4591ca4bdbe8,9d55ee33b7f9..000000000000
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@@ -378,7 -378,13 +378,14 @@@ static inline int ip6_forward_finish(st
  	__IP6_INC_STATS(net, ip6_dst_idev(dst), IPSTATS_MIB_OUTFORWDATAGRAMS);
  	__IP6_ADD_STATS(net, ip6_dst_idev(dst), IPSTATS_MIB_OUTOCTETS, skb->len);
 =20
+ #ifdef CONFIG_NET_SWITCHDEV
+ 	if (skb->offload_l3_fwd_mark) {
+ 		consume_skb(skb);
+ 		return 0;
+ 	}
+ #endif
+=20
 +	skb->tstamp =3D 0;
  	return dst_output(net, sk, skb);
  }
 =20

--Sig_/UrkNE1PzDhRILSpE4niyV_7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwW7koACgkQAVBC80lX
0GwsRQf/Zo4pSnTD1qLwVq9c5uBt1AZ5RXjROYnaw2aeRk1lghGABzLO09uw77qz
sVns/6NXKeYdJtn5fzCJUupKRzUveNMiYjE5xjpnnNHskBRyuo06b58kAsdtNPgj
VH1z+ZKtkMyOLUslkB+t5loPT0vwshkfFSZLMRlmiUoDFw6tlxF/+gO7Q11NsRbr
eFTEx+YIB9upwebZ+l9+c29Kl4MKSxi9QRQhG7YGfgKERGnPHFhM9jzfA8jndDvT
PNdcgcqKnEXqtl9ebXJZ2uFya0Kjnhn8SQt+kMaktb2Yp01Gn3+QlQqy/R+HVpUs
jWJPo+WLLc3ow/oe85MG1S3+FyDJIQ==
=9zHY
-----END PGP SIGNATURE-----

--Sig_/UrkNE1PzDhRILSpE4niyV_7--
