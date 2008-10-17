From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure
Date: Fri, 17 Oct 2008 10:37:11 -0700
Message-ID: <20081017173711.GB2221@kroah.com>
References: <20081017192109.1707f9b6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:38515 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751657AbYJQSsm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Oct 2008 14:48:42 -0400
Content-Disposition: inline
In-Reply-To: <20081017192109.1707f9b6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Ming Lei <tom.leiming@gmail.com>

On Fri, Oct 17, 2008 at 07:21:09PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> drivers/usb/host/ehci-dbg.c: In function 'fill_buffer':
> drivers/usb/host/ehci-dbg.c:839: error: implicit declaration of function 'vmalloc'
> drivers/usb/host/ehci-dbg.c:839: warning: cast to pointer from integer of different size
> drivers/usb/host/ehci-dbg.c: In function 'debug_close':
> drivers/usb/host/ehci-dbg.c:887: error: implicit declaration of function 'vfree'
> 
> Caused by commit b28e0eaa4a48bdc742978d6dd3688ef1db71928c ("USB:
> ehci-dbg: increase debug buffer size for periodic file") from the usb
> tree.
> 
> I added the following patch.

Thanks, I'll merge this in before sending it off to Linus.

greg k-h
