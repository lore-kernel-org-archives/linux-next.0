From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH] drivers: bus: omap-ocp2scp: Fix compile error
Date: Thu, 23 Aug 2012 10:53:40 -0700
Message-ID: <50366E24.9040500@xenotime.net>
References: <1345743626-28364-1-git-send-email-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy9.bluehost.com ([69.89.24.6]:55756 "HELO
	oproxy9.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1759117Ab2HWRxq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Aug 2012 13:53:46 -0400
In-Reply-To: <1345743626-28364-1-git-send-email-kishon@ti.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/23/2012 10:40 AM, Kishon Vijay Abraham I wrote:

> Fixes
> CC [M]  drivers/bus/omap-ocp2scp.o
> drivers/bus/omap-ocp2scp.c:70:1: error: '__mod_of_device_table' aliased to
> undefined symbol 'omap_usb2_id_table'
> 
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>


Acked-by: Randy Dunlap <rdunlap@xenotime.net>

Thanks.

> ---
>  drivers/bus/omap-ocp2scp.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/omap-ocp2scp.c b/drivers/bus/omap-ocp2scp.c
> index 9075ef8..ff63560 100644
> --- a/drivers/bus/omap-ocp2scp.c
> +++ b/drivers/bus/omap-ocp2scp.c
> @@ -67,7 +67,7 @@ static const struct of_device_id omap_ocp2scp_id_table[] = {
>  	{ .compatible = "ti,omap-ocp2scp" },
>  	{}
>  };
> -MODULE_DEVICE_TABLE(of, omap_usb2_id_table);
> +MODULE_DEVICE_TABLE(of, omap_ocp2scp_id_table);
>  #endif
>  
>  static struct platform_driver omap_ocp2scp_driver = {



-- 
~Randy
