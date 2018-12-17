From: Saeed Mahameed <saeedm@dev.mellanox.co.il>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Mon, 17 Dec 2018 13:20:33 -0800
Message-ID: <CALzJLG_g3QcYLM+ZXwfpu5E71nUOrG=KA4X2uR-WGeYAOYcsLg@mail.gmail.com>
References: <20181217112546.4e400eb3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217112546.4e400eb3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Or Gerlitz <ogerlitz@mellanox.com>, Saeed Mahameed <saeedm@mellanox.com>, Eli Britstein <elibr@mellanox.com>
List-Id: linux-next.vger.kernel.org

On Sun, Dec 16, 2018 at 4:25 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the net-next tree got a conflict in:
>
>   drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
>
> between commit:
>
>   154e62abe9cd ("net/mlx5e: Properly initialize flow attributes for slow path eswitch rule deletion")
>
> from the net tree and commit:
>
>   e88afe759a49 ("net/mlx5e: Err if asked to mirror a goto chain tc eswitch rule")
>   e85e02bad29e ("net/mlx5: E-Switch, Rename esw attr mirror count field")
>
> from the net-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
> index 9dabe9d4b279,53ebb5a48018..000000000000
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
> @@@ -870,9 -903,9 +903,9 @@@ mlx5e_tc_offload_to_slow_path(struct ml
>         struct mlx5_flow_handle *rule;
>
>         memcpy(slow_attr, flow->esw_attr, sizeof(*slow_attr));
>  -      slow_attr->action = MLX5_FLOW_CONTEXT_ACTION_FWD_DEST,
>  -      slow_attr->split_count = 0,
>  -      slow_attr->dest_chain = FDB_SLOW_PATH_CHAIN,
>  +      slow_attr->action = MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
> -       slow_attr->mirror_count = 0;
> ++      slow_attr->split_count = 0;
>  +      slow_attr->dest_chain = FDB_SLOW_PATH_CHAIN;
>
>         rule = mlx5e_tc_offload_fdb_rules(esw, flow, spec, slow_attr);
>         if (!IS_ERR(rule))
> @@@ -887,9 -920,6 +920,9 @@@ mlx5e_tc_unoffload_from_slow_path(struc
>                                   struct mlx5_esw_flow_attr *slow_attr)
>   {
>         memcpy(slow_attr, flow->esw_attr, sizeof(*slow_attr));
>  +      slow_attr->action = MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
> -       slow_attr->mirror_count = 0;
> ++      slow_attr->split_count = 0;
>  +      slow_attr->dest_chain = FDB_SLOW_PATH_CHAIN;
>         mlx5e_tc_unoffload_fdb_rules(esw, flow, slow_attr);
>         flow->flags &= ~MLX5E_TC_FLOW_SLOW;
>   }
> @@@ -909,11 -939,13 +942,12 @@@ mlx5e_tc_add_fdb_flow(struct mlx5e_pri
>         struct mlx5e_rep_priv *rpriv;
>         struct mlx5e_priv *out_priv;
>         int err = 0, encap_err = 0;
> +       int out_index;
>
>  -      /* if prios are not supported, keep the old behaviour of using same prio
>  -       * for all offloaded rules.
>  -       */
>  -      if (!mlx5_eswitch_prios_supported(esw))
>  -              attr->prio = 1;
>  +      if (!mlx5_eswitch_prios_supported(esw) && attr->prio != 1) {
>  +              NL_SET_ERR_MSG(extack, "E-switch priorities unsupported, upgrade FW");
>  +              return -EOPNOTSUPP;
>  +      }
>
>         if (attr->chain > max_chain) {
>                 NL_SET_ERR_MSG(extack, "Requested chain is out of supported range");
> @@@ -2980,15 -2667,7 +2667,15 @@@ static int parse_tc_fdb_actions(struct
>         if (!actions_match_supported(priv, exts, parse_attr, flow, extack))
>                 return -EOPNOTSUPP;
>
>  +      if (attr->dest_chain) {
>  +              if (attr->action & MLX5_FLOW_CONTEXT_ACTION_FWD_DEST) {
>  +                      NL_SET_ERR_MSG(extack, "Mirroring goto chain rules isn't supported");
>  +                      return -EOPNOTSUPP;
>  +              }
>  +              attr->action |= MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
>  +      }
>  +
> -       if (attr->mirror_count > 0 && !mlx5_esw_has_fwd_fdb(priv->mdev)) {
> +       if (attr->split_count > 0 && !mlx5_esw_has_fwd_fdb(priv->mdev)) {
>                 NL_SET_ERR_MSG_MOD(extack,
>                                    "current firmware doesn't support split rule for port mirroring");
>                 netdev_warn_once(priv->netdev, "current firmware doesn't support split rule for port mirroring\n");

Looks good to me.
