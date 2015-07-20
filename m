From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: [PATCH]
	mm-move-mremap-from-file_operations-to-vm_operations_struct-fix
Date: Mon, 20 Jul 2015 22:03:58 +0200
Message-ID: <20150720200358.GA22507@redhat.com>
References: <20150716162444.26425f5e227387f1166a6d16@linux-foundation.org> <20150716235227.GA26551@redhat.com> <20150717140615.GA2779@kvack.org> <20150717223147.GA13259@redhat.com> <x49h9oysyct.fsf@segfault.boston.devel.redhat.com> <20150720173311.GA4379@redhat.com> <20150720175145.GH21558@kvack.org> <20150720183150.GA6868@redhat.com> <20150720192440.GA20573@redhat.com> <20150720193912.GJ21558@kvack.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:59835 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752000AbbGTUFt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Jul 2015 16:05:49 -0400
Content-Disposition: inline
In-Reply-To: <20150720193912.GJ21558@kvack.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin LaHaise <bcrl@kvack.org>
Cc: Jeff Moyer <jmoyer@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Joonsoo Kim <js1304@gmail.com>, Fengguang Wu <fengguang.wu@intel.com>, Johannes Weiner <hannes@cmpxchg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/20, Benjamin LaHaise wrote:
>
> On Mon, Jul 20, 2015 at 09:24:40PM +0200, Oleg Nesterov wrote:
> > On 07/20, Oleg Nesterov wrote:
> > >
> > > But again, again, please ignore. This all is off-topic and my understanding
> > > is very limited.
> >
> > Yes, yes, but sorry for noise and let me repeat...
> >
> > This memory lives in page-cache/lru, it is visible for shrinker which
> > will unmap these pages for no reason on memory shortage. IOW, aio fools
> > the kernel, this memory looks reclaimable but it is not. And we only do
> > this for migration.
>
> And we have the same problem with O_DIRECT.

I don't this so, or I misunderstood. Sure, dio_get_page() will pin the page.
But not forever and this is unavoidable. This is not the same. OK, nevermind,
lets forget this.

> > And I should have changes the subject a long ago... So what do you think
> > we should do with the build failure?
>
> I honestly don't care what of the options you do -- please just don't go
> about adding BUG()s.

OK, thanks.

Then I'll send v2 which adds ifdef(MMU) into aio_ring_vm_ops tomorrow.

Oleg.
