From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: IBFT and SWIOTLB tree.
Date: Mon, 1 Mar 2010 13:26:42 -0500
Message-ID: <20100301182642.GA31926@phenom.dumpdata.com>
References: <20100223160034.GC28966@phenom.dumpdata.com> <20100224193931.89bb7e87.sfr@canb.auug.org.au> <20100224150034.GB20890@phenom.dumpdata.com> <20100301172554.92574f5d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:23717 "EHLO
	rcsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751235Ab0CASvB (ORCPT
	<rfc822;<linux-next@vger.kernel.org>>);
	Mon, 1 Mar 2010 13:51:01 -0500
Content-Disposition: inline
In-Reply-To: <20100301172554.92574f5d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Mon, Mar 01, 2010 at 05:25:54PM +1100, Stephen Rothwell wrote:
> Hi Konrad,
> 
> On Wed, 24 Feb 2010 10:00:34 -0500 Konrad Rzeszutek Wilk <konrad.wilk@ORACLE.COM> wrote:
> >
> > On Wed, Feb 24, 2010 at 07:39:31PM +1100, Stephen Rothwell wrote:
> > > 
> > > I would need a bit a background for these trees since you are not listed
> > > as a maintainer in the MAINTAINERS file.
> > 
> > Hmm, weird. IBFT is the patch set for the drivers/firmware/iscsi_ibft.c
> > which was developed by me.
> 
> And I see you have added a MAINTAINERS entry and Linus has merged the two
> patches.  I will add this tree tomorrow.  Please don't add any 2.6.35
> material until after 2.6.34-rc1 is released.  2.6.34 material and fixes
> are OK.

Excellent.
> 
> > > > git://git.kernel.org/pub/scm/linux/kernel/git/konrad/swiotlb-2.6.git
> > 
> > That one is the re-work of the SWIOTLB IOMMU code. Not a maintainer, but
> > I want to make sure that the patches don't stomp/break other code.
> 
> Is this intended for 3.6.34?  I can't add that tree yet, as it has a
> series of patches in it that have no Signed-off-by lines.  This material
> should also get fairly wide review and I would expect to see some
> Acked-by lines before the patches were ready for inclusion.

Ok. I am still a bit new at this so I wasn't sure about the inclusion
criteria. Please defer that git tree (swiotlb-2.6) until I get it moving upstream.
