From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/2] ipc/sem.c: Fix complex_count vs. simple op race
Date: Mon, 20 Jun 2016 16:04:56 -0700
Message-ID: <20160620160456.a07982236e08d6d6be4cd442@linux-foundation.org>
References: <20160615152318.164b1ebd@canb.auug.org.au>
	<1466280142-19741-1-git-send-email-manfred@colorfullife.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:45437 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753559AbcFTXE6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Jun 2016 19:04:58 -0400
In-Reply-To: <1466280142-19741-1-git-send-email-manfred@colorfullife.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Manfred Spraul <manfred@colorfullife.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, 1vier1@web.de, Davidlohr Bueso <dave@stgolabs.net>, felixh@informatik.uni-bremen.de, stable@vger.kernel.org

On Sat, 18 Jun 2016 22:02:21 +0200 Manfred Spraul <manfred@colorfullife.com> wrote:

> Commit 6d07b68ce16a ("ipc/sem.c: optimize sem_lock()") introduced a race:
> 
> sem_lock has a fast path that allows parallel simple operations.
> There are two reasons why a simple operation cannot run in parallel:
> - a non-simple operations is ongoing (sma->sem_perm.lock held)
> - a complex operation is sleeping (sma->complex_count != 0)
> 
> As both facts are stored independently, a thread can bypass the current
> checks by sleeping in the right positions. See below for more details
> (or kernel bugzilla 105651).
> 
> The patch fixes that by creating one variable (complex_mode)
> that tracks both reasons why parallel operations are not possible.
> 
> The patch also updates stale documentation regarding the locking.
> 
> With regards to stable kernels:
> The patch is required for all kernels that include the commit 6d07b68ce16a
> ("ipc/sem.c: optimize sem_lock()") (3.10?)

I've had this in -mm (and -next) since January 4, without issues.  I
put it on hold because Davidlohr expressed concern about performance
regressions.

Your [2/2] should prevent those regressions (yes?) so I assume that any
kernel which has [1/2] really should have [2/2] as well.  But without
any quantitative information, this is all mad guesswork.

What to do?

(The [2/2] changelog should explain that it is the cure to [1/2]'s
regressions, btw).
