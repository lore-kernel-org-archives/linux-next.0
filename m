From: Christoph Hellwig <hch@lst.de>
Subject: Re: [xfs-masters] Re: linux-next: Tree for June 24 (XFS x2)
Date: Fri, 27 Jun 2008 15:23:17 +0200
Message-ID: <20080627132317.GB23854@lst.de>
References: <20080624175612.cdf29651.sfr@canb.auug.org.au> <20080624171809.42bbdf68.randy.dunlap@oracle.com> <20080625003751.GP29319@disturbed>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.210]:53949 "EHLO verein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753015AbYF0NXe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Jun 2008 09:23:34 -0400
Content-Disposition: inline
In-Reply-To: <20080625003751.GP29319@disturbed>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: xfs-masters@oss.sgi.com, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, Jun 25, 2008 at 10:37:51AM +1000, Dave Chinner wrote:
> What the hell happened here? Where's the commit title, description
> so this can be tracked back to a real patch?  That PV# is also bogus....
> 
> I suspect that it is this patch:
> 
> http://oss.sgi.com/archives/xfs/2008-05/msg00322.html
> 
> Which means that the Signed-Off-By list is incorrect as well as the original
> patch came from Christoph. This can't go to mainline like this - the commit log
> needs to be fixed up.

The tree is still messed up.  This original [XFS] commit is still there,
but also a revert of it.  but no patch with the actual changes again (?)

Also my patch to switch to the generic xattr code is attributed to
Lachlan and appears twice in the commit list.  I think this whole git
tree needs to be regenerated.
