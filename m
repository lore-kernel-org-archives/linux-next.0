From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with Linus' tree
Date: Fri, 8 Apr 2011 15:57:52 +1000
Message-ID: <20110408155752.78237894.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60268 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751523Ab1DHF5x (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Apr 2011 01:57:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lucas De Marchi <lucas.demarchi@profusion.mobi>, Hank Janssen <hjanssen@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, "K. Y. Srinivasan" <kys@microsoft.com>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in
drivers/staging/hv/hv_util.c between commit 25985edcedea ("Fix common
misspellings") from Linus' tree and commit af7a5b6e598c ("staging: hv:
Replaced DPRINT and printk with native functions in hv_utils") from the
staging tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/staging/hv/hv_util.c
index 2df1568,3af0a11..0000000
--- a/drivers/staging/hv/hv_util.c
+++ b/drivers/staging/hv/hv_util.c
@@@ -79,8 -78,8 +78,8 @@@ static void shutdown_onchannelcallback(
  				icmsghdrp->status = HV_S_OK;
  				execute_shutdown = true;
  
- 				DPRINT_INFO(VMBUS, "Shutdown request received -"
- 					    " graceful shutdown initiated");
+ 				pr_info("Shutdown request received -"
 -					    " gracefull shutdown initiated\n");
++					    " graceful shutdown initiated\n");
  				break;
  			default:
  				icmsghdrp->status = HV_E_FAIL;
