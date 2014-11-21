From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the driver-core tree with the arm-soc tree
Date: Fri, 21 Nov 2014 12:05:56 +0100
Message-ID: <5291580.tnIkyRiF2h@wuerfel>
References: <20141121164131.0190e0ab@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:55777 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755328AbaKULGI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 21 Nov 2014 06:06:08 -0500
In-Reply-To: <20141121164131.0190e0ab@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Keerthy <j-keerthy@ti.com>, Tony Lindgren <tony@atomide.com>

On Friday 21 November 2014 16:41:31 Stephen Rothwell wrote:
> --- a/drivers/bus/omap_l3_noc.c
> +++ b/drivers/bus/omap_l3_noc.c
> @@@ -358,8 -300,6 +358,7 @@@ static struct platform_driver omap_l3_d
>         .probe          = omap_l3_probe,
>         .driver         = {
>                 .name           = "omap_l3_noc",
> -               .owner          = THIS_MODULE,
>  +              .pm             = L3_DEV_PM_OPS,
>                 .of_match_table = of_match_ptr(l3_noc_match),
>         },
>   };
> 

Thanks, looks good.

	Arnd
