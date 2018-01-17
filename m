From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with the rdma-fixes tree
Date: Wed, 17 Jan 2018 12:51:45 +1100
Message-ID: <20180117125145.731ba88b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41913 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750823AbeAQBvr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 Jan 2018 20:51:47 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Jurgens <danielj@mellanox.com>, Leon Romanovsky <leon@kernel.org>

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/hw/mlx5/qp.c

between commit:

  ae59c3f0b6cf ("RDMA/mlx5: Fix out-of-bound access while querying AH")

from the rdma-fixes tree and commit:

  508562d6f708 ("IB/mlx5: Reduce the use of num_port capability")

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

diff --cc drivers/infiniband/hw/mlx5/qp.c
index cffe5966aef9,ae36db3d0deb..000000000000
--- a/drivers/infiniband/hw/mlx5/qp.c
+++ b/drivers/infiniband/hw/mlx5/qp.c
@@@ -4361,12 -4674,12 +4674,11 @@@ static void to_rdma_ah_attr(struct mlx5
  
  	memset(ah_attr, 0, sizeof(*ah_attr));
  
- 	if (!path->port || path->port > MLX5_CAP_GEN(dev, num_ports))
 -	ah_attr->type = rdma_ah_find_type(&ibdev->ib_dev, path->port);
 -	rdma_ah_set_port_num(ah_attr, path->port);
 -	if (rdma_ah_get_port_num(ah_attr) == 0 ||
 -	    rdma_ah_get_port_num(ah_attr) > ibdev->num_ports)
++	if (!path->port || path->port > ibdev->num_ports))
  		return;
  
 +	ah_attr->type = rdma_ah_find_type(&ibdev->ib_dev, path->port);
 +
  	rdma_ah_set_port_num(ah_attr, path->port);
  	rdma_ah_set_sl(ah_attr, path->dci_cfi_prio_sl & 0xf);
  
