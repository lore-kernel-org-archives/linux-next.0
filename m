From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build warnings after merge of the akpm-current tree
Date: Thu, 29 Aug 2013 12:42:08 -0700
Message-ID: <20130829124208.7b97594d8a8723d45d1bad34@linux-foundation.org>
References: <20130829194741.ff75bb1ce06207d5d3a703de@canb.auug.org.au>
	<521F2F7E.8010702@parallels.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:36213 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755556Ab3H2TmK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Aug 2013 15:42:10 -0400
In-Reply-To: <521F2F7E.8010702@parallels.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Maxim Patlasov <mpatlasov@parallels.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 29 Aug 2013 15:24:46 +0400 Maxim Patlasov <mpatlasov@parallels.com> wrote:

> Hi Stephen,
> 
> 08/29/2013 01:47 PM, Stephen Rothwell __________:
> > Hi Andrew,
> >
> > After merging the akpm tree, today's linux-next build (sparc64 defconfig
> > and others) produced these warnings:
> >
> > mm/page-writeback.c: In function 'balance_dirty_pages_ratelimited':
> > mm/page-writeback.c:1450:13: warning: 'bdi_thresh' may be used uninitialized in this function [-Wuninitialized]
> > mm/page-writeback.c:1372:16: note: 'bdi_thresh' was declared here
> > mm/page-writeback.c:1226:16: warning: 'bdi_dirty' may be used uninitialized in this function [-Wuninitialized]
> > mm/page-writeback.c:1369:16: note: 'bdi_dirty' was declared here
> >
> > Possibly introduced by commit 34c547af1e23 ("mm/page-writeback.c: add
> > strictlimit feature"), but I am not sure anything can be done about them.
> >
> 
> This looks as gcc glitch. So far as I didn't observe the warnings, the 
> version of gcc does matter. May be moving the definitions of the two 
> variables into for(;;){...} would help. Could you please give it a try?

Shuffling the definitions around won't help.  To fix this we'll need to
add more code and I hate adding runtime overhead to address
compile-time issues.  So...

--- a/mm/page-writeback.c~a
+++ a/mm/page-writeback.c
@@ -1366,10 +1366,8 @@ static void balance_dirty_pages(struct a
 {
 	unsigned long nr_reclaimable;	/* = file_dirty + unstable_nfs */
 	unsigned long nr_dirty;  /* = file_dirty + writeback + unstable_nfs */
-	unsigned long bdi_dirty;
 	unsigned long background_thresh;
 	unsigned long dirty_thresh;
-	unsigned long bdi_thresh;
 	long period;
 	long pause;
 	long max_pause;
@@ -1385,8 +1383,10 @@ static void balance_dirty_pages(struct a
 
 	for (;;) {
 		unsigned long now = jiffies;
-		unsigned long dirty;
+		unsigned long uninitialized_var(bdi_thresh);
 		unsigned long thresh;
+		unsigned long uninitialized_var(bdi_dirty);
+		unsigned long dirty;
 		unsigned long bg_thresh;
 
 		/*
_
