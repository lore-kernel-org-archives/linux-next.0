From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH] USB: g_multi: Fixed '"CONFIG_USB_ETH_RNDIS" redefined'
 warning
Date: Sat, 28 Nov 2009 10:34:29 -0800
Message-ID: <20091128103429.705670b2.randy.dunlap@oracle.com>
References: <20091125223508.c0924e2d.sfr@canb.auug.org.au>
	<1259150386-7291-1-git-send-email-m.nazarewicz@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:20475 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752120AbZK1SgX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 28 Nov 2009 13:36:23 -0500
In-Reply-To: <1259150386-7291-1-git-send-email-m.nazarewicz@samsung.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Nazarewicz <m.nazarewicz@samsung.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 25 Nov 2009 12:59:46 +0100 Michal Nazarewicz wrote:

> From: Michal Nazarewicz <m.nazarewicz@samsung.com>
> 
> CONFIG_USB_ETH_RNDIS may be defined when g_ether is built causing
> warning when multi.c tries to redefine its value.  Changed to first
> undefine CONFIG_USB_ETH_RNDIS in multi.c.

Is there no kconfig way to solve this?
You shouldn't be messing with kconfig symbols in source files...


> Signed-off-by: Michal Nazarewicz <m.nazarewicz@samsung.com>
> ---
>  drivers/usb/gadget/multi.c |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/usb/gadget/multi.c b/drivers/usb/gadget/multi.c
> index 64711fe..227dc81 100644
> --- a/drivers/usb/gadget/multi.c
> +++ b/drivers/usb/gadget/multi.c
> @@ -26,6 +26,9 @@
>  #include <linux/utsname.h>
>  
>  
> +#if defined CONFIG_USB_ETH_RNDIS
> +#  undef CONFIG_USB_ETH_RNDIS
> +#endif
>  #if defined CONFIG_USB_G_MULTI_RNDIS
>  #  define CONFIG_USB_ETH_RNDIS y
>  #endif
> -- 


---
~Randy
