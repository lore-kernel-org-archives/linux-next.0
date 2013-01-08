From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Mon, 7 Jan 2013 20:27:30 -0800
Message-ID: <20130108042730.GA3936@kroah.com>
References: <20130108132352.dbabdc281512cdaffbae5ae9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:52546 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750991Ab3AHEfx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Jan 2013 23:35:53 -0500
Content-Disposition: inline
In-Reply-To: <20130108132352.dbabdc281512cdaffbae5ae9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ian Abbott <abbotti@mev.co.uk>, H Hartley Sweeten <hsweeten@visionengravers.com>

On Tue, Jan 08, 2013 at 01:23:52PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/staging/comedi/comedi_fops.c: In function 'comedi_unlocked_ioctl':
> drivers/staging/comedi/comedi_fops.c:1665:4: error: 'dev_file_info' undeclared (first use in this function)
> 
> Caused by commit 4da5fa9a439f ("staging: comedi: use comedi_dev_from_minor
> ()") interacting with commit 7d3135af399e ("staging: comedi: prevent
> auto-unconfig of manually configured devices") from the staging.current
> tree.
> 
> I just reverted the latter commit in the hope that the bug is fixed in
> some other way in the staging tree.

Yes, I had to do some manual fixup when merging the branches together to
get it to work properly, which is what I did in my staging-next tree.
As the fixup was done in the merge commit, maybe you didn't get it when
you did the pull?

thanks,

greg k-h
