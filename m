From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree
Date: Tue, 21 Oct 2008 16:29:42 +1100
Message-ID: <20081021162942.00517398.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51231 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750866AbYJUFfD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Oct 2008 01:35:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org

Hi all,

Today's linux-next merge of the kmemcheck tree got a conflict in
kernel/sysctl.c between commit af936a1606246a10c145feac3770f6287f483f02
("vmscan: unevictable LRU scan sysctl") from Linus' tree and commit
385e31b9eae0528bada07d16a189f3f40df23961 ("kmemcheck: add the kmemcheck
core") from the kmemcheck tree.

Just overlapping additions (combined with a bad merge in the kmemcheck
tree).  I fixed it up (see below).

[Ingo: it looks like commit 05416cc42ac7072f39bcff036485e2b0fc1da3a9
("Merge branch 'linus' into kmemcheck") in the kmemcheck tree merged the
"rcutorture_runnable" sysctl into the wrong table.]

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/sysctl.c
index b3cc739,3383afd..0000000
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@@ -823,26 -825,17 +824,37 @@@ static struct ctl_table kern_table[] = 
  		.child		= key_sysctls,
  	},
  #endif
 +#ifdef CONFIG_RCU_TORTURE_TEST
 +	{
 +		.ctl_name       = CTL_UNNUMBERED,
 +		.procname       = "rcutorture_runnable",
 +		.data           = &rcutorture_runnable,
 +		.maxlen         = sizeof(int),
 +		.mode           = 0644,
 +		.proc_handler   = &proc_dointvec,
 +	},
 +#endif
 +#ifdef CONFIG_UNEVICTABLE_LRU
 +	{
 +		.ctl_name	= CTL_UNNUMBERED,
 +		.procname	= "scan_unevictable_pages",
 +		.data		= &scan_unevictable_pages,
 +		.maxlen		= sizeof(scan_unevictable_pages),
 +		.mode		= 0644,
 +		.proc_handler	= &scan_unevictable_handler,
 +	},
 +#endif
+ #ifdef CONFIG_KMEMCHECK
+ 	{
+ 		.ctl_name	= CTL_UNNUMBERED,
+ 		.procname	= "kmemcheck",
+ 		.data		= &kmemcheck_enabled,
+ 		.maxlen		= sizeof(int),
+ 		.mode		= 0644,
+ 		.proc_handler	= &proc_dointvec,
+ 	},
+ #endif
+ 
  /*
   * NOTE: do not add new entries to this table unless you have read
   * Documentation/sysctl/ctl_unnumbered.txt
