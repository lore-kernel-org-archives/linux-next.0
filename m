From: Luciano Coelho <coelho@ti.com>
Subject: Re: [PATCH -next] wireless: TI wlxxx depends on MAC80211
Date: Tue, 17 Apr 2012 08:30:20 +0300
Message-ID: <1334640620.27247.7.camel@cumari>
References: <20120416161121.261ba4e7e38989173accfb16@canb.auug.org.au>
	 <4F8C784B.2040402@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from na3sys009aog130.obsmtp.com ([74.125.149.143]:35780 "EHLO
	na3sys009aog130.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751153Ab2DQFa0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Apr 2012 01:30:26 -0400
Received: by lbom4 with SMTP id m4so1375666lbo.33
        for <linux-next@vger.kernel.org>; Mon, 16 Apr 2012 22:30:23 -0700 (PDT)
In-Reply-To: <4F8C784B.2040402@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-wireless@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>

Hi Randy,

On Mon, 2012-04-16 at 12:51 -0700, Randy Dunlap wrote: 
> From: Randy Dunlap <rdunlap@xenotime.net>
> 
> wl12xx build fails with many undefined symbol errors when MAC80211
> and CFG80211 are not enabled, so make WLCORE and WL12XX depend
> on MAC80211 (which already depends on CFG80211).
> 
> Here are a few of the many build errors:
> 

[...]

> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
> Cc:	Luciano Coelho <coelho@ti.com>
> Cc:	linux-wireless@vger.kernel.org
> Cc:	"John W. Linville" <linville@tuxdriver.com>
> ---

Thanks for the patch!


> --- linux-next-20120416.orig/drivers/net/wireless/ti/wl12xx/Kconfig
> +++ linux-next-20120416/drivers/net/wireless/ti/wl12xx/Kconfig
> @@ -1,5 +1,6 @@
>  config WL12XX
>         tristate "TI wl12xx support"
> +	depends on MAC80211
>         select WLCORE

Do we really need this one? wl12xx selects WLCORE which in turn depends
on MAC80211 (with your change below).  Maybe we don't need this?


> ---help---
>  	  This module adds support for wireless adapters based on TI wl1271,
> --- linux-next-20120416.orig/drivers/net/wireless/ti/wlcore/Kconfig
> +++ linux-next-20120416/drivers/net/wireless/ti/wlcore/Kconfig
> @@ -1,6 +1,6 @@
>  config WLCORE
>  	tristate "TI wlcore support"
> -	depends on WL_TI && GENERIC_HARDIRQS
> +	depends on WL_TI && GENERIC_HARDIRQS && MAC80211
>  	depends on INET
>  	select FW_LOADER
>  	---help---

-- 
Cheers,
Luca.
