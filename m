From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH] bus: fix omap compile error if CONFIG_OF is true
Date: Tue, 04 Sep 2012 14:47:58 -0700
Message-ID: <5046770E.1010206@xenotime.net>
References: <20120904144123.25261.79625.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy6-pub.bluehost.com ([67.222.54.6]:54445 "HELO
	oproxy6-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1757760Ab2IDVsR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Sep 2012 17:48:17 -0400
In-Reply-To: <20120904144123.25261.79625.stgit@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: kishon@ti.com, linux-next@vger.kernel.org

On 09/04/2012 07:41 AM, Alan Cox wrote:

> From: Alan Cox <alan@linux.intel.com>
> 
> Signed-off-by: Alan Cox <alan@linux.intel.com>
> ---
> 
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
> 
> --


Kishon posted a patch for this on Aug. 23:
http://marc.info/?l=linux-next&m=134574365000518&w=2

Who needs to merge it?

-- 
~Randy
