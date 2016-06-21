From: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH 2/2] ipc/sem: sem_lock with hysteresis
Date: Tue, 21 Jun 2016 13:29:02 -0700
Message-ID: <20160621202902.GB3790@linux-80c1.suse>
References: <20160615152318.164b1ebd@canb.auug.org.au>
 <1466280142-19741-1-git-send-email-manfred@colorfullife.com>
 <1466280142-19741-2-git-send-email-manfred@colorfullife.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:34012 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751260AbcFUU3p (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Jun 2016 16:29:45 -0400
Content-Disposition: inline
In-Reply-To: <1466280142-19741-2-git-send-email-manfred@colorfullife.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Manfred Spraul <manfred@colorfullife.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, 1vier1@web.de, felixh@informatik.uni-bremen.de

On Sat, 18 Jun 2016, Manfred Spraul wrote:

>sysv sem has two lock modes: One with per-semaphore locks, one lock mode
>with a single big lock for the whole array.
>When switching from the per-semaphore locks to the big lock, all
>per-semaphore locks must be scanned for ongoing operations.
>
>The patch adds a hysteresis for switching from the big lock to the per
>semaphore locks. This reduces how often the per-semaphore locks must
>be scanned.

Isn't this very arbitrary depending on the workload? Ie the other way around:
when we have a lot more simple ops going on not so good. While I'm more worried
about combinations that could cause enough complex ops to always delay taking
the finer grained lock, this change also obviously makes simple ops more expensive
on newly created segments.

In general I don't trust magic numbers much. What sort of numbers have you seen
with this patch? Is this a real concern (particularly because a lot of the sem->lock
work was because real world workloads were doing a lot more simple ops afaicr)?

Thanks,
Davidlohr
