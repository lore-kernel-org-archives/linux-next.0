From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: [PATCH -next] modules: Fix up build when CONFIG_MODULE_UNLOAD=n.
Date: Tue, 14 Apr 2009 15:26:47 +0900
Message-ID: <20090414062647.GA28905@linux-sh.org>
References: <20090409154944.GC7789@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]:46680 "EHLO
	master.linux-sh.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751401AbZDNGbn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Apr 2009 02:31:43 -0400
Content-Disposition: inline
In-Reply-To: <20090409154944.GC7789@linux-sh.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

This is still broken in today's -next..

On Fri, Apr 10, 2009 at 12:49:44AM +0900, Paul Mundt wrote:
> Commit 3d43321b7015387cfebbe26436d0e9d299162ea1 ("modules: sysctl to
> block module loading") introduces a modules_disabled variable that is
> only defined if CONFIG_MODULE_UNLOAD is enabled, despite being used in
> other places. This moves it up and fixes up the build.
> 
>   CC      kernel/module.o
> kernel/module.c: In function 'sys_init_module':
> kernel/module.c:2401: error: 'modules_disabled' undeclared (first use in this function)
> kernel/module.c:2401: error: (Each undeclared identifier is reported only once
> kernel/module.c:2401: error: for each function it appears in.)
> make[1]: *** [kernel/module.o] Error 1
> make: *** [kernel/module.o] Error 2
> 
> Signed-off-by: Paul Mundt <lethal@linux-sh.org>
> 
> ---
> 
>  kernel/module.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/module.c b/kernel/module.c
> index 274ab43..5fb0ece 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -73,6 +73,9 @@ DEFINE_MUTEX(module_mutex);
>  EXPORT_SYMBOL_GPL(module_mutex);
>  static LIST_HEAD(modules);
>  
> +/* Block module loading/unloading? */
> +int modules_disabled = 0;
> +
>  /* Waiting for a module to finish initializing? */
>  static DECLARE_WAIT_QUEUE_HEAD(module_wq);
>  
> @@ -782,9 +785,6 @@ static void wait_for_zero_refcount(struct module *mod)
>  	mutex_lock(&module_mutex);
>  }
>  
> -/* Block module loading/unloading? */
> -int modules_disabled = 0;
> -
>  SYSCALL_DEFINE2(delete_module, const char __user *, name_user,
>  		unsigned int, flags)
>  {
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
