From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with the wireless-current
 tree
Date: Thu, 19 Feb 2009 16:23:16 +1100
Message-ID: <20090219162316.b866a74d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40140 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751163AbZBSFXU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Feb 2009 00:23:20 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Christian Lamparter <chunkeey@web.de>, "John W. Linville" <linville@tuxdriver.com>, Roel Kluin <roel.kluin@gmail.com>

Hi David,

Today's linux-next merge of the net tree got a conflict in
drivers/net/wireless/p54/p54common.c between commit
9de1643b4d59b416568bae04dbf67a374360765b ("p54: misplaced parentheses")
from the wireless-current tree and commit
51eed9923d98477e7f7473edd60d876d1cecc8c5 ("p54: implement FIF_OTHER_BSS
filter setting") from the net tree.

I fixed it up as suggested in John's merge test (see below) and can carry
the fix for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/net/wireless/p54/p54common.c
index 530daee,45c2e7a..0000000
--- a/drivers/net/wireless/p54/p54common.c
+++ b/drivers/net/wireless/p54/p54common.c
@@@ -1932,8 -2211,9 +2211,9 @@@ static void p54_configure_filter(struc
  	struct p54_common *priv = dev->priv;
  
  	*total_flags &= FIF_PROMISC_IN_BSS |
+ 			FIF_OTHER_BSS |
 -			(*total_flags & FIF_PROMISC_IN_BSS) ?
 -				FIF_FCSFAIL : 0;
 +			(*total_flags & FIF_PROMISC_IN_BSS ?
 +				FIF_FCSFAIL : 0);
  
  	priv->filter_flags = *total_flags;
  
