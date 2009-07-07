From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: block tree build failure
Date: Tue, 7 Jul 2009 16:31:50 +0200
Message-ID: <20090707143150.GF23611@kernel.dk>
References: <20090707134908.e81b1556.sfr@canb.auug.org.au> <20090707063846.GY23611@kernel.dk> <20090707135706.GB4997@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([93.163.65.50]:39785 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756606AbZGGObw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Jul 2009 10:31:52 -0400
Content-Disposition: inline
In-Reply-To: <20090707135706.GB4997@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Zhang, Yanmin" <yanmin_zhang@linux.intel.com>

On Tue, Jul 07 2009, Christoph Hellwig wrote:
> On Tue, Jul 07, 2009 at 08:38:46AM +0200, Jens Axboe wrote:
> > >  SYSCALL_DEFINE0(sync)
> > >  {
> > > -	wakeup_pdflush(0);
> > > +	wakeup_flusher_threads(0);
> > >  	sync_filesystems(0);
> > >  	sync_filesystems(1);
> > >  	if (unlikely(laptop_mode))
> > 
> > That is correct! I have just now updated for-next as well, so your next
> > pull should lose this fixup.
> 
> It's not correct at all.  We'll how have various flusher threads doing
> async syncs, just to wait for them again synchronously.  The right thing
> to do here is to queue up the data integrity sync to per-bdi threads and
> execute those in parallel.

Sorry, I didn't judge the validity of the original patch, merely that
the wakeup_pdflush() -> wakeup_flusher_threads() is the correct patch in
the context of the per-bdi flushing.

-- 
Jens Axboe
