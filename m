From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the final tree (usb
 tree related)
Date: Thu, 17 Jun 2010 10:25:16 -0700
Message-ID: <20100617172515.GA20453@kroah.com>
References: <20100617145331.7bbefc4a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:58100 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756938Ab0FQRZh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Jun 2010 13:25:37 -0400
Content-Disposition: inline
In-Reply-To: <20100617145331.7bbefc4a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alek Du <alek.du@intel.com>, Jacob Pan <jacob.jun.pan@intel.com>

On Thu, Jun 17, 2010 at 02:53:31PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> In file included from drivers/usb/host/ehci-hcd.c:113:
> drivers/usb/host/ehci-dbg.c: In function 'debug_lpm_write':
> drivers/usb/host/ehci-dbg.c:992: error: implicit declaration of function 'copy_from_user'
> 
> Caused by commit a3c0b4b257eeaefe4e6c8fbf5ddfe674242f1b9e ("USB: EHCI:
> EHCI 1.1 addendum: preparation").  Presumably a missing include of
> linux/uaccess.h ...
> 
> I applied this patch for today:

thanks, I've merged your fix in with the main patch so this problem will
not show up, and pushed the updated patches out.

thanks,

greg k-h
