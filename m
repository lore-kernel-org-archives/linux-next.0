From: Christoph Hellwig <hch@infradead.org>
Subject: Re: linux-next: block tree build failure
Date: Tue, 7 Jul 2009 09:57:06 -0400
Message-ID: <20090707135706.GB4997@infradead.org>
References: <20090707134908.e81b1556.sfr@canb.auug.org.au> <20090707063846.GY23611@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:43124 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754524AbZGGN5J (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Jul 2009 09:57:09 -0400
Content-Disposition: inline
In-Reply-To: <20090707063846.GY23611@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Zhang, Yanmin" <yanmin_zhang@linux.intel.com>

On Tue, Jul 07, 2009 at 08:38:46AM +0200, Jens Axboe wrote:
> >  SYSCALL_DEFINE0(sync)
> >  {
> > -	wakeup_pdflush(0);
> > +	wakeup_flusher_threads(0);
> >  	sync_filesystems(0);
> >  	sync_filesystems(1);
> >  	if (unlikely(laptop_mode))
> 
> That is correct! I have just now updated for-next as well, so your next
> pull should lose this fixup.

It's not correct at all.  We'll how have various flusher threads doing
async syncs, just to wait for them again synchronously.  The right thing
to do here is to queue up the data integrity sync to per-bdi threads and
execute those in parallel.
