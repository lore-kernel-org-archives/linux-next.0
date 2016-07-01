From: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH 1/2] ipc/sem.c: Fix complex_count vs. simple op race
Date: Fri, 1 Jul 2016 09:52:58 -0700
Message-ID: <20160701165258.GA27566@linux-80c1.suse>
References: <20160615152318.164b1ebd@canb.auug.org.au>
 <1466280142-19741-1-git-send-email-manfred@colorfullife.com>
 <20160621003015.GA15593@linux-80c1.suse>
 <b5b4e032-8b1c-f102-ac23-3b331c2ed615@colorfullife.com>
 <20160628052717.GA13793@linux-80c1.suse>
 <ac93292c-c995-9c05-9e97-06c19ea7a2bf@colorfullife.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60673 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750702AbcGAQxW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 1 Jul 2016 12:53:22 -0400
Content-Disposition: inline
In-Reply-To: <ac93292c-c995-9c05-9e97-06c19ea7a2bf@colorfullife.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Manfred Spraul <manfred@colorfullife.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, 1vier1@web.de, felixh@informatik.uni-bremen.de, stable@vger.kernel.org

On Thu, 30 Jun 2016, Manfred Spraul wrote:

>On 06/28/2016 07:27 AM, Davidlohr Bueso wrote:

>If I understand it right, it means that spin_lock() is both an acquire 
>and a release - for qspinlocks.

I wouldn't say that: the _Q_LOCKED_VAL stores are still unordered inside
the acquire region but no further than the the unlock store-release; which
is fine for regular mutual exclusion.

>It this valid for all spinlock implementations, for all architectures?
>Otherwise: How can I detect in generic code if I can rely on a release 
>inside spin_lock()?

With ticket locks this was never an issue as special lock readers
(spin_unlock_wait(), spin_is_locked()) will always see the lock taken as
they observe waiters by adding itself to the tail -- something the above
commit mimics and piggy backs on to save expensive smp_rmb().

In addition, see 726328d92a4 (locking/spinlock, arch: Update and fix
spin_unlock_wait() implementations).

Thanks,
Davidlohr
