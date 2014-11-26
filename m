From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the tty.current
 tree
Date: Wed, 26 Nov 2014 11:51:01 -0800
Message-ID: <20141126195101.GB5279@kroah.com>
References: <20141126181226.55eb1afe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:50304 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750770AbaKZTvD (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2014 14:51:03 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 576DD20AA7
	for <linux-next@vger.kernel.org>; Wed, 26 Nov 2014 14:51:02 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20141126181226.55eb1afe@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jingchang Lu <jingchang.lu@freescale.com>

On Wed, Nov 26, 2014 at 06:12:26PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in
> drivers/tty/serial/of_serial.c between commit a5e9ab291c60 ("Revert
> "serial: of-serial: add PM suspend/resume support"") from the
> tty.current tree and commit 513e43858102 ("serial: of-serial: fix up PM
> ops on no_console_suspend and port type") from the tty tree.
> 
> I fixed it up (I assumed the tty tree version is correct and used that)
> and can carry the fix as necessary (no action is required).
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc drivers/tty/serial/of_serial.c
> index f2fde9c21e9b,fd00e2521584..000000000000
> --- a/drivers/tty/serial/of_serial.c
> +++ b/drivers/tty/serial/of_serial.c
> @@@ -269,7 -342,9 +342,8 @@@ static struct of_device_id of_platform_
>   static struct platform_driver of_platform_serial_driver = {
>   	.driver = {
>   		.name = "of_serial",
>  -		.owner = THIS_MODULE,
>   		.of_match_table = of_platform_serial_table,
> + 		.pm = &of_serial_pm_ops,
>   	},
>   	.probe = of_platform_serial_probe,
>   	.remove = of_platform_serial_remove,


Looks good, thanks.

greg k-h
