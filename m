From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: Fw: [PATCH] drm: build error when magic sysrq isn't enabled
Date: Wed, 31 Mar 2010 09:53:22 -0700
Message-ID: <20100331095322.48b94afd.randy.dunlap@oracle.com>
References: <20100331172157.12be4cce.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:33455 "EHLO
	rcsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757546Ab0CaQyv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 31 Mar 2010 12:54:51 -0400
In-Reply-To: <20100331172157.12be4cce.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, Changli Gao <xiaosuo@gmail.com>, linux-next@vger.kernel.org

On Wed, 31 Mar 2010 17:21:57 +1100 Stephen Rothwell wrote:

> Hi Dave,
> 
> One for you?

Did this patch not work or was it not applied/tested?
http://lkml.org/lkml/2010/3/25/315

Also 2 other SYSRQ patches that day:

http://lkml.org/lkml/2010/3/25/314
http://lkml.org/lkml/2010/3/25/316


> Begin forwarded message:
> 
> Date: Wed, 31 Mar 2010 12:18:00 +0800
> From: Changli Gao <xiaosuo@gmail.com>
> To: linux-next@vger.kernel.org
> Cc: xiaosuo <xiaosuo@gmail.com>
> Subject: [PATCH] drm: build error when magic sysrq isn't enabled
> 
> 
> drm build error when magic sysrq isn't enabled
> 
> sysrq_drm_fb_helper_restore_op is only valid when magic sysrq is
> enabled, but it is used whenever magic sysrq is enabled or not.
> 
> Signed-off-by: Changli Gao <xiaosuo@gmail.com>
> ----
> drivers/gpu/drm/drm_fb_helper.c | 4 ++++
> 1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 85cdf05..0e5b4f6 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -913,7 +913,9 @@ int drm_fb_helper_single_fb_probe(struct drm_device *dev,
>  		printk(KERN_INFO "registered panic notifier\n");
>  		atomic_notifier_chain_register(&panic_notifier_list,
>  					       &paniced);
> +#ifdef CONFIG_MAGIC_SYSRQ
>  		register_sysrq_key('v', &sysrq_drm_fb_helper_restore_op);
> +#endif
>  	}
>  	list_add(&fb_helper->kernel_fb_list, &kernel_fb_helper_list);
>  	return 0;
> @@ -927,7 +929,9 @@ void drm_fb_helper_free(struct drm_fb_helper *helper)
>  		printk(KERN_INFO "unregistered panic notifier\n");
>  		atomic_notifier_chain_unregister(&panic_notifier_list,
>  						 &paniced);
> +#ifdef CONFIG_MAGIC_SYSRQ
>  		unregister_sysrq_key('v', &sysrq_drm_fb_helper_restore_op);
> +#endif
>  	}
>  	drm_fb_helper_crtc_free(helper);
>  	fb_dealloc_cmap(&helper->fb->fbdev->cmap);
> 
> 
> -- 


---
~Randy
