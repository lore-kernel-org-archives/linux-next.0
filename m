From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: net tree build failure (depca)
Date: Mon, 15 Sep 2008 11:59:17 -0700
Message-ID: <20080915185917.GB32003@kroah.com>
References: <20080913150326.245fbb6f.sfr@canb.auug.org.au> <20080913080438.30a37469.randy.dunlap@oracle.com> <1221425376.6397.1.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:52078 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753207AbYIOTBp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Sep 2008 15:01:45 -0400
Content-Disposition: inline
In-Reply-To: <1221425376.6397.1.camel@brick>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Harvey Harrison <harvey.harrison@gmail.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, Julius Volz <juliusv@google.com>, Simon Horman <horms@verge.net.au>, Greg KH <gregkh@suse.de>, Hannes Reinecke <hare@suse.de>

On Sun, Sep 14, 2008 at 01:49:36PM -0700, Harvey Harrison wrote:
> On Sat, 2008-09-13 at 08:04 -0700, Randy Dunlap wrote:
> > Also this one on i386:
> > 
> > drivers/net/depca.c:404: error: implicit declaration of function 'depca_common_remove'
> > drivers/net/depca.c:1602: error: static declaration of 'depca_common_remove' follows non-static declaration
> > drivers/net/depca.c:404: error: previous implicit declaration of 'depca_common_remove' was here
> > make[2]: *** [drivers/net/depca.o] Error 1
> > 
> 
> I'd already sent a patch for that to those responsible:
> 
> From: Harvey Harrison <harvey.harrison@gmail.com>
> Subject: [PATCH] net: compile fix depca.c
> 
> Adding accessors to the ->driver_data field missed a forward
> declaration that is needed to compile.

Merged in, thanks.

greg k-h
