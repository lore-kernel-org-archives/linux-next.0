From: Greg KH <gregkh@suse.de>
Subject: Re: linux-next: Tree for September 6 (drivers/base/core)
Date: Mon, 6 Sep 2010 17:14:07 -0700
Message-ID: <20100907001407.GA10273@suse.de>
References: <20100906141727.646c68e7.sfr@canb.auug.org.au> <20100906164918.56487d92.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41212 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752229Ab0IGAOj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 6 Sep 2010 20:14:39 -0400
Content-Disposition: inline
In-Reply-To: <20100906164918.56487d92.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, Sep 06, 2010 at 04:49:18PM -0700, Randy Dunlap wrote:
> On Mon, 6 Sep 2010 14:17:27 +1000 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Changes since 20100903:
> > 
> > The powerpc tree still has its build failure for which I applied a patch.
> > 
> > I still have a patch to the drivers-x86 tree to remove a Kconfig warning.
> > 
> > ----------------------------------------------------------------------------
> 
> 
> when CONFIG_BLOCK is not enabled:
> 
> drivers/base/core.c:622: error: 'block_class' undeclared (first use in this function)
> drivers/base/core.c:712: error: 'block_class' undeclared (first use in this function)
> drivers/base/core.c:742: error: 'block_class' undeclared (first use in this function)

Ah, due to the CONFIG_SYSFS_DEPRECATED stuff.  I'll work on this later
today if Kay doesn't beat me to it...

thanks,

greg k-h
