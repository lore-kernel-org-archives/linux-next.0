From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: manual merge of the tip tree with the iommu tree
Date: Thu, 18 Jun 2015 07:15:08 +1000
Message-ID: <1434575708.21460.0.camel@ellerman.id.au>
References: <1434511374.24642.7.camel@ellerman.id.au>
	 <20150617095751.GB27750@8bytes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33119 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753195AbbFQVPQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Jun 2015 17:15:16 -0400
In-Reply-To: <20150617095751.GB27750@8bytes.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org Jiang Liu" <jiang.liu@linux.intel.com>, Joerg Roedel <jroedel@suse.de>, Feng Wu <feng.wu@intel.com>

On Wed, 2015-06-17 at 11:57 +0200, Joerg Roedel wrote:
> Hi Michael,
> 
> On Wed, Jun 17, 2015 at 01:22:54PM +1000, Michael Ellerman wrote:
> > Today's linux-next merge of the tip tree got conflicts in:
> > 
> >   drivers/iommu/intel_irq_remapping.c
> >   drivers/iommu/dmar.c
> > 
> > between commits:
> > 
> >   af3b358e4811 "iommu/vt-d: Copy IR table from old kernel when in kdump mode"
> >   23256d0b3500 "iommu/vt-d: Move EIM detection to intel_prepare_irq_remapping"
> >   9f10e5bf62f7 "iommu/vt-d: Cleanup log messages"
> > 
> > from the iommu tree and commits:
> > 
> >   8dedf4cf5a52 "irq_remapping/vt-d: Change prototypes to prepare for hierarchical irqdomain"
> >   b106ee63abcc "irq_remapping/vt-d: Enhance Intel IR driver to support hierarchical irqdomains"
> >   3d9b98f4ec17 "iommu, x86: Setup Posted-Interrupts capability for Intel iommu"
> >   3c6e567509ed "irq_remapping/vt-d: Clean up unsued code"
> >   34742db8eaf9 "iommu/vt-d: Refine the interfaces to create IRQ for DMAR unit"
> > 
> > from the tip tree.
> > 
> > Or something like that, it was a bit of a mess. Given the size of the conflict
> > I doubt I got it right, but it does seem to build.
> > 
> > I fixed it up (see below) and can carry the fix as necessary (no action
> > is required).
> 
> Sorry for the hassle, but your conflict resolution looks good. I tried a
> merge between tip/x86/apic and iommu/next myself and solved the
> conflicts. The results look quite similar to yours (not sure why I got
> conflicts in unrelated files):

Thanks for checking.

cheers
