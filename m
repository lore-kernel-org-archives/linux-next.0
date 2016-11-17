From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: linux-next: manual merge of the rpmsg tree with the slave-dma
 tree
Date: Wed, 16 Nov 2016 22:40:59 -0800
Message-ID: <20161117064059.GF28340@tuxbot>
References: <20161114162026.0511e0db@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f179.google.com ([209.85.192.179]:33334 "EHLO
        mail-pf0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938318AbcKQGlE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Nov 2016 01:41:04 -0500
Received: by mail-pf0-f179.google.com with SMTP id d2so47713636pfd.0
        for <linux-next@vger.kernel.org>; Wed, 16 Nov 2016 22:41:03 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20161114162026.0511e0db@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vinod Koul <vinod.koul@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>

On Sun 13 Nov 21:20 PST 2016, Stephen Rothwell wrote:

> Hi Bjorn,
> 

Hi Stephen,

> Today's linux-next merge of the rpmsg tree got a conflict in:
> 
>   drivers/remoteproc/Kconfig
> 
> between commit:
> 
>   bb6869b21478 ("remoteproc: st_slim_rproc: add a slimcore rproc driver")
> 
> from the slave-dma tree and commit:
> 
>   99d93470dcb4 ("remoteproc: qcom_wcnss: Fix circular module dependency")
> 
> from the rpmsg tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Thanks for the fix and the report of the dependency issue of
QCOM_ADSP_PIL.

I have merged the problematic topic branch from Vinod into my tree and
fixed up the discrepancies. So you should be able to drop this
workaround and you should not see the ADSP issue.

Regards,
Bjorn

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/remoteproc/Kconfig
> index 14d5d2d43a38,5fcbefcb8636..000000000000
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@@ -100,10 -95,9 +96,9 @@@ config QCOM_WCNSS_PI
>   	tristate "Qualcomm WCNSS Peripheral Image Loader"
>   	depends on OF && ARCH_QCOM
>   	depends on QCOM_SMEM
>  +	depends on REMOTEPROC
>   	select QCOM_MDT_LOADER
>   	select QCOM_SCM
> - 	select QCOM_WCNSS_IRIS
>  -	select REMOTEPROC
>   	help
>   	  Say y here to support the Peripheral Image Loader for the Qualcomm
>   	  Wireless Connectivity Subsystem.
