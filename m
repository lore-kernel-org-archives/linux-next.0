From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: Re: linux-next: manual merge of the livepatching tree with the security tree
Date: Tue, 28 Mar 2017 20:23:04 +0900
Message-ID: <201703282023.GHC34353.StLFOVOHQMJFOF@I-love.SAKURA.ne.jp>
References: <20170328151341.7ab5a45b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www262.sakura.ne.jp ([202.181.97.72]:42639 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755372AbdC1LXX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Mar 2017 07:23:23 -0400
In-Reply-To: <20170328151341.7ab5a45b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au, jikos@kernel.org, jmorris@namei.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, jpoimboe@redhat.com

Stephen Rothwell wrote:
> Hi Jiri,
> 
> Today's linux-next merge of the livepatching tree got conflicts in:
> 
>   include/linux/init_task.h
>   include/linux/sched.h
> 
> between commit:
> 
>   e4e55b47ed9a ("LSM: Revive security_task_alloc() hook and per "struct task_struct" security blob.")
> 
> from the security tree and commit:
> 
>   d83a7cb375ee ("livepatch: change to a per-task consistency model")
> 
> from the livepatching tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thank you for fixing.
This is an append to "struct task_struct" race which is inevitable.

> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc include/linux/init_task.h
> index 926f2f553cc5,5a791055b176..000000000000
> --- a/include/linux/init_task.h
> +++ b/include/linux/init_task.h
> @@@ -294,7 -296,7 +302,8 @@@ extern struct cred init_cred
>   	INIT_VTIME(tsk)							\
>   	INIT_NUMA_BALANCING(tsk)					\
>   	INIT_KASAN(tsk)							\
>  +	INIT_TASK_SECURITY						\
> + 	INIT_LIVEPATCH(tsk)						\
>   }
>   
>   
> diff --cc include/linux/sched.h
> index 9ac23308c82c,e11032010318..000000000000
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@@ -1042,10 -1038,9 +1042,13 @@@ struct task_struct 
>   	/* A live task holds one reference: */
>   	atomic_t			stack_refcount;
>   #endif
>  +#ifdef CONFIG_SECURITY
>  +	/* Used by LSM modules for access restriction: */
>  +	void				*security;
>  +#endif
> + #ifdef CONFIG_LIVEPATCH

Just a comment to livepatch change. It seems that addition of

	/* A comment line for this variable: */

line and indentation alignment is expected due to
"Unscheduled maintenance for sched.h" work.

> + 	int patch_state;
> + #endif
>   	/* CPU-specific state of this task: */
>   	struct thread_struct		thread;
>   
> 
