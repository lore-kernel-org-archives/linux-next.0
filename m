From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: linux-next: build failure after merge of the final tree (staging
 tree related)
Date: Mon, 27 Feb 2012 13:16:30 -0800
Message-ID: <20120227211630.GA18418@kroah.com>
References: <20120227181303.9aa93b8a8ed02428e9310c5e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:40066 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754276Ab2B0VR4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Feb 2012 16:17:56 -0500
Received: by pbcup15 with SMTP id up15so2487309pbc.19
        for <linux-next@vger.kernel.org>; Mon, 27 Feb 2012 13:17:54 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20120227181303.9aa93b8a8ed02428e9310c5e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Kelly <ckelly@ozmodevices.com>

On Mon, Feb 27, 2012 at 06:13:03PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build
> (powerpc_allyesconfig) failed like this:
> 
> drivers/staging/ozwpan/ozcdev.c: In function 'oz_cdev_ioctl':
> drivers/staging/ozwpan/ozcdev.c:284:7: error: case label does not reduce to an integer constant
> 
> Caused by commit 23af8c2a088f ("staging: ozwpan: Added character device
> support") from the staging tree.
> 
> I reverted commit b0406db5b3e4 ("staging: ozwpan: Plumbed in Kconfig and
> Kbuild") for today.

Thanks, Chris, care to fix this up and send me a patch?

greg k-h
