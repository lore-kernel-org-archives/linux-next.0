From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Mon, 15 Dec 2008 14:44:05 +1100
Message-ID: <20081215144405.d284833d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43728 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751802AbYLODoN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 14 Dec 2008 22:44:13 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Bruce Allan <bruce.w.allan@intel.com>

Hi David,

Today's linux-next merge of the net tree got a conflict in
drivers/net/e1000e/ich8lan.c between commit
30bb0e0dce78427f3e5cb728d6b5ea73acbefffa ("e1000e: fix double release of
mutex") from the net-current tree and commit
0285c8dcaeaa73ddadc4f38383e5bbc03c394a29 ("e1000e: cosmetic newline in
debug message") from the net tree.

Trivial context overlap.  I fixed it up (see below) and will carry as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/net/e1000e/ich8lan.c
index d115a6d,92f2ace..0000000
--- a/drivers/net/e1000e/ich8lan.c
+++ b/drivers/net/e1000e/ich8lan.c
@@@ -1893,8 -1939,7 +1939,8 @@@ static s32 e1000_reset_hw_ich8lan(struc
  		ctrl |= E1000_CTRL_PHY_RST;
  	}
  	ret_val = e1000_acquire_swflag_ich8lan(hw);
 +	/* Whether or not the swflag was acquired, we need to reset the part */
- 	hw_dbg(hw, "Issuing a global reset to ich8lan");
+ 	hw_dbg(hw, "Issuing a global reset to ich8lan\n");
  	ew32(CTRL, (ctrl | E1000_CTRL_RST));
  	msleep(20);
  
