From: Jeff Moyer <jmoyer@redhat.com>
Subject: Re: [PATCH] mm-move-mremap-from-file_operations-to-vm_operations_struct-fix
Date: Mon, 20 Jul 2015 14:30:10 -0400
Message-ID: <x49si8iy959.fsf@segfault.boston.devel.redhat.com>
References: <20150716231405.GA25147@redhat.com>
	<20150716162444.26425f5e227387f1166a6d16@linux-foundation.org>
	<20150716235227.GA26551@redhat.com> <20150717140615.GA2779@kvack.org>
	<20150717223147.GA13259@redhat.com>
	<x49h9oysyct.fsf@segfault.boston.devel.redhat.com>
	<20150720173311.GA4379@redhat.com> <20150720175145.GH21558@kvack.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:36781 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752940AbbGTSaN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Jul 2015 14:30:13 -0400
In-Reply-To: <20150720175145.GH21558@kvack.org> (Benjamin LaHaise's message of
	"Mon, 20 Jul 2015 13:51:45 -0400")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin LaHaise <bcrl@kvack.org>
Cc: Oleg Nesterov <oleg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Joonsoo Kim <js1304@gmail.com>, Fengguang Wu <fengguang.wu@intel.com>, Johannes Weiner <hannes@cmpxchg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Benjamin LaHaise <bcrl@kvack.org> writes:

> As for accounting locked memory, we don't do that for memory pinned by 
> O_DIRECT either.  Given how small the amount of memory aio can pin is 
> compared to O_DIRECT or mlock(), it is unlikely that the accounting of 
> how much aio has pinned will make any real difference in the big picture.  
> A single O_DIRECT i/o can pin megabytes of memory.

Actually, you can pin a lot of memory with aio.  Worst case, aio-max-nr
represents the maximum number of pages you can lock in memory (assuming
you pass 1 to io_setup in a loop).  So, for the default of 65536 events,
that comes to 256MB.

My system has libvirt installed, which changes the default to 1 million:
$ grep aio-max-nr /usr/lib/sysctl.d/libvirtd.conf
fs.aio-max-nr = 1048576

So, that means up to 4GB of memory can be tied up by aio.  Oracle's
installation guide recommends the same.

The difference between the aio ring and something like DIO is that the
ring is long-lived.  I/O, ideally, doesn't take that long, so that's a
poor comparison to make.

I tend to agree with Oleg, a system-wide setting just isn't a good fit
for this.  Changing it now that it's in place is difficult, though, and
obviously low priority.

-Jeff
