From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the battery tree
Date: Thu, 5 Jan 2012 07:53:09 -0800
Message-ID: <20120105155309.GA4765@kroah.com>
References: <20120105144042.4e03850089cce56a7e9312e4@canb.auug.org.au>
 <20120105152536.GB28629@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:34047 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932643Ab2AEPxr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Jan 2012 10:53:47 -0500
Received: from compute6.internal (compute6.nyi.mail.srv.osa [10.202.2.46])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 5D2A320C0F
	for <linux-next@vger.kernel.org>; Thu,  5 Jan 2012 10:53:46 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20120105152536.GB28629@oksana.dev.rtsoft.ru>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Anton Vorontsov <cbouatmailru@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jeremy Fitzhardinge <jeremy@goop.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jan 05, 2012 at 07:25:36PM +0400, Anton Vorontsov wrote:
> On Thu, Jan 05, 2012 at 02:40:42PM +1100, Stephen Rothwell wrote:
> > Hi Anton,
> > 
> > After merging the battery tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > ERROR: "sysfs_create_link_nowarn" [drivers/power/power_supply.ko] undefined!
> > 
> > Caused by commit 8351665195ce ("power_supply: allow a power supply to
> > explicitly point to powered device").  That symbol is not exported to
> > modules.
> > 
> > I have used the battery tree from next-20120104 for today.
> 
> Thanks for catching this, Stephen!
> 
> I wonder why do we need to use _nowarn variant?..
> 
> Something tells me that we actually want a warning.

Yes, no one other than the driver core should ever be calling this
function, that is why it is not exported.

And I'm guessing, hopefully, that this sysfs link you are creating, is
also being documented in Documentation/ABI/ right?  If not, it must be.

thanks,

greg k-h
