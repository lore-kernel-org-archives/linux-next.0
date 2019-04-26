From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ipsec-next tree with the ipsec tree
Date: Fri, 26 Apr 2019 11:41:20 +1000
Message-ID: <20190426114120.73e906e3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2PEW0RL1QWRzfjPqg+1fO77"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Steffen Klassert <steffen.klassert@secunet.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Westphal <fw@strlen.de>
List-Id: linux-next.vger.kernel.org

--Sig_/2PEW0RL1QWRzfjPqg+1fO77
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ipsec-next tree got a conflict in:

  net/ipv4/xfrm4_policy.c

between commit:

  8742dc86d0c7 ("xfrm4: Fix uninitialized memory read in _decode_session4")

from the ipsec tree and commit:

  c53ac41e3720 ("xfrm: remove decode_session indirection from afinfo_policy=
")

from the ipsec-next tree.

I fixed it up (the code changed by the former has been moved by the latter
- see below) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 26 Apr 2019 11:37:41 +1000
Subject: [PATCH] xfrm4: fix up for moved _decode_session4

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 net/xfrm/xfrm_policy.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index 410233c5681e..7a43ae6b2a44 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -3264,7 +3264,8 @@ static void
 decode_session4(struct sk_buff *skb, struct flowi *fl, bool reverse)
 {
 	const struct iphdr *iph =3D ip_hdr(skb);
-	u8 *xprth =3D skb_network_header(skb) + iph->ihl * 4;
+	int ihl =3D iph->ihl;
+	u8 *xprth =3D skb_network_header(skb) + ihl * 4;
 	struct flowi4 *fl4 =3D &fl->u.ip4;
 	int oif =3D 0;
=20
@@ -3275,6 +3276,11 @@ decode_session4(struct sk_buff *skb, struct flowi *f=
l, bool reverse)
 	fl4->flowi4_mark =3D skb->mark;
 	fl4->flowi4_oif =3D reverse ? skb->skb_iif : oif;
=20
+	fl4->flowi4_proto =3D iph->protocol;
+	fl4->daddr =3D reverse ? iph->saddr : iph->daddr;
+	fl4->saddr =3D reverse ? iph->daddr : iph->saddr;
+	fl4->flowi4_tos =3D iph->tos;
+
 	if (!ip_is_fragment(iph)) {
 		switch (iph->protocol) {
 		case IPPROTO_UDP:
@@ -3286,7 +3292,7 @@ decode_session4(struct sk_buff *skb, struct flowi *fl=
, bool reverse)
 			    pskb_may_pull(skb, xprth + 4 - skb->data)) {
 				__be16 *ports;
=20
-				xprth =3D skb_network_header(skb) + iph->ihl * 4;
+				xprth =3D skb_network_header(skb) + ihl * 4;
 				ports =3D (__be16 *)xprth;
=20
 				fl4->fl4_sport =3D ports[!!reverse];
@@ -3298,7 +3304,7 @@ decode_session4(struct sk_buff *skb, struct flowi *fl=
, bool reverse)
 			    pskb_may_pull(skb, xprth + 2 - skb->data)) {
 				u8 *icmp;
=20
-				xprth =3D skb_network_header(skb) + iph->ihl * 4;
+				xprth =3D skb_network_header(skb) + ihl * 4;
 				icmp =3D xprth;
=20
 				fl4->fl4_icmp_type =3D icmp[0];
@@ -3310,7 +3316,7 @@ decode_session4(struct sk_buff *skb, struct flowi *fl=
, bool reverse)
 			    pskb_may_pull(skb, xprth + 4 - skb->data)) {
 				__be32 *ehdr;
=20
-				xprth =3D skb_network_header(skb) + iph->ihl * 4;
+				xprth =3D skb_network_header(skb) + ihl * 4;
 				ehdr =3D (__be32 *)xprth;
=20
 				fl4->fl4_ipsec_spi =3D ehdr[0];
@@ -3321,7 +3327,7 @@ decode_session4(struct sk_buff *skb, struct flowi *fl=
, bool reverse)
 			    pskb_may_pull(skb, xprth + 8 - skb->data)) {
 				__be32 *ah_hdr;
=20
-				xprth =3D skb_network_header(skb) + iph->ihl * 4;
+				xprth =3D skb_network_header(skb) + ihl * 4;
 				ah_hdr =3D (__be32 *)xprth;
=20
 				fl4->fl4_ipsec_spi =3D ah_hdr[1];
@@ -3332,7 +3338,7 @@ decode_session4(struct sk_buff *skb, struct flowi *fl=
, bool reverse)
 			    pskb_may_pull(skb, xprth + 4 - skb->data)) {
 				__be16 *ipcomp_hdr;
=20
-				xprth =3D skb_network_header(skb) + iph->ihl * 4;
+				xprth =3D skb_network_header(skb) + ihl * 4;
 				ipcomp_hdr =3D (__be16 *)xprth;
=20
 				fl4->fl4_ipsec_spi =3D htonl(ntohs(ipcomp_hdr[1]));
@@ -3344,7 +3350,7 @@ decode_session4(struct sk_buff *skb, struct flowi *fl=
, bool reverse)
 				__be16 *greflags;
 				__be32 *gre_hdr;
=20
-				xprth =3D skb_network_header(skb) + iph->ihl * 4;
+				xprth =3D skb_network_header(skb) + ihl * 4;
 				greflags =3D (__be16 *)xprth;
 				gre_hdr =3D (__be32 *)xprth;
=20
@@ -3360,10 +3366,6 @@ decode_session4(struct sk_buff *skb, struct flowi *f=
l, bool reverse)
 			break;
 		}
 	}
-	fl4->flowi4_proto =3D iph->protocol;
-	fl4->daddr =3D reverse ? iph->saddr : iph->daddr;
-	fl4->saddr =3D reverse ? iph->daddr : iph->saddr;
-	fl4->flowi4_tos =3D iph->tos;
 }
=20
 #if IS_ENABLED(CONFIG_IPV6)
--=20
2.20.1


--Sig_/2PEW0RL1QWRzfjPqg+1fO77
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzCYcAACgkQAVBC80lX
0GxCSQgAoUSviUA41IlJYlzas/i369vwYlzK1Yev1JEIJkO8PHlfuttTZ4FG28y1
itsitGtUBumgRjl4EQNPmft1zZKM124mqBTiIMhnXqMxH+O+KxRxpgdyAFbkwjJn
wuzAJyyi+Z1tORKY2hfqU2t4po2ue7qSz6yB86QazUK+9XI22nUZ7iTZSVLxHKbQ
VT5O4kWhftBNr9ts0Ut3ndBEtYLJ/rQJDsrnW1717zLI83ESWmUR5rrZLylrLLb0
fbhNwDZZBa4MhIVUGSvZ08Z2KoSnJF6R0Uvk7zXT5mpip8NeGlQs0ULhi+mKlajh
nYqoDBVrCyMMaKsSzOddGPC7/+Pwxw==
=NdZV
-----END PGP SIGNATURE-----

--Sig_/2PEW0RL1QWRzfjPqg+1fO77--
