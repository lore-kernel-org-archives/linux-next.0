From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: IBFT and SWIOTLB tree.
Date: Wed, 24 Feb 2010 10:00:34 -0500
Message-ID: <20100224150034.GB20890@phenom.dumpdata.com>
References: <20100223160034.GC28966@phenom.dumpdata.com> <20100224193931.89bb7e87.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:47812 "EHLO
	rcsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756532Ab0BXP3Q (ORCPT
	<rfc822;<linux-next@vger.kernel.org>>);
	Wed, 24 Feb 2010 10:29:16 -0500
Content-Disposition: inline
In-Reply-To: <20100224193931.89bb7e87.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Wed, Feb 24, 2010 at 07:39:31PM +1100, Stephen Rothwell wrote:
> Hi Konrad,
> 
> On Tue, 23 Feb 2010 11:00:34 -0500 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com> wrote:
> >
> > I was wondering if it would be possible to include these two trees in
> > the automatic merge/build process:
> 
> I would need a bit a background for these trees since you are not listed
> as a maintainer in the MAINTAINERS file.

Hmm, weird. IBFT is the patch set for the drivers/firmware/iscsi_ibft.c
which was developed by me.

> 
> > git://git.kernel.org/pub/scm/linux/kernel/git/konrad/ibft-2.6.git
> > 
> > and
> > git://git.kernel.org/pub/scm/linux/kernel/git/konrad/swiotlb-2.6.git

That one is the re-work of the SWIOTLB IOMMU code. Not a maintainer, but
I want to make sure that the patches don't stomp/break other code.
> 
> The master branch of both these trees is empty relative to Linus' tree ...

Let me fix that. I had the HEAD point to the right branch, but didn't
think of updating the refs/heads/master file.
