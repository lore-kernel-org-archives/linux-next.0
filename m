From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the usb tree
Date: Thu, 4 May 2017 16:42:15 -0700
Message-ID: <20170504234215.GB13025@kroah.com>
References: <20170501140949.2c07b08d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:55007 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751773AbdEDXmZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 May 2017 19:42:25 -0400
Content-Disposition: inline
In-Reply-To: <20170501140949.2c07b08d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guenter Roeck <groeck@chromium.org>, Gilad Ben-Yossef <gilad@benyossef.com>, Michael Zoran <mzoran@crowfest.net>

On Mon, May 01, 2017 at 02:09:49PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/staging/Makefile
> 
> between commit:
> 
>   f0690a25a140 ("staging: typec: USB Type-C Port Manager (tcpm)")
> 
> from the usb tree and commit:
> 
>   051420a997a5 ("staging: bcm2835-audio: Move driver under vc04_services")
>   abefd6741d54 ("staging: ccree: introduce CryptoCell HW driver")
> 
> from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

I'm the maintainer of both :)

Anyway, I knew this was going to happen, I'll take your fix when the
merge happens, thanks.

greg k-h
