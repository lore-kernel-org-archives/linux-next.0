From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: spinlock lockup with next-20081118 on powerpc
Date: Wed, 19 Nov 2008 14:34:09 +0100
Message-ID: <20081119133408.GE26308@kernel.dk>
References: <20081119093023.48895b84.sfr@canb.auug.org.au> <20081119091628.GT26308@kernel.dk> <20081119203922.0412c041.sfr@canb.auug.org.au> <20081119094300.GW26308@kernel.dk> <20081119213304.d2d21042.sfr@canb.auug.org.au> <20081119105833.GZ26308@kernel.dk> <20081120003224.8d0f481c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37570 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752857AbYKSNf5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Nov 2008 08:35:57 -0500
Content-Disposition: inline
In-Reply-To: <20081120003224.8d0f481c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: ppc-dev <linuxppc-dev@ozlabs.org>, linux-next@vger.kernel.org

On Thu, Nov 20 2008, Stephen Rothwell wrote:
> Hi Jens,
> 
> On Wed, 19 Nov 2008 11:58:33 +0100 Jens Axboe <jens.axboe@oracle.com> wrote:
> >
> > ;-) I'm aware of that, I meant the 'timer' data argument. But you are
> > right, it's probably q->queue_lock being NULL here or we would have
> > oopsed earlier. There's no code line.
> > 
> > > address of the spinlock (though I need to check more to be sure) as it
> > > crashed inside _spin_lock_irqsave.
> > 
> > Do you know what device this might be? It still makes no sense, if the
> > timer was added, we went through the normal IO paths and we would have
> > crashed on NULL ->queue_lock much earlier.
> 
> I don't know much more, but I may find out tomorrow with Paul's help.
> However it bisects down to commit
> 279430a72bb6e83d335b4219e9af5557e2ff3350 "block: leave the request
> timeout timer running even on an empty list" and reverting that commit on
> next-20081118 makes the spinlock lockup go away.

Are you removing devices or modules? We have a bug there it seems, does
this help?

diff --git a/block/blk-core.c b/block/blk-core.c
index 04267d6..44f547c 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -391,6 +391,7 @@ EXPORT_SYMBOL(blk_stop_queue);
 void blk_sync_queue(struct request_queue *q)
 {
 	del_timer_sync(&q->unplug_timer);
+	del_timer_sync(&q->timeout);
 	kblockd_flush_work(&q->unplug_work);
 }
 EXPORT_SYMBOL(blk_sync_queue);

-- 
Jens Axboe
