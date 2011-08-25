From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] tty/powerpc: fix build break with ehv_bytechan.c on
 allyesconfig
Date: Thu, 25 Aug 2011 12:03:30 -0700
Message-ID: <20110825190330.GA2383@kroah.com>
References: <1314289245-14946-1-git-send-email-timur@freescale.com>
 <20110825163234.GA31629@kroah.com>
 <4E568E19.405@freescale.com>
 <20110825184655.GB1891@kroah.com>
 <4E5699A8.1070708@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:49450 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755273Ab1HYTDx (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 25 Aug 2011 15:03:53 -0400
Content-Disposition: inline
In-Reply-To: <4E5699A8.1070708@freescale.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Timur Tabi <timur@freescale.com>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org

On Thu, Aug 25, 2011 at 01:51:20PM -0500, Timur Tabi wrote:
> Greg KH wrote:
> > But don't you really want this type of check at runtime?  What happens
> > if you load this driver on a machine that is not a guest?  Will things
> > break?  Shouldn't you still refuse to load somehow?
> 
> This is in the udbg code, which falls under the category of, "turn this on only
> if you know what you're doing."
> 
> The udbg code runs very early, before the device tree is available.  There's no
> way of knowing at this point whether or not we're running under a hypervisor.
> If you turn on udbg support, then it means that you're trying to do some very
> specific debugging on a specific platform.
> 
> So I'm not removing this code just to fix the build break.  It really should
> never have been there in the first place.

Ok, thanks for the details, I'll queue up the patch in a bit.

greg k-h
