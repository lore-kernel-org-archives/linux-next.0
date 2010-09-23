From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH -next] driver core: fix build for CONFIG_BLOCK=n
Date: Thu, 23 Sep 2010 10:57:07 -0700
Message-ID: <20100923105707.4803ee76.randy.dunlap@oracle.com>
References: <20100920161239.f204a507.sfr@canb.auug.org.au>
	<20100920092034.0b3f5898.randy.dunlap@oracle.com>
	<20100921223115.GB21202@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:55365 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753968Ab0IWTsx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Sep 2010 15:48:53 -0400
In-Reply-To: <20100921223115.GB21202@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kay Sievers <kay.sievers@vrfy.org>, gregkh@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 21 Sep 2010 15:31:15 -0700 Greg KH wrote:

> On Mon, Sep 20, 2010 at 09:20:34AM -0700, Randy Dunlap wrote:
> > From: Randy Dunlap <randy.dunlap@oracle.com>
> > 
> > Fix build when CONFIG_BLOCK is not enabled (since SEP-06).
> > Fixes these build errors:
> > 
> > drivers/base/core.c: In function 'get_device_parent':
> > drivers/base/core.c:622: error: 'block_class' undeclared (first use in this function)
> > drivers/base/core.c: In function 'device_add_class_symlinks':
> > drivers/base/core.c:712: error: 'block_class' undeclared (first use in this function)
> > drivers/base/core.c: In function 'device_remove_class_symlinks':
> > drivers/base/core.c:742: error: 'block_class' undeclared (first use in this function)
> > 
> > Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> 
> This should no longer be needed with the next linux-next tree as the
> logic in this area has changed thanks to Andi's patch.

Still seeing this build error.
Will you be merging some patch soon?

thnx,
---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
