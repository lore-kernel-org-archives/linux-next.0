From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: stackprotector tree build failure
Date: Wed, 22 Oct 2008 06:32:27 +0200
Message-ID: <20081022043227.GA31413@elte.hu>
References: <20081022131124.a572b11f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:35869 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750815AbYJVEcl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Oct 2008 00:32:41 -0400
Content-Disposition: inline
In-Reply-To: <20081022131124.a572b11f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> kernel/fork.c: In function 'copy_process':
> kernel/fork.c:1026: error: 'struct task_struct' has no member named 'default_timer_slack_ns'
> kernel/fork.c:1026: error: 'struct task_struct' has no member named 'timer_slack_ns'
> 
> Caused by commit 929c12f25feeec881fd67eaa9b551f98588a2931 ("manual merge
> of stackprotector") which introduced the above line.
> 
> I applied the following patch.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 22 Oct 2008 13:09:17 +1100
> Subject: [PATCH] stackprotector: fix up bad merge
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  kernel/fork.c |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 194dc04..3bc1f86 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -1023,8 +1023,6 @@ static struct task_struct *copy_process(unsigned long clone_flags,
>  	p->prev_utime = cputime_zero;
>  	p->prev_stime = cputime_zero;
>  
> -	p->default_timer_slack_ns = current->timer_slack_ns;
> -
>  #ifdef CONFIG_DETECT_SOFTLOCKUP
>  	p->last_switch_count = 0;
>  	p->last_switch_timestamp = 0;
> -- 
> 1.5.6.5

thanks Stephen!

This seems to have been caused by a git-rerere bug - it mis-matched a 
timers tree conflict resolution. I cleared out that resolution (it had 
nothing to do with stackprotector), re-did the conflict resolution 
(which was about overlapping additions of header files), and pushed out 
a new stackprotector tree - the delta below has the expected result.

	Ingo

diff --git a/kernel/fork.c b/kernel/fork.c
index 194dc04..3bc1f86 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1023,8 +1023,6 @@ static struct task_struct *copy_process(unsigned long clone_flags,
 	p->prev_utime = cputime_zero;
 	p->prev_stime = cputime_zero;
 
-	p->default_timer_slack_ns = current->timer_slack_ns;
-
 #ifdef CONFIG_DETECT_SOFTLOCKUP
 	p->last_switch_count = 0;
 	p->last_switch_timestamp = 0;
