From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the y2038 tree with the staging tree
Date: Sun, 1 Nov 2015 10:03:59 -0800
Message-ID: <20151101180359.GA13943@kroah.com>
References: <20151102014449.5ae120ab@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:52441 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751481AbbKASED (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 1 Nov 2015 13:04:03 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id CB83B20565
	for <linux-next@vger.kernel.org>; Sun,  1 Nov 2015 13:04:01 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20151102014449.5ae120ab@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Deepa Dinamani <deepa.kernel@gmail.com>, Tapasweni Pathak <tapaswenipathak@gmail.com>

On Mon, Nov 02, 2015 at 01:44:49AM +1100, Stephen Rothwell wrote:
> Hi Arnd,
> 
> Today's linux-next merge of the y2038 tree got conflicts in:
> 
>   drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.c
>   drivers/staging/ft1000/ft1000-usb/ft1000_debug.c
>   drivers/staging/ft1000/ft1000-usb/ft1000_hw.c
>   drivers/staging/ft1000/ft1000.h
> 
> between commit:
> 
>   6512edec48b2 ("staging: ft1000: remove obsolete driver")
> 
> from the staging tree and commit:
> 
>   8b37bf430656 ("staging: ft1000: Replace timeval and time_t with time64_t")
> 
> from the y2038 tree.
> 
> I fixed it up (the former removed the files) and can carry the fix as
> necessary (no action is required).

Thanks for the fix, that sounds obviously correct :)

greg k-h
