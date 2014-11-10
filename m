From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the staging
 tree
Date: Mon, 10 Nov 2014 14:58:05 +0900
Message-ID: <20141110055805.GA28761@kroah.com>
References: <20141110165316.5c122b47@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:42491 "EHLO
	out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750928AbaKJGIL (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 10 Nov 2014 01:08:11 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id D37472029E
	for <linux-next@vger.kernel.org>; Mon, 10 Nov 2014 01:08:10 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20141110165316.5c122b47@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pratik Patel <pratikp@codeaurora.org>

On Mon, Nov 10, 2014 at 04:53:16PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in
> drivers/Makefile between commit 777783e0abae ("staging: android:
> binder: move to the "real" part of the kernel") from the staging tree and
> commit a06ae8609b3d ("coresight: add CoreSight core layer framework")
> from the char-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc drivers/Makefile
> index 60d19820a4d4,628b512b625b..000000000000
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@@ -161,4 -161,4 +161,5 @@@ obj-$(CONFIG_POWERCAP)		+= powercap
>   obj-$(CONFIG_MCB)		+= mcb/
>   obj-$(CONFIG_RAS)		+= ras/
>   obj-$(CONFIG_THUNDERBOLT)	+= thunderbolt/
>  +obj-$(CONFIG_ANDROID)		+= android/
> + obj-$(CONFIG_CORESIGHT)		+= coresight/


Looks good, thanks.

greg k-h
