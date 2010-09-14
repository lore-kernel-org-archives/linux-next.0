From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the usb tree
Date: Mon, 13 Sep 2010 21:03:36 -0700
Message-ID: <20100914040336.GA11972@kroah.com>
References: <20100914125431.1603ffd1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:58509 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750743Ab0INEO0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Sep 2010 00:14:26 -0400
Content-Disposition: inline
In-Reply-To: <20100914125431.1603ffd1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mihai Don??u <mihai.dontu@gmail.com>, David Brownell <dbrownell@users.sourceforge.net>

On Tue, Sep 14, 2010 at 12:54:31PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the usb tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> In file included from drivers/usb/gadget/ether.c:123:
> drivers/usb/gadget/rndis.c: In function 'rndis_init':
> drivers/usb/gadget/rndis.c:1163: error: expected ';' before 'if'
> 
> Caused by commit c8feb3bad134f927a624cc19da13f57627b905e2 ("USB: gadget:
> rndis: fix up coding style issues in the file").
> 
> I used the version of the usb tree from next-20100913 for today.

Wierd, I haven't added any patches to my tree in a while, I guess this
didn't get pulled into the previous linux-next tree.  I'll go fix this
up now.

thanks,

greg k-h
