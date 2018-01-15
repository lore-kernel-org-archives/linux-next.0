From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with the net tree
Date: Mon, 15 Jan 2018 11:53:21 +1100
Message-ID: <20180115115321.1d1abc11@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43469 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751421AbeAOAxY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 Jan 2018 19:53:24 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eran Ben Elisha <eranbe@mellanox.com>, Saeed Mahameed <saeedm@mellanox.com>, Eugenia Emantayev <eugenia@mellanox.com>, Mark Bloch <markb@mellanox.com>, Leon Romanovsky <leon@kernel.org>

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/hw/mlx5/main.c

between commits:

  8978cc921fc7 ("{net,ib}/mlx5: Don't disable local loopback multicast traffic when needed")
  72f36be06138 ("net/mlx5: Fix mlx5_get_uars_page to return error code")

from the net tree and commits:

  16c1975f1032 ("IB/mlx5: Create profile infrastructure to add and remove stages")
  c8b8992446a9 ("IB/mlx5: Move loopback initialization to the corresponding stage")

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

diff --cc drivers/infiniband/hw/mlx5/main.c
index 262c1aa2e028,91e6b42798e5..000000000000
--- a/drivers/infiniband/hw/mlx5/main.c
+++ b/drivers/infiniband/hw/mlx5/main.c
@@@ -4111,8 -4669,38 +4671,39 @@@ static int mlx5_ib_stage_caps_init(stru
  			(1ull << IB_USER_VERBS_EX_CMD_CREATE_FLOW) |
  			(1ull << IB_USER_VERBS_EX_CMD_DESTROY_FLOW);
  
- 	if (mlx5_ib_port_link_layer(&dev->ib_dev, 1) ==
- 	    IB_LINK_LAYER_ETHERNET) {
+ 	err = init_node_data(dev);
+ 	if (err)
+ 		return err;
+ 
+ 	if ((MLX5_CAP_GEN(dev->mdev, port_type) == MLX5_CAP_PORT_TYPE_ETH) &&
 -	    MLX5_CAP_GEN(dev->mdev, disable_local_lb))
++	    (MLX5_CAP_GEN(dev->mdev, disable_local_lb_uc) ||
++	     MLX5_CAP_GEN(dev->mdev, disable_local_lb_mc)))
+ 		mutex_init(&dev->lb_mutex);
+ 
+ 	return 0;
+ }
+ 
+ static int mlx5_ib_stage_roce_init(struct mlx5_ib_dev *dev)
+ {
+ 	struct mlx5_core_dev *mdev = dev->mdev;
+ 	enum rdma_link_layer ll;
+ 	int port_type_cap;
+ 	u8 port_num;
+ 	int err;
+ 	int i;
+ 
+ 	port_num = mlx5_core_native_port_num(dev->mdev) - 1;
+ 	port_type_cap = MLX5_CAP_GEN(mdev, port_type);
+ 	ll = mlx5_port_type_cap_to_rdma_ll(port_type_cap);
+ 
+ 	if (ll == IB_LINK_LAYER_ETHERNET) {
+ 		for (i = 0; i < dev->num_ports; i++) {
+ 			dev->roce[i].dev = dev;
+ 			dev->roce[i].native_port_num = i + 1;
+ 			dev->roce[i].last_port_state = IB_PORT_DOWN;
+ 		}
+ 
+ 		dev->ib_dev.get_netdev	= mlx5_ib_get_netdev;
  		dev->ib_dev.create_wq	 = mlx5_ib_create_wq;
  		dev->ib_dev.modify_wq	 = mlx5_ib_modify_wq;
  		dev->ib_dev.destroy_wq	 = mlx5_ib_destroy_wq;
@@@ -4124,44 -4712,94 +4715,94 @@@
  			(1ull << IB_USER_VERBS_EX_CMD_DESTROY_WQ) |
  			(1ull << IB_USER_VERBS_EX_CMD_CREATE_RWQ_IND_TBL) |
  			(1ull << IB_USER_VERBS_EX_CMD_DESTROY_RWQ_IND_TBL);
+ 		err = mlx5_enable_eth(dev, port_num);
+ 		if (err)
+ 			return err;
  	}
- 	err = init_node_data(dev);
- 	if (err)
- 		goto err_free_port;
  
- 	mutex_init(&dev->flow_db.lock);
- 	mutex_init(&dev->cap_mask_mutex);
- 	INIT_LIST_HEAD(&dev->qp_list);
- 	spin_lock_init(&dev->reset_flow_resource_lock);
+ 	return 0;
+ }
+ 
+ static void mlx5_ib_stage_roce_cleanup(struct mlx5_ib_dev *dev)
+ {
+ 	struct mlx5_core_dev *mdev = dev->mdev;
+ 	enum rdma_link_layer ll;
+ 	int port_type_cap;
+ 	u8 port_num;
+ 
+ 	port_num = mlx5_core_native_port_num(dev->mdev) - 1;
+ 	port_type_cap = MLX5_CAP_GEN(mdev, port_type);
+ 	ll = mlx5_port_type_cap_to_rdma_ll(port_type_cap);
  
  	if (ll == IB_LINK_LAYER_ETHERNET) {
- 		err = mlx5_enable_eth(dev);
- 		if (err)
- 			goto err_free_port;
- 		dev->roce.last_port_state = IB_PORT_DOWN;
+ 		mlx5_disable_eth(dev);
+ 		mlx5_remove_netdev_notifier(dev, port_num);
  	}
+ }
  
