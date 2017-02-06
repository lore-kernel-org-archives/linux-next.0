From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the v4l-dvb
 tree
Date: Mon, 6 Feb 2017 09:37:42 +0100
Message-ID: <20170206083741.GA24733@kroah.com>
References: <20170206153151.3e999469@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:51399 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750909AbdBFIiC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Feb 2017 03:38:02 -0500
Content-Disposition: inline
In-Reply-To: <20170206153151.3e999469@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sean Young <sean@mess.org>, Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>

On Mon, Feb 06, 2017 at 03:31:51PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/staging/media/lirc/lirc_parallel.c
> 
> between commit:
> 
>   2933974cbb03 ("[media] staging: lirc_parallel: remove")
> 
> from the v4l-dvb tree and commit:
> 
>   1c5fa1c7dbff ("staging: media: lirc: use new parport device model")
> 
> from the staging tree.
> 
> Unfortunate ...

That's fine, thanks for letting me know, I didn't realize the file was
removed until after I had applied the patch :(

thanks,

greg k-h
