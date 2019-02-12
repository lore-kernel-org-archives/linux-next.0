From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Tue, 12 Feb 2019 11:23:20 +1100
Message-ID: <20190212112320.0996efa7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YbkeD63/IR2nkraSiaXS+k/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Westphal <fw@strlen.de>, Pablo Neira Ayuso <pablo@netfilter.org>
List-Id: linux-next.vger.kernel.org

--Sig_/YbkeD63/IR2nkraSiaXS+k/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got conflicts in:

  net/ipv4/netfilter/nf_nat_l3proto_ipv4.c
  net/ipv6/netfilter/nf_nat_l3proto_ipv6.c

between commit:

  8303b7e8f018 ("netfilter: nat: fix spurious connection timeouts")

from the net tree and commit:

  303e0c558959 ("netfilter: conntrack: avoid unneeded nf_conntrack_l4proto =
lookups")

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

diff --cc net/ipv4/netfilter/nf_nat_l3proto_ipv4.c
index fa2ba7c500e4,e26165af45cb..000000000000
--- a/net/ipv4/netfilter/nf_nat_l3proto_ipv4.c
+++ b/net/ipv4/netfilter/nf_nat_l3proto_ipv4.c
@@@ -214,8 -214,7 +214,8 @@@ int nf_nat_icmp_reply_translation(struc
  	}
 =20
  	/* Change outer to look like the reply to an incoming packet */
- 	nf_ct_invert_tuplepr(&target, &ct->tuplehash[!dir].tuple);
+ 	nf_ct_invert_tuple(&target, &ct->tuplehash[!dir].tuple);
 +	target.dst.protonum =3D IPPROTO_ICMP;
  	if (!nf_nat_ipv4_manip_pkt(skb, 0, &target, manip))
  		return 0;
 =20
diff --cc net/ipv6/netfilter/nf_nat_l3proto_ipv6.c
index 7a41ee3c11b4,9c914db44bec..000000000000
--- a/net/ipv6/netfilter/nf_nat_l3proto_ipv6.c
+++ b/net/ipv6/netfilter/nf_nat_l3proto_ipv6.c
@@@ -225,8 -225,7 +225,8 @@@ int nf_nat_icmpv6_reply_translation(str
  						     skb->len - hdrlen, 0));
  	}
 =20
- 	nf_ct_invert_tuplepr(&target, &ct->tuplehash[!dir].tuple);
+ 	nf_ct_invert_tuple(&target, &ct->tuplehash[!dir].tuple);
 +	target.dst.protonum =3D IPPROTO_ICMPV6;
  	if (!nf_nat_ipv6_manip_pkt(skb, 0, &target, manip))
  		return 0;
 =20

--Sig_/YbkeD63/IR2nkraSiaXS+k/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxiEfgACgkQAVBC80lX
0GxzNgf+PirhJ6pPEHvtapZE94AYU1Fj7a/ennZKjC239GpoG9nxN+6Zwr0ee/qD
hf9ie8vkYtroxApeWNzoXMpefPTxNfWykXRrVIompckrjajmBBtCQWqEtIXrouTi
2riHBXdL2r3HCdF4RCapqEuxX305Ra4jq47qqpVxxlPCpx+2LcXozSo5WLRx8l5j
eYXcA8mQWedH9UiV7iROCjDqujaxAcirPICGo2YgFCzxg10XtpPp7PP/fWOfQPuE
FUqsLb1+56iyj/aFvBFvyXPUR2bGLEyetbOCf098vINWPsheQ+dbTmLK3XMKBmKp
RFzYAtWvd3LcXAvafQCTGYQnmZ55Zw==
=ullt
-----END PGP SIGNATURE-----

--Sig_/YbkeD63/IR2nkraSiaXS+k/--
