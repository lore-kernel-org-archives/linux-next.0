From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the usb.current tree
Date: Wed, 27 Aug 2014 16:55:16 -0700
Message-ID: <20140827235516.GA12987@kroah.com>
References: <20140827110322.5f8a7742@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:56910 "EHLO
	out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S965351AbaH0XzS (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Aug 2014 19:55:18 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by gateway2.nyi.internal (Postfix) with ESMTP id 1FF27208B6
	for <linux-next@vger.kernel.org>; Wed, 27 Aug 2014 19:55:18 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20140827110322.5f8a7742@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Roger Quadros <rogerq@ti.com>, Michael Welling <mwelling@emacinc.com>, Alan Stern <stern@rowland.harvard.edu>

On Wed, Aug 27, 2014 at 11:03:22AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the usb.current tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/usb/core/hub.c: In function 'hub_probe':
> drivers/usb/core/hub.c:1735:21: error: 'struct dev_pm_info' has no member named 'autosuspend_delay'
>   if (hdev->dev.power.autosuspend_delay >= 0)
>                      ^
> 
> Caused by commit bdd405d2a528 ("usb: hub: Prevent hub autosuspend if
> usbcore.autosuspend is -1").  CONFIG_PM_RUNTIME is not set in this
> build.
> 
> I have reverted that commit for today.

Thanks, I'll work on fixing this later on today...

greg k-h
