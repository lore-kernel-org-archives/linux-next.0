From: Mark McLoughlin <markmc@redhat.com>
Subject: Re: linux-next: driver-core tree build failure
Date: Mon, 22 Dec 2008 14:50:46 +0000
Message-ID: <1229957446.19474.19.camel@localhost.localdomain>
References: <20081222235936.5971ad15.sfr@canb.auug.org.au>
Reply-To: Mark McLoughlin <markmc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:33124 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754588AbYLVOuy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2008 09:50:54 -0500
In-Reply-To: <20081222235936.5971ad15.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org

On Mon, 2008-12-22 at 23:59 +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (powerpc allnoconfig) failed like this:
> 
> drivers/base/core.c: In function '__root_device_register':
> drivers/base/core.c:1277: error: dereferencing pointer to incomplete type
> 
> Caused by bf86dbd2451d1012c2c968a960470e485b869f5b ("driver core: add
> root_device_register()").  This needs to cope with !CONFIG_MODULES (where
> struct module is not defined).

Ouch, my bad.

> I applied the following patch but only for today because it is too hard
> to revert the above patch ...
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 22 Dec 2008 23:50:56 +1100
> Subject: [PATCH] driver core: fix root_device_register for not CONFIG_MODULES
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/base/core.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 6fbdd8b..aa93980 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -1273,6 +1273,7 @@ struct device *__root_device_register(const char *name, struct module *owner)
>  		return ERR_PTR(err);
>  	}
>  
> +#ifdef CONFIG_MODULE
>  	if (owner) {
>  		struct module_kobject *mk = &owner->mkobj;
>  
> @@ -1283,6 +1284,7 @@ struct device *__root_device_register(const char *name, struct module *owner)
>  		}
>  		root->owner = owner;
>  	}
> +#endif

Yep, looks correct to me ...

Thanks,
Mark.
