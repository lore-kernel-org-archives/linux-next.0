From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Mon, 17 Dec 2018 11:25:46 +1100
Message-ID: <20181217112546.4e400eb3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/n4jr4mJVHUCHD6pU9.Ubt3B"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Or Gerlitz <ogerlitz@mellanox.com>, Saeed Mahameed <saeedm@mellanox.com>, Eli Britstein <elibr@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/n4jr4mJVHUCHD6pU9.Ubt3B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/ethernet/mellanox/mlx5/core/en_tc.c

between commit:

  154e62abe9cd ("net/mlx5e: Properly initialize flow attributes for slow pa=
th eswitch rule deletion")

from the net tree and commit:

  e88afe759a49 ("net/mlx5e: Err if asked to mirror a goto chain tc eswitch =
rule")
  e85e02bad29e ("net/mlx5: E-Switch, Rename esw attr mirror count field")

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
index 9dabe9d4b279,53ebb5a48018..000000000000
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@@ -870,9 -903,9 +903,9 @@@ mlx5e_tc_offload_to_slow_path(struct ml
  	struct mlx5_flow_handle *rule;
 =20
  	memcpy(slow_attr, flow->esw_attr, sizeof(*slow_attr));
 -	slow_attr->action =3D MLX5_FLOW_CONTEXT_ACTION_FWD_DEST,
 -	slow_attr->split_count =3D 0,
 -	slow_attr->dest_chain =3D FDB_SLOW_PATH_CHAIN,
 +	slow_attr->action =3D MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
- 	slow_attr->mirror_count =3D 0;
++	slow_attr->split_count =3D 0;
 +	slow_attr->dest_chain =3D FDB_SLOW_PATH_CHAIN;
 =20
  	rule =3D mlx5e_tc_offload_fdb_rules(esw, flow, spec, slow_attr);
  	if (!IS_ERR(rule))
@@@ -887,9 -920,6 +920,9 @@@ mlx5e_tc_unoffload_from_slow_path(struc
  				  struct mlx5_esw_flow_attr *slow_attr)
  {
  	memcpy(slow_attr, flow->esw_attr, sizeof(*slow_attr));
 +	slow_attr->action =3D MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
- 	slow_attr->mirror_count =3D 0;
++	slow_attr->split_count =3D 0;
 +	slow_attr->dest_chain =3D FDB_SLOW_PATH_CHAIN;
  	mlx5e_tc_unoffload_fdb_rules(esw, flow, slow_attr);
  	flow->flags &=3D ~MLX5E_TC_FLOW_SLOW;
  }
@@@ -909,11 -939,13 +942,12 @@@ mlx5e_tc_add_fdb_flow(struct mlx5e_pri
  	struct mlx5e_rep_priv *rpriv;
  	struct mlx5e_priv *out_priv;
  	int err =3D 0, encap_err =3D 0;
+ 	int out_index;
 =20
 -	/* if prios are not supported, keep the old behaviour of using same prio
 -	 * for all offloaded rules.
 -	 */
 -	if (!mlx5_eswitch_prios_supported(esw))
 -		attr->prio =3D 1;
 +	if (!mlx5_eswitch_prios_supported(esw) && attr->prio !=3D 1) {
 +		NL_SET_ERR_MSG(extack, "E-switch priorities unsupported, upgrade FW");
 +		return -EOPNOTSUPP;
 +	}
 =20
  	if (attr->chain > max_chain) {
  		NL_SET_ERR_MSG(extack, "Requested chain is out of supported range");
@@@ -2980,15 -2667,7 +2667,15 @@@ static int parse_tc_fdb_actions(struct=20
  	if (!actions_match_supported(priv, exts, parse_attr, flow, extack))
  		return -EOPNOTSUPP;
 =20
 +	if (attr->dest_chain) {
 +		if (attr->action & MLX5_FLOW_CONTEXT_ACTION_FWD_DEST) {
 +			NL_SET_ERR_MSG(extack, "Mirroring goto chain rules isn't supported");
 +			return -EOPNOTSUPP;
 +		}
 +		attr->action |=3D MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
 +	}
 +
- 	if (attr->mirror_count > 0 && !mlx5_esw_has_fwd_fdb(priv->mdev)) {
+ 	if (attr->split_count > 0 && !mlx5_esw_has_fwd_fdb(priv->mdev)) {
  		NL_SET_ERR_MSG_MOD(extack,
  				   "current firmware doesn't support split rule for port mirroring");
  		netdev_warn_once(priv->netdev, "current firmware doesn't support split =
rule for port mirroring\n");

--Sig_/n4jr4mJVHUCHD6pU9.Ubt3B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwW7QoACgkQAVBC80lX
0Gwvegf/Yewd2xZBUwfUqKvwkYxk7atI6oLm4vk7LmfRICUjqQccU8EhPAzrHU4R
LolHPywYssdxAFET79sB2F8h1HDYlB8IJeRBjSbxLS/zVYgJDMjja71MvRHgIGjR
4idR4sUzt5cQnXuVg0+v8WmTzSy+9oN53mDOtfZG/D8nrwz84WW9CZNMRKOmQ+xd
VWwcFJXcjMQaxwYYZnrHC3LplpeeVpc0r0UC3DijpFjGBdmslMrdYJMGXT2DMXoK
eIIWrBgOWSFz1bqZxrL+nQzsLkDiVUqoSQw4TnuYp/7lqFSMpJlbwAE/AA3yeD3a
Tq9D7zvml+kfuu/maTD7sY0qQW1Uww==
=LAM2
-----END PGP SIGNATURE-----

--Sig_/n4jr4mJVHUCHD6pU9.Ubt3B--
