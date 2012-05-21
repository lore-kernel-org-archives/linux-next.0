From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: build failure after merge of the userns tree
Date: Mon, 21 May 2012 16:05:16 -0600
Message-ID: <87pq9x6vhf.fsf@xmission.com>
References: <20120521175009.7bd4948c026d8acc61f26753@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out02.mta.xmission.com ([166.70.13.232]:42274 "EHLO
	out02.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753290Ab2EUWFm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 May 2012 18:05:42 -0400
In-Reply-To: <20120521175009.7bd4948c026d8acc61f26753@canb.auug.org.au>
	(Stephen Rothwell's message of "Mon, 21 May 2012 17:50:09 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Eric,
>
> After merging the userns tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> kernel/sched/numa.c: In function 'ng_allowed':
> kernel/sched/numa.c:1270:16: error: 'struct user_struct' has no member named 'user_ns'
> kernel/sched/numa.c:1270:40: error: 'struct user_struct' has no member named 'user_ns'
> kernel/sched/numa.c:1278:28: error: 'struct user_struct' has no member named 'user_ns'
>
> Caused by commit a2dae61eb839 ("sched/numa: Introduce sys_numa_{t,m}bind
> ()") from the tip tree interacting with commit d0bd6594e286 ("userns:
> Deprecate and rename the user_namespace reference in the user_struct")
> from the userns tree.
>
> I applied this merge fix up patch (more may be required):

The fix is right.

Peter Zijlstra, or Ingo any chance you could add the patch below to your
tree?

It is just a better idiom to access the user namespace pointer as
cred->user_ns, instead of cred->user->user_ns and has been for a few
kernel releases.

Once my usernamespace tree is merged into Linus's tree a little more
will be needed to build this code with user namespaces enabled, but
cred->user->user to cred->user_ns is an improvement whichever way
you look at it.

Otherwise I guess this merge failure will act as a reminder that this
code needs a few more changes.

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 21 May 2012 17:40:55 +1000
> Subject: [PATCH] userns: fix up for user_ns move to struct cred
>
Reviewed-by: "Eric W. Biederman" <ebiederm@xmission.com>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  kernel/sched/numa.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/sched/numa.c b/kernel/sched/numa.c
> index 8eb92f7..1149993 100644
> --- a/kernel/sched/numa.c
> +++ b/kernel/sched/numa.c
> @@ -1267,7 +1267,7 @@ static int ng_allowed(struct numa_group *ng, struct task_struct *p)
>  
>  	rcu_read_lock();
>  	tcred = __task_cred(p);
> -	if (cred->user->user_ns == tcred->user->user_ns &&
> +	if (cred->user_ns == tcred->user_ns &&
>  	    (cred->uid == tcred->euid &&
>  	     cred->uid == tcred->suid &&
>  	     cred->uid == tcred->uid  &&
> @@ -1275,7 +1275,7 @@ static int ng_allowed(struct numa_group *ng, struct task_struct *p)
>  	     cred->gid == tcred->sgid &&
>  	     cred->gid == tcred->gid))
>  		goto ok;
> -	if (ns_capable(tcred->user->user_ns, CAP_SYS_PTRACE))
> +	if (ns_capable(tcred->user_ns, CAP_SYS_PTRACE))
>  		goto ok;
>  	rcu_read_unlock();
>  	return -EPERM;
> -- 
> 1.7.10.280.gaa39
