From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Date: Mon, 10 Oct 2016 11:59:46 +1100
Message-ID: <20161010115946.36c17e90@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60141 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751008AbcJJA7s (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 9 Oct 2016 20:59:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jack Morgenstein <jackm@dev.mellanox.co.il>, Moshe Shemesh <moshe@mellanox.com>, "David S. Miller" <davem@davemloft.net>

Hi Doug,

Today's linux-next merge of the rdma tree got conflicts in:

  drivers/net/ethernet/mellanox/mlx4/fw.c
  include/linux/mlx4/device.h

between commit:

  7c3d21c8153c ("net/mlx4_core: Preparation for VF vlan protocol 802.1ad")

from Linus' tree and commit:

  fd10ed8e6f42 ("IB/mlx4: Fix possible vl/sl field mismatch in LRH header in QP1 packets")

from the rdma tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/net/ethernet/mellanox/mlx4/fw.c
index f9cbc67f1694,d87bbe65c2b0..000000000000
--- a/drivers/net/ethernet/mellanox/mlx4/fw.c
+++ b/drivers/net/ethernet/mellanox/mlx4/fw.c
@@@ -159,7 -159,7 +159,8 @@@ static void dump_dev_cap_flags2(struct 
  		[32] = "Loopback source checks support",
  		[33] = "RoCEv2 support",
  		[34] = "DMFS Sniffer support (UC & MC)",
 +		[35] = "QinQ VST mode support",
+ 		[36] = "sl to vl mapping table change event support"
  	};
  	int i;
  
diff --cc include/linux/mlx4/device.h
index 59b50d3eedb4,062d10aaf5cb..000000000000
--- a/include/linux/mlx4/device.h
+++ b/include/linux/mlx4/device.h
@@@ -221,7 -222,7 +222,8 @@@ enum 
  	MLX4_DEV_CAP_FLAG2_ROCE_V1_V2		= 1ULL <<  33,
  	MLX4_DEV_CAP_FLAG2_DMFS_UC_MC_SNIFFER   = 1ULL <<  34,
  	MLX4_DEV_CAP_FLAG2_DIAG_PER_PORT	= 1ULL <<  35,
 -	MLX4_DEV_CAP_FLAG2_SL_TO_VL_CHANGE_EVENT = 1ULL << 36,
 +	MLX4_DEV_CAP_FLAG2_SVLAN_BY_QP          = 1ULL <<  36,
++	MLX4_DEV_CAP_FLAG2_SL_TO_VL_CHANGE_EVENT = 1ULL << 37,
  };
  
  enum {
