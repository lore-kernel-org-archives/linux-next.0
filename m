From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with the infiniband tree
Date: Thu, 26 Mar 2009 14:27:04 +1100
Message-ID: <20090326142704.20ff442c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50931 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754379AbZCZD1L (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Mar 2009 23:27:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Roland Dreier <rdreier@cisco.com>
Cc: linux-next@vger.kernel.org, Divy Le Ray <divy@chelsio.com>, Steve Wise <swise@opengridcomputing.com>, general@lists.openfabrics.org

Hi Dave, Roland,

Today's linux-next merge of the net tree got a conflict in
drivers/infiniband/hw/cxgb3/cxio_hal.h between commit
d1fbe04eee32ed2642cff139b8592866f1d43f41 ("") from the infiniband tree
and commit a73efd0a8552927ebe5dff84936f7fdac4f7e314 ("iw_cxgb3: handle
chip reset notifications") from the net tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/infiniband/hw/cxgb3/cxio_hal.h
index e44dc22,9ed65b0..0000000
--- a/drivers/infiniband/hw/cxgb3/cxio_hal.h
+++ b/drivers/infiniband/hw/cxgb3/cxio_hal.h
@@@ -110,7 -108,8 +110,9 @@@ struct cxio_rdev 
  	struct gen_pool *pbl_pool;
  	struct gen_pool *rqt_pool;
  	struct list_head entry;
 +	struct ch_embedded_info fw_info;
+ 	u32	flags;
+ #define	CXIO_ERROR_FATAL	1
  };
  
  static inline int cxio_num_stags(struct cxio_rdev *rdev_p)
