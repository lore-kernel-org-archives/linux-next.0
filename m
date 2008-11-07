From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the perfmon3 tree
Date: Fri, 7 Nov 2008 19:42:57 +1100
Message-ID: <20081107194257.501bb396.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59562 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751199AbYKGInC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Nov 2008 03:43:02 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: stephane eranian <eranian@googlemail.com>
Cc: linux-next@vger.kernel.org, David Miller <davem@davemloft.net>

Hi Stephane,

Today's linux-next merge of the perfmon3 tree got a conflict in
include/linux/sched.h between commit
f8d570a4745835f2238a33b537218a1bb03fc671 ("net: Fix recursive descent in
__scm_destroy()") from Linus' tree and commit
dab167960a632d29ef819adfa2d4c76a2ee3b26b ("perfmon: base code") from the
perfmon3 tree.

Just overlapping additions.  I fixed it up (see below) and you should fix
it in your tree by merging in Linus' tree and doing the same fixup in the
merge commit.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/linux/sched.h
index 755b570,16bf42d..0000000
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@@ -1304,8 -1349,9 +1304,11 @@@ struct task_struct 
  	 */
  	unsigned long timer_slack_ns;
  	unsigned long default_timer_slack_ns;
 +
 +	struct list_head	*scm_work_list;
+ #ifdef CONFIG_PERFMON_V20
+ 	struct pfm_context *pfm_context;
+ #endif
  };
  
  /*
