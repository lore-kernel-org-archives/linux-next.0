From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Date: Tue, 8 Aug 2017 12:11:26 +1000
Message-ID: <20170808121126.4b04ea7f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45059 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751583AbdHHCL2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Aug 2017 22:11:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Huy Nguyen <huyn@mellanox.com>, Saeed Mahameed <saeedm@mellanox.com>

Hi Doug,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/net/ethernet/mellanox/mlx5/core/main.c

between commit:

  eeb66cdb6826 ("net/mlx5: Separate between E-Switch and MPFS")

from Linus' tree and commit:

  c85023e153e3 ("IB/mlx5: Add raw ethernet local loopback support")

from the rdma tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/net/ethernet/mellanox/mlx5/core/main.c
index 6dbd637b4e66,3cec683fd70f..000000000000
--- a/drivers/net/ethernet/mellanox/mlx5/core/main.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/main.c
@@@ -1155,6 -1168,16 +1168,12 @@@ static int mlx5_load_one(struct mlx5_co
  		goto err_fs;
  	}
  
+ 	err = mlx5_core_set_hca_defaults(dev);
+ 	if (err) {
+ 		dev_err(&pdev->dev, "Failed to set hca defaults\n");
+ 		goto err_fs;
+ 	}
+ 
 -#ifdef CONFIG_MLX5_CORE_EN
 -	mlx5_eswitch_attach(dev->priv.eswitch);
 -#endif
 -
  	err = mlx5_sriov_attach(dev);
  	if (err) {
  		dev_err(&pdev->dev, "sriov init failed %d\n", err);
