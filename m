From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH] Fix linux-next warning from abb74cef
Date: Mon, 31 Jan 2011 12:25:28 -0800
Message-ID: <20110131122528.050a4c23.randy.dunlap@oracle.com>
References: <20110131113820.193a89c5.rdunlap@xenotime.net>
	<1296505006-26660-1-git-send-email-venki@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:22997 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756222Ab1AaU1r (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 31 Jan 2011 15:27:47 -0500
In-Reply-To: <1296505006-26660-1-git-send-email-venki@google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Venkatesh Pallipadi <venki@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Jaswinder Singh <jaswinderlinux@gmail.com>, Randy Dunlap <rdunlap@xenotime.net>

On Mon, 31 Jan 2011 12:16:46 -0800 Venkatesh Pallipadi wrote:

> Thanks. Updated to address comments from Randy.
> 
> Yes. Patch below should fix the problem.
> 
> Fix below warning -
>  Introduced by commit abb74cefa9c682fb38ba86c17ca3c86fed6cc464 ("sched:
>  Export ns irqtimes through /proc/stat").

Thanks, Venki.

Maybe next time we can even get a descriptive $subject.  ;)
(I'm not requesting that you resend this patch.)


> After merging the tip tree, today's linux-next build (powerpc
> ppc64_defconfig) produced these warnings:
> 
> kernel/sched.c:3719: warning: 'irqtime_account_idle_ticks' defined but not used
> kernel/sched.c:3720: warning: 'irqtime_account_process_tick' defined but not used
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Venkatesh Pallipadi <venki@google.com>
> ---
>  kernel/sched.c |   64 ++++++++++++++++++++++++++++----------------------------
>  1 files changed, 32 insertions(+), 32 deletions(-)


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
