From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warning after merge of the tty tree
Date: Thu, 23 Sep 2010 21:44:03 -0700
Message-ID: <20100924044403.GB31185@kroah.com>
References: <20100924140351.b137a3b7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:47587 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750837Ab0IXEnS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 24 Sep 2010 00:43:18 -0400
Content-Disposition: inline
In-Reply-To: <20100924140351.b137a3b7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alan Cox <alan@linux.intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Sep 24, 2010 at 02:03:51PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the tty tree, today's linux-next build (powerpc
> allyesconfig) produced this warning:
> 
> drivers/usb/serial/ssu100.c: In function 'ssu100_ioctl':
> drivers/usb/serial/ssu100.c:448: warning: unused variable 'user_arg'
> drivers/usb/serial/ssu100.c:447: warning: unused variable 'priv'
> 
> Introduced by commit 20e2e6fa50180468e4240a91f811dca3a1c30304 ("tty:
> Convert the USB drivers to the new icount interface").

Alan, care to fix this one up as well?

thanks,

greg k-h
