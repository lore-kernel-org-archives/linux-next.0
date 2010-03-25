From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: [PATCH 3/3 -next] xen: fix build when SYSRQ is disabled
Date: Thu, 25 Mar 2010 11:40:00 -0700
Message-ID: <4BABAE00.8010606@goop.org>
References: <20100325173853.f06a7b33.sfr@canb.auug.org.au> <4BABAB8C.2070104@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from claw.goop.org ([74.207.240.146]:40012 "EHLO claw.goop.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753674Ab0CYSkD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 25 Mar 2010 14:40:03 -0400
In-Reply-To: <4BABAB8C.2070104@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@osdl.org>, Chris Wright <chrisw@sous-sol.org>

On 03/25/2010 11:29 AM, Randy Dunlap wrote:
> From: Randy Dunlap<randy.dunlap@oracle.com>
>
> Fix build error when CONFIG_MAGIC_SYSRQ is not enabled:
>
> drivers/xen/manage.c:223: error: implicit declaration of function 'handle_sysrq'
>    

Yep, looks fine.

Acked-by: Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>

     J
> Signed-off-by: Randy Dunlap<randy.dunlap@oracle.com>
> Cc: Jeremy Fitzhardinge<jeremy@xensource.com>
> Cc: Chris Wright<chrisw@sous-sol.org>
> ---
>   drivers/xen/manage.c |   14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
>
> --- linux-next-20100325.orig/drivers/xen/manage.c
> +++ linux-next-20100325/drivers/xen/manage.c
> @@ -194,6 +194,7 @@ static void shutdown_handler(struct xenb
>   	kfree(str);
>   }
>
> +#ifdef CONFIG_MAGIC_SYSRQ
>   static void sysrq_handler(struct xenbus_watch *watch, const char **vec,
>   			  unsigned int len)
>   {
> @@ -223,15 +224,16 @@ static void sysrq_handler(struct xenbus_
>   		handle_sysrq(sysrq_key, NULL);
>   }
>
> -static struct xenbus_watch shutdown_watch = {
> -	.node = "control/shutdown",
> -	.callback = shutdown_handler
> -};
> -
>   static struct xenbus_watch sysrq_watch = {
>   	.node = "control/sysrq",
>   	.callback = sysrq_handler
>   };
> +#endif
> +
> +static struct xenbus_watch shutdown_watch = {
> +	.node = "control/shutdown",
> +	.callback = shutdown_handler
> +};
>
>   static int setup_shutdown_watcher(void)
>   {
> @@ -243,11 +245,13 @@ static int setup_shutdown_watcher(void)
>   		return err;
>   	}
>
> +#ifdef CONFIG_MAGIC_SYSRQ
>   	err = register_xenbus_watch(&sysrq_watch);
>   	if (err) {
>   		printk(KERN_ERR "Failed to set sysrq watcher\n");
>   		return err;
>   	}
> +#endif
>
>   	return 0;
>   }
>    
