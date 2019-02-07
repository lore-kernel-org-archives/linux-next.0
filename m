From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Thu, 7 Feb 2019 11:54:24 +1100
Message-ID: <20190207115425.61c3708a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9YA.2UXuNSrqpdapv=BbCtf"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guy Shattah <sguy@mellanox.com>, Saeed Mahameed <saeedm@mellanox.com>, Pablo Neira Ayuso <pablo@netfilter.org>
List-Id: linux-next.vger.kernel.org

--Sig_/9YA.2UXuNSrqpdapv=BbCtf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/ethernet/mellanox/mlx5/core/en_tc.c

between commit:

  1651925d403e ("net/mlx5e: Use the inner headers to determine tc/pedit off=
load limitation on decap flows")

from the net tree and commit:

  738678817573 ("drivers: net: use flow action infrastructure")

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

diff --cc drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
index 1c3c9fa26b55,83522c926d7c..000000000000
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@@ -1309,15 -1309,12 +1309,12 @@@ static int parse_tunnel_attr(struct mlx
  				       outer_headers);
  	void *headers_v =3D MLX5_ADDR_OF(fte_match_param, spec->match_value,
  				       outer_headers);
-=20
- 	struct flow_dissector_key_control *enc_control =3D
- 		skb_flow_dissector_target(f->dissector,
- 					  FLOW_DISSECTOR_KEY_ENC_CONTROL,
- 					  f->key);
- 	int err =3D 0;
+ 	struct flow_rule *rule =3D tc_cls_flower_offload_flow_rule(f);
+ 	struct flow_match_control enc_control;
+ 	int err;
 =20
  	err =3D mlx5e_tc_tun_parse(filter_dev, priv, spec, f,
 -				 headers_c, headers_v);
 +				 headers_c, headers_v, match_level);
  	if (err) {
  		NL_SET_ERR_MSG_MOD(extack,
  				   "failed to parse tunnel attributes");
@@@ -1465,19 -1455,17 +1455,17 @@@ static int __parse_cls_flower(struct ml
  		return -EOPNOTSUPP;
  	}
 =20
- 	if ((dissector_uses_key(f->dissector,
- 				FLOW_DISSECTOR_KEY_ENC_IPV4_ADDRS) ||
- 	     dissector_uses_key(f->dissector, FLOW_DISSECTOR_KEY_ENC_KEYID) ||
- 	     dissector_uses_key(f->dissector, FLOW_DISSECTOR_KEY_ENC_PORTS)) &&
- 	    dissector_uses_key(f->dissector, FLOW_DISSECTOR_KEY_ENC_CONTROL)) {
- 		struct flow_dissector_key_control *key =3D
- 			skb_flow_dissector_target(f->dissector,
- 						  FLOW_DISSECTOR_KEY_ENC_CONTROL,
- 						  f->key);
- 		switch (key->addr_type) {
+ 	if ((flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_ENC_IPV4_ADDRS) ||
+ 	     flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_ENC_KEYID) ||
+ 	     flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_ENC_PORTS)) &&
+ 	    flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_ENC_CONTROL)) {
+ 		struct flow_match_control match;
+=20
+ 		flow_rule_match_enc_control(rule, &match);
+ 		switch (match.key->addr_type) {
  		case FLOW_DISSECTOR_KEY_IPV4_ADDRS:
  		case FLOW_DISSECTOR_KEY_IPV6_ADDRS:
 -			if (parse_tunnel_attr(priv, spec, f, filter_dev))
 +			if (parse_tunnel_attr(priv, spec, f, filter_dev, tunnel_match_level))
  				return -EOPNOTSUPP;
  			break;
  		default:
@@@ -2180,22 -2129,17 +2131,22 @@@ static bool csum_offload_supported(stru
  }
 =20
  static bool modify_header_match_supported(struct mlx5_flow_spec *spec,
- 					  struct tcf_exts *exts,
+ 					  struct flow_action *flow_action,
 +					  u32 actions,
  					  struct netlink_ext_ack *extack)
  {
- 	const struct tc_action *a;
+ 	const struct flow_action_entry *act;
  	bool modify_ip_header;
  	u8 htype, ip_proto;
  	void *headers_v;
  	u16 ethertype;
- 	int nkeys, i;
+ 	int i;
 =20
 -	headers_v =3D MLX5_ADDR_OF(fte_match_param, spec->match_value, outer_hea=
ders);
 +	if (actions & MLX5_FLOW_CONTEXT_ACTION_DECAP)
 +		headers_v =3D MLX5_ADDR_OF(fte_match_param, spec->match_value, inner_he=
aders);
 +	else
 +		headers_v =3D MLX5_ADDR_OF(fte_match_param, spec->match_value, outer_he=
aders);
 +
  	ethertype =3D MLX5_GET(fte_match_set_lyr_2_4, headers_v, ethertype);
 =20
  	/* for non-IP we only re-write MACs, so we're okay */
@@@ -2251,8 -2191,9 +2198,9 @@@ static bool actions_match_supported(str
  		return false;
 =20
  	if (actions & MLX5_FLOW_CONTEXT_ACTION_MOD_HDR)
- 		return modify_header_match_supported(&parse_attr->spec, exts,
+ 		return modify_header_match_supported(&parse_attr->spec,
+ 						     flow_action,
 -						     extack);
 +						     actions, extack);
 =20
  	return true;
  }

--Sig_/9YA.2UXuNSrqpdapv=BbCtf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxbgcEACgkQAVBC80lX
0GzIXgf49xjk8Zp9UPc9swOF5xz0KSdEsKVrqncrNFL/YaD4NbqSCQrohK1r/GNU
mBZMAKueD9aeyUNXS5gUDH7joWV00LJfUCIr2hUqgecL7QnB//Iz5S3grV4X5/aP
D+NnQYwnTlt/gkV3wFjvq4cMVmBHATSPaaP4mUMkf+lRCZrElDBHORMJ84uteFKB
304N740Yuk4yZl63VJ03mIGqFn/cqcPhzMtfFtvlqjUiNDQJoEtq39TOsOi9w05K
8nhT8bjgh1wWm4SZWxKFx7kM//GWJvw7KIOu4gl7t0+T+4cmIPRRbwMCtQO6hZMN
tbmDvX0bzDRkZlzVFsAC+dxWEfbr
=ID3t
-----END PGP SIGNATURE-----

--Sig_/9YA.2UXuNSrqpdapv=BbCtf--
