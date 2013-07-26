From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Fri, 26 Jul 2013 14:03:35 -0700
Message-ID: <20130726210335.GA2788@kroah.com>
References: <20130726160254.83bbe994219d6ee732c64b7d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:35007 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1760149Ab3GZVDn (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Jul 2013 17:03:43 -0400
Content-Disposition: inline
In-Reply-To: <20130726160254.83bbe994219d6ee732c64b7d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eli Billauer <eli.billauer@gmail.com>

On Fri, Jul 26, 2013 at 04:02:54PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/staging/xillybus/xillybus_pcie.o:(.data+0x6d8): multiple definition of `xillyname'
> drivers/staging/xillybus/xillybus_core.o:(.data+0x888): first defined here
> 
> Caused by commit 48bae0507410 ("staging: New driver: Xillybus generic
> interface for FPGA").
> 
> I have disabled that driver.

I think I need to just always make any new staging driver only build as
a module, and not allowed to be built into the kernel.  That will save
you time dealing with this, and me the extra time of marking them all as
modules-only every time :)

Sorry about this, I'll go fix this up now...

greg k-h
