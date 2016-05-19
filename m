From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Date: Thu, 19 May 2016 11:45:48 +1000
Message-ID: <20160519114548.3524ac02@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42009 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752342AbcESBpz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 May 2016 21:45:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matan Barak <matanb@mellanox.com>, Amir Vadai <amirva@mellanox.com>, "David S. Miller" <davem@davemloft.net>

Hi Doug,

Today's linux-next merge of the rdma tree got a conflict in:

  include/linux/mlx5/driver.h

between commit:

  43a335e055bb ("net/mlx5_core: Flow counters infrastructure")

from Linus' tree and commit:

  94c6825e0ff7 ("net/mlx5_core: Use tasklet for user-space CQ completion events")

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

diff --cc include/linux/mlx5/driver.h
index 07b504f7eb84,5a41f9003941..000000000000
--- a/include/linux/mlx5/driver.h
+++ b/include/linux/mlx5/driver.h
@@@ -41,7 -41,7 +41,8 @@@
  #include <linux/slab.h>
  #include <linux/vmalloc.h>
  #include <linux/radix-tree.h>
 +#include <linux/workqueue.h>
+ #include <linux/interrupt.h>
  
  #include <linux/mlx5/device.h>
  #include <linux/mlx5/doorbell.h>
