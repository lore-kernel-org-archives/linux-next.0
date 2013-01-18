From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with Linus' tree
Date: Thu, 17 Jan 2013 16:41:12 -0800
Message-ID: <20130118004112.GA29380@kroah.com>
References: <20130117130423.63a5e1004942853bf6a49e56@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:47856 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753653Ab3ARAlO (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Jan 2013 19:41:14 -0500
Content-Disposition: inline
In-Reply-To: <20130117130423.63a5e1004942853bf6a49e56@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>

On Thu, Jan 17, 2013 at 01:04:23PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in
> drivers/staging/sb105x/Kconfig between commit db210312f77b ("staging:
> Make SystemBase PCI Multiport UART only for x86") from the  tree and
> commit e27a7d7977b0 ("Staging: sb105x: mark it BROKEN") from the tty tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc drivers/staging/sb105x/Kconfig
> index 1facad6,3d0d0eb..0000000
> --- a/drivers/staging/sb105x/Kconfig
> +++ b/drivers/staging/sb105x/Kconfig
> @@@ -1,8 -1,7 +1,8 @@@
>   config SB105X
>   	tristate "SystemBase PCI Multiport UART"
>   	select SERIAL_CORE
> - 	depends on PCI
> + 	depends on PCI && BROKEN
>  +	depends on X86

Looks good to me, thanks.

greg k-h
