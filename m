From: Eran Ben Elisha <eranlinuxmellanox@gmail.com>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Mon, 15 Jan 2018 09:53:14 +0200
Message-ID: <CAKHjkjk0G1rWvHCK5S0Twe=p+O6hqS0Et+odtdRuE_MzRDuvWA@mail.gmail.com>
References: <20180115105221.5f159c19@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vk0-f42.google.com ([209.85.213.42]:46558 "EHLO
        mail-vk0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751732AbeAOHxQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Jan 2018 02:53:16 -0500
In-Reply-To: <20180115105221.5f159c19@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eran Ben Elisha <eranbe@mellanox.com>, Saeed Mahameed <saeedm@mellanox.com>, Or Gerlitz <ogerlitz@mellanox.com>

On Mon, Jan 15, 2018 at 1:52 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the net-next tree got a conflict in:
>
>   include/linux/mlx5/mlx5_ifc.h
>
> between commit:
>
>   8978cc921fc7 ("{net,ib}/mlx5: Don't disable local loopback multicast traffic when needed")
>
> from the net tree and commit:
>
>   40817cdbb695 ("net/mlx5: Add hairpin definitions to the FW API")
>
> from the net-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

sure, https://patchwork.ozlabs.org/patch/859425/

>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc include/linux/mlx5/mlx5_ifc.h
> index 1391a82da98e,78e36fc2609e..000000000000
> --- a/include/linux/mlx5/mlx5_ifc.h
> +++ b/include/linux/mlx5/mlx5_ifc.h
> @@@ -1027,9 -1035,10 +1035,10 @@@ struct mlx5_ifc_cmd_hca_cap_bits
>         u8         log_max_wq_sz[0x5];
>
>         u8         nic_vport_change_event[0x1];
>  -      u8         disable_local_lb[0x1];
>  -      u8         reserved_at_3e2[0x1];
>  +      u8         disable_local_lb_uc[0x1];
>  +      u8         disable_local_lb_mc[0x1];
> -       u8         reserved_at_3e3[0x8];
> +       u8         log_min_hairpin_wq_data_sz[0x5];
> +       u8         reserved_at_3e8[0x3];

Conflict fix looks good as proposed.

thanks for the fix,
Eran.

>         u8         log_max_vlan_list[0x5];
>         u8         reserved_at_3f0[0x3];
>         u8         log_max_current_mc_list[0x5];
