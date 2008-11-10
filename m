From: malahal@us.ibm.com
Subject: Re: linux-next: block tree build failure
Date: Sun, 9 Nov 2008 20:46:49 -0800
Message-ID: <20081110044649.GA18587@us.ibm.com>
References: <20081110145442.d60e57b7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e34.co.us.ibm.com ([32.97.110.152]:43142 "EHLO
	e34.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752963AbYKJEqv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 9 Nov 2008 23:46:51 -0500
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com [9.17.195.106])
	by e34.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id mAA4kSQn017205
	for <linux-next@vger.kernel.org>; Sun, 9 Nov 2008 21:46:28 -0700
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mAA4kos5123142
	for <linux-next@vger.kernel.org>; Sun, 9 Nov 2008 21:46:50 -0700
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mAA4knMd004089
	for <linux-next@vger.kernel.org>; Sun, 9 Nov 2008 21:46:50 -0700
Content-Disposition: inline
In-Reply-To: <20081110145442.d60e57b7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org

Stephen Rothwell [sfr@canb.auug.org.au] wrote:
> Hi Jens,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> block/blk-timeout.c: In function 'blk_rq_timed_out_timer':
> block/blk-timeout.c:140: error: 'next_set' undeclared (first use in this function)
> 
> Caused by commit 66f067c93b0eefc8613fd7a91cd6853e2bf48806 ("block:
> optimizations in blk_rq_timed_out_timer()").  Clearly not even
> compiled ...
> 

I compiled the code with the following patch on i386 arch. Should work
on powerpc too!

Signed-off-by: Malahal Naineni <malahal@us.ibm.com>


diff -r b824bf5f19d4 block/blk-timeout.c
--- a/block/blk-timeout.c	Sun Nov 09 20:15:10 2008 -0800
+++ b/block/blk-timeout.c	Sun Nov 09 20:18:07 2008 -0800
@@ -137,7 +137,7 @@
 	 * bump ->deadline to 1 so we can detect if the timer was ever added
 	 * or not. See comment in blk_add_timer()
 	 */
-	if (next_set)
+	if (next)
 		mod_timer(&q->timeout, round_jiffies_up(next));
 
 	spin_unlock_irqrestore(q->queue_lock, flags);
