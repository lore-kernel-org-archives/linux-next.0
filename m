From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: [PATCH]
	mm-move-mremap-from-file_operations-to-vm_operations_struct-fix
Date: Mon, 20 Jul 2015 20:31:50 +0200
Message-ID: <20150720183150.GA6868@redhat.com>
References: <20150716231405.GA25147@redhat.com> <20150716162444.26425f5e227387f1166a6d16@linux-foundation.org> <20150716235227.GA26551@redhat.com> <20150717140615.GA2779@kvack.org> <20150717223147.GA13259@redhat.com> <x49h9oysyct.fsf@segfault.boston.devel.redhat.com> <20150720173311.GA4379@redhat.com> <20150720175145.GH21558@kvack.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:43661 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754054AbbGTSdk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Jul 2015 14:33:40 -0400
Content-Disposition: inline
In-Reply-To: <20150720175145.GH21558@kvack.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin LaHaise <bcrl@kvack.org>
Cc: Jeff Moyer <jmoyer@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Joonsoo Kim <js1304@gmail.com>, Fengguang Wu <fengguang.wu@intel.com>, Johannes Weiner <hannes@cmpxchg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/20, Benjamin LaHaise wrote:
>
> On Mon, Jul 20, 2015 at 07:33:11PM +0200, Oleg Nesterov wrote:
> >
> > And if we accept the fact this memory is locked and if we properly account
> > it, then may be we can just kill aio_migratepage(), aio_private_file(), and
> > change aio_setup_ring() to simply use install_special_mapping(). This will
> > greatly simplify the code. But let me remind that I know nothing about aio,
> > so please don't take my thoughts seriously.
>
> No, you can't get rid of that code.  The page migration is required when
> CPUs/memory is offlined and data needs to be moved to another node.

Of course, if we remove aio_migratepage() then aio can't be moved,

> Similarly, support for mremap() is also required for container migration /
> restoration.

This is not the problem. And one of the reasons to move ->mremap() into
vm_operations_struct was that install_special_mapping() can use it.

> Given how small the amount of memory aio can pin

I agree, but why should we worry about migration then? let this memory be
unmovable, don't use GFP_RECLAIMABLE/MOVABLE, etc.

But again, again, please ignore. This all is off-topic and my understanding
is very limited.

> it is unlikely that the accounting of
> how much aio has pinned will make any real difference in the big picture.

Agreed, but this can help to remove the system-wide aio-max-nr. Again,
unpriviliged user can steal aio.

Oleg.
