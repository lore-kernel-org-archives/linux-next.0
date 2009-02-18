From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] module: fix build for CONFIG_SYSFS=n
Date: Wed, 18 Feb 2009 19:09:32 +0100
Message-ID: <20090218180932.GC19995@elte.hu>
References: <20090218191640.0b023029.sfr@canb.auug.org.au> <499C4D35.9000104@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:47684 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751445AbZBRSJu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 Feb 2009 13:09:50 -0500
Content-Disposition: inline
In-Reply-To: <499C4D35.9000104@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>


* Randy Dunlap <randy.dunlap@oracle.com> wrote:

> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix this build error when CONFIG_SYSFS=n:
> 
> kernel/built-in.o: In function `free_module':
> module.c:(.text+0x4f8a2): undefined reference to `destroy_params'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> cc: Rusty Russell <rusty@rustcorp.com.au>
> ---
>  kernel/module.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> --- linux-next-20090218.orig/kernel/module.c
> +++ linux-next-20090218/kernel/module.c
> @@ -1464,8 +1464,10 @@ static void free_module(struct module *m
>  	/* Module unload stuff */
>  	module_unload_free(mod);
>  
> +#ifdef CONFIG_SYSFS
>  	/* Free any allocated parameters. */
>  	destroy_params(mod->kp, mod->num_kp);
> +#endif

Is destroy_params() dependent on SYSFS? If yes then it would be 
far cleaner if there was a NOP destroy_params() inline for the 
!SYSFS case.

	Ingo
