From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the net-next tree
Date: Tue, 3 Jul 2018 10:47:12 +1000
Message-ID: <20180703104712.30a36f1a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/UcNzjmxphxljKWWSpn/O1qz"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sabrina Dubroca <sd@queasysnail.net>
List-Id: linux-next.vger.kernel.org

--Sig_/UcNzjmxphxljKWWSpn/O1qz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

net/ipv4/fou.c: In function 'gue_gro_receive':
net/ipv4/fou.c:451:35: error: passing argument 2 of 'skb_gro_flush_final_re=
mcsum' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
  skb_gro_flush_final_remcsum(skb, pp, flush, &grc);
                                   ^~
In file included from include/net/inet_sock.h:23:0,
                 from include/linux/udp.h:20,
                 from net/ipv4/fou.c:6:
include/linux/netdevice.h:2799:20: note: expected 'struct sk_buff **' but a=
rgument is of type 'struct sk_buff *'
 static inline void skb_gro_flush_final_remcsum(struct sk_buff *skb,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/vxlan.c: In function 'vxlan_gro_receive':
drivers/net/vxlan.c:627:35: error: passing argument 2 of 'skb_gro_flush_fin=
al_remcsum' from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]
  skb_gro_flush_final_remcsum(skb, pp, flush, &grc);
                                   ^~
In file included from include/net/inet_sock.h:23:0,
                 from include/linux/udp.h:20,
                 from drivers/net/vxlan.c:17:
include/linux/netdevice.h:2799:20: note: expected 'struct sk_buff **' but a=
rgument is of type 'struct sk_buff *'
 static inline void skb_gro_flush_final_remcsum(struct sk_buff *skb,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  d4546c2509b1 ("net: Convert GRO SKB handling to list_head.")

from the net-next tree interacting with commit

  603d4cf8fe09 ("net: fix use-after-free in GRO with ESP")

from Linus' tree.

I took a guess and aplied the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 3 Jul 2018 10:37:05 +1000
Subject: [PATCH] net: update for conversion of GRO SKB handling

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/netdevice.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index e1d4084c0651..64480a0f2c16 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -2797,7 +2797,7 @@ static inline void skb_gro_flush_final(struct sk_buff=
 *skb, struct sk_buff *pp,
 		NAPI_GRO_CB(skb)->flush |=3D flush;
 }
 static inline void skb_gro_flush_final_remcsum(struct sk_buff *skb,
-					       struct sk_buff **pp,
+					       struct sk_buff *pp,
 					       int flush,
 					       struct gro_remcsum *grc)
 {
@@ -2813,7 +2813,7 @@ static inline void skb_gro_flush_final(struct sk_buff=
 *skb, struct sk_buff *pp,
 	NAPI_GRO_CB(skb)->flush |=3D flush;
 }
 static inline void skb_gro_flush_final_remcsum(struct sk_buff *skb,
-					       struct sk_buff **pp,
+					       struct sk_buff *pp,
 					       int flush,
 					       struct gro_remcsum *grc)
 {
--=20
2.17.1

--=20
Cheers,
Stephen Rothwell

--Sig_/UcNzjmxphxljKWWSpn/O1qz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAls6x5AACgkQAVBC80lX
0Gyirwf+N2tlY1eLSPdJC+Nsg5OXWD0uXLtpyQzNYwKmGEBTGL86oabLV5VkcJZ0
3d92vYhKxlhrqj8I3LLpw+9xjjtB6RImV596hJZjnDIpBUxwVG2WX3PH/4BMpyRp
u914A9R1C0NuVADc7mZk1EdVRu4Ai7H2L0tvEbIkzQj5zIAAKsZu726syOwlwN9x
FnCziI5zABGk//RTVDtxhuhfuUb6DHgjDQNUC2xOl9/cVEmxoJiw7fTXjTYu6/kX
ooxzKE5lMfEWXPUN4gaId/KUnMJaOGTYKhRxVivWmPo3NJOiVPLyRcXeoqtMM6dy
+Toy0V4SnEUm5e3L1snuuN6kjjyTMA==
=UgTG
-----END PGP SIGNATURE-----

--Sig_/UcNzjmxphxljKWWSpn/O1qz--
