From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: next-2008-12-04: vm.bio_inline_vecs
Date: Fri, 5 Dec 2008 10:06:42 +0300
Message-ID: <20081205070642.GA31087@x200.localdomain>
References: <20081204200745.eff0ac87.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ug-out-1314.google.com ([66.249.92.168]:1316 "EHLO
	ug-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751279AbYLEHC1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 5 Dec 2008 02:02:27 -0500
Received: by ug-out-1314.google.com with SMTP id 39so4008346ugf.37
        for <linux-next@vger.kernel.org>; Thu, 04 Dec 2008 23:02:25 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20081204200745.eff0ac87.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, jens.axboe@oracle.com

Please, merge into 4d539d965767b98582fa9b7b57f51dbc0ab54fc4
aka "bio: add experimental support for inlining a number of bio_vecs inside the bio"

kernel/sysctl.c:1233: error: 'bio_inline_vecs' undeclared here (not in a function)

--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -1227,6 +1227,7 @@ static struct ctl_table vm_table[] = {
 		.extra2		= &one,
 	},
 #endif
+#ifdef CONFIG_BLOCK
 	{
 		.ctl_name	= CTL_UNNUMBERED,
 		.procname	= "bio_inline_vecs",
@@ -1237,6 +1238,7 @@ static struct ctl_table vm_table[] = {
 		.strategy	= &sysctl_intvec,
 		.extra1		= &zero,
 	},
+#endif
 /*
  * NOTE: do not add new entries to this table unless you have read
  * Documentation/sysctl/ctl_unnumbered.txt
