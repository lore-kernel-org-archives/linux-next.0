From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging/lustre: fix build errors
Date: Tue, 4 Jun 2013 06:59:55 -0700
Message-ID: <20130604135955.GA25224@kroah.com>
References: <1882637210201641A747464075FFC6490E57F19F@MX101CL02.corp.emc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:48192 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752604Ab3FDN71 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Jun 2013 09:59:27 -0400
Content-Disposition: inline
In-Reply-To: <1882637210201641A747464075FFC6490E57F19F@MX101CL02.corp.emc.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Peng, Tao" <tao.peng@emc.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Andreas Dilger <andreas.dilger@intel.com>

On Tue, Jun 04, 2013 at 08:45:41AM +0000, Peng, Tao wrote:
> >From 369398c782c914e5f0548d5bbad22c00c6b58b6a Mon Sep 17 00:00:00 2001
> From: Peng Tao <bergwolf@gmail.com>
> Date: Tue, 4 Jun 2013 15:48:17 +0800
> Subject: [PATCH] staging/lustre: fix build errors

Why send me the whole patch header?  If I want to apply this, I need to
hand edit it.

> There are several issues:
> 1. set_cpus_allowed() is not available with CONFIG_CPUMASK_OFFSTACK on
> 2. CONFIG_MODULES may not be defined
> 3. CONFIG_MODULE_UNLOAD may not be defined

You did three different things, please send 3 different patches, I can't
take this as is.

> diff --git a/drivers/staging/lustre/lustre/obdclass/lu_object.c b/drivers/staging/lustre/lustre/obdclass/lu_object.c
> index 1cbbb6f..da459e1 100644
> --- a/drivers/staging/lustre/lustre/obdclass/lu_object.c
> +++ b/drivers/staging/lustre/lustre/obdclass/lu_object.c
> @@ -1351,7 +1351,9 @@ static void key_fini(struct lu_context *ctx, int index)
>  
>  		LASSERT(key->lct_owner != NULL);
>  		if ((ctx->lc_tags & LCT_NOREF) == 0) {
> +#ifdef CONFIG_MODULE_UNLOAD
>  			LINVRNT(module_refcount(key->lct_owner) > 0);
> +#endif

What is that?  What is LINVRNT?

>  			module_put(key->lct_owner);

Are you sure this isn't racy?

>  		}
>  		ctx->lc_value[index] = NULL;
> @@ -1933,7 +1935,11 @@ void lu_context_keys_dump(void)
>  			       i, key, key->lct_tags,
>  			       key->lct_init, key->lct_fini, key->lct_exit,
>  			       key->lct_index, atomic_read(&key->lct_used),
> +#ifdef CONFIG_MODULES
>  			       key->lct_owner ? key->lct_owner->name : "",
> +#else
> +			       "",
> +#endif

That's a mess, why care about a module name at all?

thanks,

greg k-h
