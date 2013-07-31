From: David Herrmann <dh.herrmann@gmail.com>
Subject: Re: [PATCH] Fix #include in drm_mm.h to unbreak ia64 build
Date: Wed, 31 Jul 2013 17:45:14 +0200
Message-ID: <CANq1E4S0PiOfRvuDCHYcSaRXkgVdsQaeD0rri4CTxhVksVUE+w@mail.gmail.com>
References: <51f6b9b51365634ccf@agluck-desk.sc.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:39151 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755532Ab3GaPpQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 31 Jul 2013 11:45:16 -0400
Received: by mail-ob0-f175.google.com with SMTP id xn12so1636440obc.6
        for <linux-next@vger.kernel.org>; Wed, 31 Jul 2013 08:45:14 -0700 (PDT)
In-Reply-To: <51f6b9b51365634ccf@agluck-desk.sc.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: David Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>

Hi

On Mon, Jul 29, 2013 at 8:51 PM, Luck, Tony <tony.luck@intel.com> wrote:
> Linux-next build on ia64 is falling over with errors like this:
>
> In file included from include/drm/drm_vma_manager.h:26,
>                  from include/drm/ttm/ttm_bo_api.h:35,
>                  from include/drm/ttm/ttm_bo_driver.h:33,
>                  from drivers/gpu/drm/ttm/ttm_agp_backend.c:35:
> include/drm/drm_mm.h:67: error: expected specifier-qualifier-list before 'spinlock_t'
>
> I guess other architectures are pulling in spinlock.h
> through some twisty #include path so are not seeing this
> error.  But drm_mm.h makes use of spinlock_t - so it
> should do the right thing and #include <linux/spinlock.h>
>
> Signed-off-by: Tony Luck <tony.luck@intel.com>

Yepp, that broke due to the drm_vma_manager.h include in TTM. There is
already a fix pending on the ML:
  http://www.spinics.net/lists/dri-devel/msg42101.html

Thanks
David

> ---
>
> First saw this break in tag "next-20130726"
>
> diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
> index b87d05e..7d5fbae 100644
> --- a/include/drm/drm_mm.h
> +++ b/include/drm/drm_mm.h
> @@ -37,6 +37,7 @@
>   * Generic range manager structs
>   */
>  #include <linux/list.h>
> +#include <linux/spinlock.h>
>  #ifdef CONFIG_DEBUG_FS
>  #include <linux/seq_file.h>
>  #endif
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
