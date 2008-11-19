From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the sched tree
Date: Wed, 19 Nov 2008 09:45:53 +0100
Message-ID: <20081119084553.GE1078@elte.hu>
References: <20081119122746.29db6c3a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:55477 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751360AbYKSIqR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Nov 2008 03:46:17 -0500
Content-Disposition: inline
In-Reply-To: <20081119122746.29db6c3a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Kumar Gala <galak@kernel.crashing.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the sched tree got a conflict in 
> kernel/Makefile between commit 
> 65ecc14a30ad21bed9aabdfd6a2ae1a1aaaa6a00 ("Remove -mno-spe flags as 
> they dont belong") from Linus' tree and commit 
> 8bb8c4386d08f2cc5d871d22f220d35032213f84 ("sched, ftrace: trace 
> sched.c") from the sched tree.
> 
> I fixed it up (see below) and can carry it for a short while.

i did a similar conflict resolution yesterday. I have pushed out a new 
tip/auto-sched-next branch - you should not see this conflict in the 
future.

Thanks,

	Ingo