- 	err = create_dev_resources(&dev->devr);
- 	if (err)
- 		goto err_disable_eth;
+ static int mlx5_ib_stage_dev_res_init(struct mlx5_ib_dev *dev)
+ {
+ 	return create_dev_resources(&dev->devr);
+ }
  
- 	err = mlx5_ib_odp_init_one(dev);
- 	if (err)
- 		goto err_rsrc;
+ static void mlx5_ib_stage_dev_res_cleanup(struct mlx5_ib_dev *dev)
+ {
+ 	destroy_dev_resources(&dev->devr);
+ }
+ 
+ static int mlx5_ib_stage_odp_init(struct mlx5_ib_dev *dev)
+ {
+ 	mlx5_ib_internal_fill_odp_caps(dev);
  
+ 	return mlx5_ib_odp_init_one(dev);
+ }
+ 
+ static int mlx5_ib_stage_counters_init(struct mlx5_ib_dev *dev)
+ {
  	if (MLX5_CAP_GEN(dev->mdev, max_qp_cnt)) {
- 		err = mlx5_ib_alloc_counters(dev);
- 		if (err)
- 			goto err_odp;
+ 		dev->ib_dev.get_hw_stats	= mlx5_ib_get_hw_stats;
+ 		dev->ib_dev.alloc_hw_stats	= mlx5_ib_alloc_hw_stats;
+ 
+ 		return mlx5_ib_alloc_counters(dev);
  	}
  
- 	err = mlx5_ib_init_cong_debugfs(dev);
- 	if (err)
- 		goto err_cnt;
+ 	return 0;
+ }
+ 
+ static void mlx5_ib_stage_counters_cleanup(struct mlx5_ib_dev *dev)
+ {
+ 	if (MLX5_CAP_GEN(dev->mdev, max_qp_cnt))
+ 		mlx5_ib_dealloc_counters(dev);
+ }
+ 
+ static int mlx5_ib_stage_cong_debugfs_init(struct mlx5_ib_dev *dev)
+ {
+ 	return mlx5_ib_init_cong_debugfs(dev,
+ 					 mlx5_core_native_port_num(dev->mdev) - 1);
+ }
  
+ static void mlx5_ib_stage_cong_debugfs_cleanup(struct mlx5_ib_dev *dev)
+ {
+ 	mlx5_ib_cleanup_cong_debugfs(dev,
+ 				     mlx5_core_native_port_num(dev->mdev) - 1);
+ }
+ 
+ static int mlx5_ib_stage_uar_init(struct mlx5_ib_dev *dev)
+ {
  	dev->mdev->priv.uar = mlx5_get_uars_page(dev->mdev);
 -	if (!dev->mdev->priv.uar)
 +	if (IS_ERR(dev->mdev->priv.uar))
- 		goto err_cong;
+ 		return -ENOMEM;
+ 	return 0;
+ }
+ 
+ static void mlx5_ib_stage_uar_cleanup(struct mlx5_ib_dev *dev)
+ {
+ 	mlx5_put_uars_page(dev->mdev, dev->mdev->priv.uar);
+ }
+ 
+ static int mlx5_ib_stage_bfrag_init(struct mlx5_ib_dev *dev)
+ {
+ 	int err;
  
  	err = mlx5_alloc_bfreg(dev->mdev, &dev->bfreg, false, false);
  	if (err)
