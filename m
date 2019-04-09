From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: linux-next: manual merge of the mac80211-next tree with the
 mac80211 tree
Date: Tue, 9 Apr 2019 11:06:07 +1000
Message-ID: <20190409110607.29df3cf3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/nk7TK0lKM_uOHgtwjGYIvFv"; protocol="application/pgp-signature"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Linux Next Mailing List <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
List-Id: linux-next.vger.kernel.org

--Sig_/nk7TK0lKM_uOHgtwjGYIvFv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mac80211-next tree got a conflict in:

  net/mac80211/tx.c

between commit:

  eb9b64e3a9f8 ("mac80211: fix memory accounting with A-MSDU aggregation")

from the mac80211 tree and commit:

  dcec1d9bc8a7 ("mac80211: calculate hash for fq without holding fq->lock i=
n itxq enqueue")

from the mac80211-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc net/mac80211/tx.c
index 2e816dd67be7,3655aae96df1..000000000000
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@@ -3221,7 -3219,7 +3219,8 @@@ static bool ieee80211_amsdu_aggregate(s
  	u8 max_subframes =3D sta->sta.max_amsdu_subframes;
  	int max_frags =3D local->hw.max_tx_fragments;
  	int max_amsdu_len =3D sta->sta.max_amsdu_len;
 +	int orig_truesize;
+ 	u32 flow_idx;
  	__be16 len;
  	void *data;
  	bool ret =3D false;

--Sig_/nk7TK0lKM_uOHgtwjGYIvFv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyr7/8ACgkQAVBC80lX
0Gz0cQgAm7Z45grpN06oI1vDHbeyWc1Nf5XOqaDdgOzObo+f8Fbemq832Wv9g9Rv
2Um1yA8WsPO1n+avHfatwoEV8O34shDxpRxCQkSauALhsdKY4W1Wlp8FA2M7GteV
E66NVIITDIL8Men0nhNTUG9UFWpI7yeEfzJyHhX0Zm3w3AyVTJqYn/06ikKYObx6
ue8YTx74ttTG/hK1N9MMoDSGNFqx+XaG9MQPWdqhi30Q1KV10hOpHUNu56ma7ZSQ
erEM9Lk1R3DJLYKklLGJEXz+x0yXQ+pHYIVYxWY6RNkFz5g+5P8z0j3ptRY6N9ki
/CohVqDhFhZEEb2RJPDCSpc1jpCRMQ==
=g+rO
-----END PGP SIGNATURE-----

--Sig_/nk7TK0lKM_uOHgtwjGYIvFv--
