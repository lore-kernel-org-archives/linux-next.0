From: Dong Aisheng <aisheng.dong@freescale.com>
Subject: Re: [PATCH] pinctrl: fix build when CONFIG_OF && !CONFIG_PINCTRL
Date: Thu, 5 Apr 2012 14:41:09 +0800
Message-ID: <20120405064108.GA30892@shlinux2.ap.freescale.net>
References: <1333511636-9987-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]:23049 "EHLO
	tx2outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755189Ab2DEGaN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Apr 2012 02:30:13 -0400
Content-Disposition: inline
In-Reply-To: <1333511636-9987-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linus.walleij@linaro.org, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Stephen Warren <swarren@nvidia.com>

On Tue, Apr 03, 2012 at 09:53:56PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> pinctrl/devicetree.c won't compile when !CONFIG_PINCTRL, since the
> pinctrl headers don't declare some types when !PINCTRL. Make sure
> pinctrl/Makefile only attempts to compile devicetree.c when OF &&
> PINCTRL.
> 
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
Acked-by: Dong Aisheng <dong.aisheng@linaro.org>

Regards
Dong Aisheng

>  drivers/pinctrl/Makefile |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index 049c9fb..8e3c95a 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -5,7 +5,9 @@ ccflags-$(CONFIG_DEBUG_PINCTRL)	+= -DDEBUG
>  obj-$(CONFIG_PINCTRL)		+= core.o
>  obj-$(CONFIG_PINMUX)		+= pinmux.o
>  obj-$(CONFIG_PINCONF)		+= pinconf.o
> -obj-$(CONFIG_OF)		+= devicetree.o
> +ifeq ($(CONFIG_OF),y)
> +obj-$(CONFIG_PINCTRL)		+= devicetree.o
> +endif
>  obj-$(CONFIG_GENERIC_PINCONF)	+= pinconf-generic.o
>  obj-$(CONFIG_PINCTRL_PXA3xx)	+= pinctrl-pxa3xx.o
>  obj-$(CONFIG_PINCTRL_MMP2)	+= pinctrl-mmp2.o
> -- 
> 1.7.5.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
