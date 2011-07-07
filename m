From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the net tree
Date: Thu, 7 Jul 2011 15:44:18 +1000
Message-ID: <20110707154418.2ef06852c79eb96adcbe8c4e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48098 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750756Ab1GGFoV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Jul 2011 01:44:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jesper Juhl <jj@chaosbits.net>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in
drivers/staging/rtl8192e/r8192E.h between commit 219eb47e6f35
("net/staging: add needed interrupt.h and hardirq.h includes") from the
net tree and commit 41134db17a7d ("Remove unneeded version.h includes
from drivers/staging/rtl*/") from the staging tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/staging/rtl8192e/r8192E.h
index 89fe8fc,0faa637..0000000
--- a/drivers/staging/rtl8192e/r8192E.h
+++ b/drivers/staging/rtl8192e/r8192E.h
@@@ -35,8 -35,6 +35,7 @@@
  #include <linux/proc_fs.h>	// Necessary because we use the proc fs
  #include <linux/if_arp.h>
  #include <linux/random.h>
- #include <linux/version.h>
 +#include <linux/interrupt.h>
  #include <asm/io.h>
  #include "ieee80211/rtl819x_HT.h"
  #include "ieee80211/ieee80211.h"
