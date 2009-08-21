From: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Subject: Re: [PATCH -next] block: blk-iopoll sysctl iff CONFIG_BLOCK
Date: Fri, 21 Aug 2009 16:41:13 +0530
Message-ID: <20090821111113.GA5105@linux.vnet.ibm.com>
References: <20090807183118.e71b4db2.sfr@canb.auug.org.au> <20090807111659.3d8da27f.randy.dunlap@oracle.com> <20090807192144.GZ12579@kernel.dk>
Reply-To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp07.au.ibm.com ([202.81.31.140]:56690 "EHLO
	e23smtp07.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752078AbZHULLT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 21 Aug 2009 07:11:19 -0400
Content-Disposition: inline
In-Reply-To: <20090807192144.GZ12579@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

* Jens Axboe <jens.axboe@oracle.com> [2009-08-07 21:21:44]:

> On Fri, Aug 07 2009, Randy Dunlap wrote:
> > From: Randy Dunlap <randy.dunlap@oracle.com>
> > 
> > New block-iopoll sysctl should be surrounded by CONFIG_BLOCK to
> > prevent build error:
> > 
> > kernel/built-in.o:(.data+0x2990): undefined reference to `blk_iopoll_enabled'
> 
> Thanks, I'll just kill off this sysctl, it should be driver controller
> anyway. Was just easier for testing :-)

Hi Jens,

This build failure is still seen with next-20090820 kernel, removing
the sysctl helps. Attaching the patch based on your recommendation.
Please drop the patch if you already have in queue.

Signed-off-by: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
--
 kernel/sysctl.c |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 40f2d2c..6e67ec2 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -991,14 +991,6 @@ static struct ctl_table kern_table[] = {
 		.proc_handler	= &proc_dointvec,
 	},
 #endif
-	{
-		.ctl_name	= CTL_UNNUMBERED,
-		.procname	= "blk_iopoll",
-		.data		= &blk_iopoll_enabled,
-		.maxlen		= sizeof(int),
-		.mode		= 0644,
-		.proc_handler	= &proc_dointvec,
-	},
 /*
  * NOTE: do not add new entries to this table unless you have read
  * Documentation/sysctl/ctl_unnumbered.txt
		

			Kamalesh
