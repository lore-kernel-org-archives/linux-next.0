From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with the net-next tree
Date: Tue, 5 Jan 2016 12:51:54 +1100
Message-ID: <20160105125154.36d9a0c4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41188 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753859AbcAEBv5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 4 Jan 2016 20:51:57 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>, David Miller <davem@davemloft.net>, netdev@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Saeed Mahameed <saeedm@mellanox.com>, Achiad Shochat <achiad@mellanox.com>, Or Gerlitz <ogerlitz@mellanox.com>

Hi Doug,

Today's linux-next merge of the rdma tree got conflicts in:

  drivers/net/ethernet/mellanox/mlx5/core/vport.c
  include/linux/mlx5/mlx5_ifc.h
  include/linux/mlx5/vport.h

between commits:

  e1d7d349c69d ("net/mlx5: Update access functions to Query/Modify vport MAC address")
  e75465148b7d ("net/mlx5: Introduce access functions to modify/query vport state")

from the net-next tree and commit:

  e5f6175c5b66 ("net/mlx5_core: Break down the vport mac address query function")

from the rdma tree and maybe some others.

I have no hope of fixing this stuff up, so I have dropped the rdma tree
again for today.  There is similar functionality being introduced in
both trees ... please sort this mess out ...

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
