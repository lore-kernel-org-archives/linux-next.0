From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: creds tree build failure
Date: Fri, 08 Aug 2008 08:34:39 +0100
Message-ID: <3708.1218180879@redhat.com>
References: <20080808163633.d9e10b46.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([66.187.233.31]:46997 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752073AbYHHHeo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Aug 2008 03:34:44 -0400
In-Reply-To: <20080808163633.d9e10b46.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> +++ b/arch/powerpc/platforms/cell/spufs/inode.c
> ...
> +#include <linux/cred.h>

Yep.

> -	filp = dentry_open(dentry, mnt, O_RDONLY);
> +	filp = dentry_open(dentry, mnt, O_RDONLY, current_cred());

Yep.

> -	filp = dentry_open(dentry, mnt, O_RDONLY);
> +	filp = dentry_open(dentry, mnt, O_RDONLY, current_cred());

Yep.

> +#ifdef CONFIG_KEYS
>  /*
>   * Release a set of thread group credentials.
>   */
>  void put_tgcred(struct thread_group_cred *tgcred)
>  {
> -#ifdef CONFIG_KEYS
>  	if (atomic_dec_and_test(&tgcred->usage))
>  		call_rcu(&tgcred->rcu, put_tgcred_rcu);
> -#endif
>  }
> +#else
> +#define put_tgcred(t)
> +#endif

That'll do.

>  int copy_creds(struct task_struct *p, unsigned long clone_flags)
>  {
> +#ifdef CONFIG_KEYS
>  	struct thread_group_cred *tgcred;
> +#endif
>  	struct cred *new;
>  
>  	mutex_init(&p->cred_exec_mutex);
>  
> +#ifdef CONFIG_KEYS
>  	if (!p->cred->thread_keyring && clone_flags & CLONE_THREAD) {
> +#else
> +	if (clone_flags & CLONE_THREAD) {
> +#endif
>  		p->real_cred = get_cred(p->cred);
>  		get_cred(p->cred);
>  		return 0;

That should be okay.

Seems I forgot to compile with CONFIG_KEYS=n.

David
