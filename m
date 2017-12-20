From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 char-misc-next tree
Date: Wed, 20 Dec 2017 09:55:57 +0100
Message-ID: <20171220085557.GA25945@kroah.com>
References: <20171220133249.37100a10@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:33157 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754235AbdLTIzz (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 Dec 2017 03:55:55 -0500
Content-Disposition: inline
In-Reply-To: <20171220133249.37100a10@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Sagar Dharia <sdharia@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, David Kershner <david.kershner@unisys.com>

On Wed, Dec 20, 2017 at 01:32:49PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got conflicts in:
> 
>   drivers/Kconfig
>   drivers/Makefile
> 
> between commits:
> 
>   bbecb07fa0af ("siox: new driver framework for eckelmann SIOX")
>   3648e78ec701 ("slimbus: Add SLIMbus bus type")
> 
> from the char-misc-next tree and commit:
> 
>   93d3ad90c2d4 ("drivers: visorbus: move driver out of staging")
> 
> from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/Kconfig
> index 02b6fd0864c8,ef5fb8395d76..000000000000
> --- a/drivers/Kconfig
> +++ b/drivers/Kconfig
> @@@ -213,8 -211,6 +213,10 @@@ source "drivers/mux/Kconfig
>   
>   source "drivers/opp/Kconfig"
>   
>  +source "drivers/siox/Kconfig"
>  +
>  +source "drivers/slimbus/Kconfig"
>  +
> + source "drivers/visorbus/Kconfig"
> + 
>   endmenu
> diff --cc drivers/Makefile
> index e09663776d8b,7a2330077e47..000000000000
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@@ -186,4 -184,4 +186,5 @@@ obj-$(CONFIG_FPGA)		+= fpga
>   obj-$(CONFIG_FSI)		+= fsi/
>   obj-$(CONFIG_TEE)		+= tee/
>   obj-$(CONFIG_MULTIPLEXER)	+= mux/
>  +obj-$(CONFIG_SIOX)		+= siox/
> + obj-$(CONFIG_UNISYS_VISORBUS)	+= visorbus/

Looks good!  Sorry for the conflict, I knew it was going to happen :(

greg k-h
