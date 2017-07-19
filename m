From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Wed, 19 Jul 2017 08:07:02 +0200
Message-ID: <20170719060702.GA9423@kroah.com>
References: <20170719130728.3adcae81@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:57469 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751389AbdGSGHL (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 19 Jul 2017 02:07:11 -0400
Content-Disposition: inline
In-Reply-To: <20170719130728.3adcae81@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Marcus Wolf <linux@Wolf-Entwicklungen.de>

On Wed, Jul 19, 2017 at 01:07:28PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got conflicts in:
> 
>   drivers/staging/Kconfig
>   drivers/staging/Makefile
> 
> between commit:
> 
>   dd55d44f4084 ("staging: vboxvideo: Add vboxvideo to drivers/staging")
> 
> from the staging.current tree and commit:
> 
>   874bcba65f9a ("staging: pi433: New driver")
> 
> from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Yeah, I know this is going to happen, I'll be fixing it up when
staging-linus gets into Linus's tree.

thanks,

greg k-h
