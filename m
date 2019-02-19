From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sound tree with the
 sound-asoc-fixes tree
Date: Tue, 19 Feb 2019 12:31:38 +1100
Message-ID: <20190219123138.562ed288@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3LOfxud2Gf7cMKC7z3y582D"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
List-Id: linux-next.vger.kernel.org

--Sig_/3LOfxud2Gf7cMKC7z3y582D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sound tree got a conflict in:

  sound/soc/generic/simple-card.c

between commit:

  19dd0777773a ("ASoC: simple-card: fixup refcount_t underflow")

from the sound-asoc-fixes tree and commit:

  c39291a76444 ("ASoC: simple-card: cleanup DAI link loop method - step2")

from the sound tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc sound/soc/generic/simple-card.c
index 3fe34417ec89,08df261024cf..000000000000
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@@ -401,8 -426,76 +426,76 @@@ dai_link_of_err
  	return ret;
  }
 =20
- static int asoc_simple_card_parse_aux_devs(struct device_node *node,
- 					   struct simple_card_data *priv)
+ static int simple_for_each_link(struct simple_priv *priv,
+ 			struct link_info *li,
+ 			int (*func_noml)(struct simple_priv *priv,
+ 					 struct device_node *np,
+ 					 struct device_node *codec,
+ 					 struct link_info *li, bool is_top),
+ 			int (*func_dpcm)(struct simple_priv *priv,
+ 					 struct device_node *np,
+ 					 struct device_node *codec,
+ 					 struct link_info *li, bool is_top))
+ {
+ 	struct device *dev =3D simple_priv_to_dev(priv);
+ 	struct device_node *top =3D dev->of_node;
+ 	struct device_node *node;
+ 	bool is_top =3D 0;
+=20
+ 	/* Check if it has dai-link */
+ 	node =3D of_get_child_by_name(top, PREFIX "dai-link");
+ 	if (!node) {
 -		node =3D top;
++		node =3D of_node_get(top);
+ 		is_top =3D 1;
+ 	}
+=20
+ 	/* loop for all dai-link */
+ 	do {
+ 		struct asoc_simple_card_data adata;
+ 		struct device_node *codec;
+ 		struct device_node *np;
+ 		int num =3D of_get_child_count(node);
+ 		int ret;
+=20
+ 		/* get codec */
+ 		codec =3D of_get_child_by_name(node, is_top ?
+ 					     PREFIX "codec" : "codec");
+ 		if (!codec)
+ 			return -ENODEV;
+=20
+ 		of_node_put(codec);
+=20
+ 		/* get convert-xxx property */
+ 		memset(&adata, 0, sizeof(adata));
+ 		for_each_child_of_node(node, np)
+ 			simple_get_conversion(dev, np, &adata);
+=20
+ 		/* loop for all CPU/Codec node */
+ 		for_each_child_of_node(node, np) {
+ 			/*
+ 			 * It is DPCM
+ 			 * if it has many CPUs,
+ 			 * or has convert-xxx property
+ 			 */
+ 			if (num > 2 ||
+ 			    adata.convert_rate || adata.convert_channels)
+ 				ret =3D func_dpcm(priv, np, codec, li, is_top);
+ 			/* else normal sound */
+ 			else
+ 				ret =3D func_noml(priv, np, codec, li, is_top);
+=20
+ 			if (ret < 0)
+ 				return ret;
+ 		}
+=20
+ 		node =3D of_get_next_child(top, node);
+ 	} while (!is_top && node);
+=20
+ 	return 0;
+ }
+=20
+ static int simple_parse_aux_devs(struct device_node *node,
+ 				 struct simple_priv *priv)
  {
  	struct device *dev =3D simple_priv_to_dev(priv);
  	struct device_node *aux_node;

--Sig_/3LOfxud2Gf7cMKC7z3y582D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxrXHoACgkQAVBC80lX
0GyRzwf/UFxAE3DZLTP67Y4aW8bskACiYpbbq8fmMg1ZnHXnMf7LmKgNPLPtezdX
0IK2BUJp2Kmvpw5tLopiCvzFW7tJykL8iehEwVpeyJbawaxZWCtXePtzh7ZBxjUA
1lQ0ZjJUmNOYHmXl+YCdVevEFfa9kdfX1nfX5JPghyC1Wm81D//MRqAFB3ip1XVx
6EgDgWlljBxt3ZttyxZq/whinjK4OUVk/BAs3J1FCvaBAMRXYcLpvYl0AHW8LGwt
HqljblCYjoDH2bWfiiT61iWBFOmM3GMg/ZtQ0GXfTYygDUmT2LlrEDqhBXlBHTqZ
gmy5aHucIu7Az0j0gNMzH38n2yHBwQ==
=U90/
-----END PGP SIGNATURE-----

--Sig_/3LOfxud2Gf7cMKC7z3y582D--
