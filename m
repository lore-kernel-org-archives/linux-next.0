From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the
	parisc tree
Date: Sun, 1 Feb 2009 20:41:44 -0800
Message-ID: <20090202044144.GA12243@kroah.com>
References: <20090202111112.731a6816.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:53445 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753465AbZBBEnm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Feb 2009 23:43:42 -0500
Content-Disposition: inline
In-Reply-To: <20090202111112.731a6816.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, James Bottomley <James.Bottomley@HansenPartnership.com>, Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org

On Mon, Feb 02, 2009 at 11:11:12AM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got conflicts in
> drivers/char/agp/parisc-agp.c, drivers/parisc/gsc.c and
> drivers/parisc/sba_iommu.c between commit
> a130bf34da4b64d7b289e2358530ef5d4ab27efd ("parisc: remove klist
> iterators") from the parisc tree and commit
> 135bd8a5aeed90af407aeeede9587ee99c5606b2 ("parisc: don't touch driver
> core internals") from the driver-core tree.
> 
> These two commits seem to be trying to do similar things.  I have used
> the versions from the parisc tree.  Greg, I guess you need to check to
> see if you agree and if so, then just remove the driver-core tree patch.

Yes, the parisc version is fine.

> James, Kyle, the one thing I took from Greg's patch was the removal of
> the include of linux/klist.h from drivers/char/agp/parisc-agp.c.

That would be good as well.

I'll fix up my tree tomorrow.

thanks,

greg k-h
