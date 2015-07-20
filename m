From: Benjamin LaHaise <bcrl@kvack.org>
Subject: Re: [PATCH] mm-move-mremap-from-file_operations-to-vm_operations_struct-fix
Date: Mon, 20 Jul 2015 13:51:45 -0400
Message-ID: <20150720175145.GH21558@kvack.org>
References: <20150716231405.GA25147@redhat.com> <20150716162444.26425f5e227387f1166a6d16@linux-foundation.org> <20150716235227.GA26551@redhat.com> <20150717140615.GA2779@kvack.org> <20150717223147.GA13259@redhat.com> <x49h9oysyct.fsf@segfault.boston.devel.redhat.com> <20150720173311.GA4379@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kanga.kvack.org ([205.233.56.17]:34220 "EHLO kanga.kvack.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932272AbbGTRvq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Jul 2015 13:51:46 -0400
Content-Disposition: inline
In-Reply-To: <20150720173311.GA4379@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Jeff Moyer <jmoyer@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Joonsoo Kim <js1304@gmail.com>, Fengguang Wu <fengguang.wu@intel.com>, Johannes Weiner <hannes@cmpxchg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jul 20, 2015 at 07:33:11PM +0200, Oleg Nesterov wrote:
> Hi Jeff,
> 
> On 07/20, Jeff Moyer wrote:
> >
> > Hi, Oleg,
> >
> > Oleg Nesterov <oleg@redhat.com> writes:
> >
> > > Shouldn't we account aio events/pages somehow, say per-user, or in
> > > mm->pinned_vm ?
> >
> > Ages ago I wrote a patch to account the completion ring to a process'
> > memlock limit:
> >   "[patch] aio: remove aio-max-nr and instead use the memlock rlimit to
> >    limit the number of pages pinned for the aio completion ring"
> >   http://marc.info/?l=linux-aio&m=123661380807041&w=2
> >
> > The problem with that patch is that it modifies the user/kernel
> > interface.  It could be done over time, as Andrew outlined in that
> > thread, but I've been reluctant to take that on.
> 
> See also the usage of mm->pinned_vm and user->locked_vm in perf_mmap(),
> perhaps aio can do the same...
> 
> > If you just mean we should account the memory so that the right process
> > can be killed, that sounds like a good idea to me.
> 
> Not sure we actually need this. I only meant that this looks confusing
> because this memory is actually locked but the kernel doesn't know this.
> 
> And btw, I forgot to mention that I triggered OOM on the testing machine
> with only 512mb ram, and aio-max-nr was huge. So, once again, while this
> all doesn't look right to me, I do not think this is the real problem.
> 
> Except the fact that an unpriviliged user can steal all aio-max-nr events.
> This probably worth fixing in any case.
> 
> 
> 
> And if we accept the fact this memory is locked and if we properly account
> it, then may be we can just kill aio_migratepage(), aio_private_file(), and
> change aio_setup_ring() to simply use install_special_mapping(). This will
> greatly simplify the code. But let me remind that I know nothing about aio,
> so please don't take my thoughts seriously.

No, you can't get rid of that code.  The page migration is required when 
CPUs/memory is offlined and data needs to be moved to another node.  
Similarly, support for mremap() is also required for container migration / 
restoration.

As for accounting locked memory, we don't do that for memory pinned by 
O_DIRECT either.  Given how small the amount of memory aio can pin is 
compared to O_DIRECT or mlock(), it is unlikely that the accounting of 
how much aio has pinned will make any real difference in the big picture.  
A single O_DIRECT i/o can pin megabytes of memory.

		-ben

> Oleg.

-- 
"Thought is the essence of where you are now."
