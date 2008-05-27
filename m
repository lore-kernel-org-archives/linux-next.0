From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: ftrace build failure
Date: Tue, 27 May 2008 09:43:10 +0200
Message-ID: <20080527074310.GA21997@elte.hu>
References: <20080527125637.439933a4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:51236 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753645AbYE0Hn3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 27 May 2008 03:43:29 -0400
Content-Disposition: inline
In-Reply-To: <20080527125637.439933a4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Pekka Paalanen <pq@iki.fi>, Thomas Gleixner <tglx@linutronix.de>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> --- a/arch/x86/mm/kmmio.c
> +++ b/arch/x86/mm/kmmio.c
> @@ -23,6 +23,7 @@
>  #include <linux/errno.h>
>  #include <asm/debugreg.h>
>  #include <linux/mmiotrace.h>
> +#include <linux/rculist.h>

this is not an 'ftrace build bug', this is an integration artifact of 
-next. It is fixed in -tip too (which too integrates these topics) in a 
different branch.

it's in a different branch because this is a change only makes sense if 
the 'tip/core/rcu' and 'tip/auto-ftrace-next' topics are combined - 
hence it lives in the "tip/auto-test-fixes" (commit 48bd24be18) - and 
this change was always there as the combined result wouldnt even build 
without this fix.

So this is a true "merge only commit" that cannot live standalone in any 
of the topic branches it is related to.

	Ingo
