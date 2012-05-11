From: "Arend van Spriel" <arend@broadcom.com>
Subject: Re: [PATCH -next] wireless: TI wlxxx depends on MAC80211
Date: Fri, 11 May 2012 13:59:14 +0200
Message-ID: <4FACFF12.60504@broadcom.com>
References: <20120416161121.261ba4e7e38989173accfb16@canb.auug.org.au>
 <4F8C784B.2040402@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mms2.broadcom.com ([216.31.210.18]:4498 "EHLO mms2.broadcom.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752689Ab2EKL71 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 11 May 2012 07:59:27 -0400
In-Reply-To: <4F8C784B.2040402@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Luciano Coelho <coelho@ti.com>, linux-wireless@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>, Arik Nemtsov <arik@wizery.com>

On 04/16/2012 09:51 PM, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@xenotime.net>
> 
> wl12xx build fails with many undefined symbol errors when MAC80211
> and CFG80211 are not enabled, so make WLCORE and WL12XX depend
> on MAC80211 (which already depends on CFG80211).
> 
> ---
>  drivers/net/wireless/ti/wl12xx/Kconfig |    1 +
>  drivers/net/wireless/ti/wlcore/Kconfig |    2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> --- linux-next-20120416.orig/drivers/net/wireless/ti/wl12xx/Kconfig
> +++ linux-next-20120416/drivers/net/wireless/ti/wl12xx/Kconfig
> @@ -1,5 +1,6 @@
>  config WL12XX
>         tristate "TI wl12xx support"
> +	depends on MAC80211
>         select WLCORE

Similar patch is probably needed for new wl18xx driver.

>         ---help---
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

Gr. AvS
