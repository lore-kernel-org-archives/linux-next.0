From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Tue, 18 Aug 2015 09:12:57 -0700
Message-ID: <20150818161257.GB4040@kroah.com>
References: <20150818160116.1c77685d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:49256 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751177AbbHRQNB (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 18 Aug 2015 12:13:01 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id A6D90202D2
	for <linux-next@vger.kernel.org>; Tue, 18 Aug 2015 12:13:00 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20150818160116.1c77685d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>

On Tue, Aug 18, 2015 at 04:01:16PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the tty tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> make[2]: *** No rule to make target 'arch/arm/boot/dts/imx6sl-fox-p1.dtb', needed by '__build'.  Stop.
> 
> Caused by commit
> 
>   189550b8644e ("serial: imx: introduce serial_imx_enable_wakeup()")
> 
> I guess a file was missed.
> 
> I partially reverted that commit:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 18 Aug 2015 15:56:40 +1000
> Subject: [PATCH] serial: imx: partial revert of "introduce
>  serial_imx_enable_wakeup()"
> 
> This reverts the part of commit 189550b8644e that affects
> arch/arm/boot/dts/Makefile
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/arm/boot/dts/Makefile | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index d3ee1f01ffc7..233159d2eaab 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -330,7 +330,6 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
>  	imx6q-wandboard-revb1.dtb
>  dtb-$(CONFIG_SOC_IMX6SL) += \
>  	imx6sl-evk.dtb \
> -	imx6sl-fox-p1.dtb \
>  	imx6sl-warp.dtb
>  dtb-$(CONFIG_SOC_IMX6SX) += \
>  	imx6sx-sabreauto.dtb \


Ugh, this sucks, Eduardo, what went wrong here?  I think I have to
revert the original commit now :(

thanks,

greg k-h
