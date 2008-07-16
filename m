From: Christoph Hellwig <hch@lst.de>
Subject: Re: [xfs-masters] Re: linux-next: Tree for June 24 (XFS x2)
Date: Wed, 16 Jul 2008 09:19:22 +0200
Message-ID: <20080716071922.GA16777@lst.de>
References: <20080624175612.cdf29651.sfr@canb.auug.org.au> <20080624171809.42bbdf68.randy.dunlap@oracle.com> <20080625003751.GP29319@disturbed> <20080627132317.GB23854@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.210]:45399 "EHLO verein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751061AbYGPHTp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 03:19:45 -0400
Content-Disposition: inline
In-Reply-To: <20080627132317.GB23854@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: xfs-masters@oss.sgi.com, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Jun 27, 2008 at 03:23:17PM +0200, Christoph Hellwig wrote:
> 
> The tree is still messed up.  This original [XFS] commit is still there,
> but also a revert of it.  but no patch with the actual changes again (?)
> 
> Also my patch to switch to the generic xattr code is attributed to
> Lachlan and appears twice in the commit list.  I think this whole git
> tree needs to be regenerated.

Could this please get fixed before the 2.6.27 pull?  The xfs.git tree
now has Linus' latest changes pulled but this still doesn't look
fixed up.
