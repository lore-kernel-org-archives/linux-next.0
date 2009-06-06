From: Greg KH <greg@kroah.com>
Subject: Re: [BUILD FAILURE 01/04] Next June 04:PPC64 randconfig
	[drivers/staging/comedi/drivers.o]
Date: Fri, 5 Jun 2009 22:51:03 -0700
Message-ID: <20090606055103.GA9446@kroah.com>
References: <20090605182625.24093.7808.sendpatchset@elm3a191.beaverton.ibm.com> <1244244749.31984.16.camel@pasglop> <20090605.175656.95336229.davem@davemloft.net> <1244261806.31984.36.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:40300 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750721AbZFFFv0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 6 Jun 2009 01:51:26 -0400
Content-Disposition: inline
In-Reply-To: <1244261806.31984.36.camel@pasglop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Ian Abbott <abbotti@mev.co.uk>, Frank Mori Hess <fmhess@users.sourceforge.net>
Cc: David Miller <davem@davemloft.net>, subrata@linux.vnet.ibm.com, sachinp@linux.vnet.ibm.com, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, Linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, paulus@samba.org, Geert.Uytterhoeven@sonycom.com, geert@linux-m68k.org

On Sat, Jun 06, 2009 at 02:16:46PM +1000, Benjamin Herrenschmidt wrote:
> On Fri, 2009-06-05 at 17:56 -0700, David Miller wrote:
> > > 
> > > Read my reply to Greg. Why the heck are you trying to map memory
> > > non-cacheable in the first place ?
> > 
> > I agree, this is extremely fishy.
> > 
> > I guess the issue is that the driver wants consistent DMA memory
> > but wants to allocate a huge area vmap() style.
> 
> That's my guess too, and I suppose we should be able to provide an
> appropriate interface for that... There are two aspects that
> are completely separate here:
> 
>  - One is the allocation of the pages themselves which much match
> the various criteria for DMA'bility to the target device (fit the
> DMA mask, etc...)
> 
>  - One is the creation of the virtual mapping in kernel space for which
> appropriate pgprot for DMA must be provided.
> 
> For the first one, I don't know how legit it would be to allocate the
> pages using dma_alloc_coherent one page at a time and try to figure out
> the struct page * out of it. Sounds fishy and possibly non-portable. So
> appart from using normal GFP and crossing fingers I'm not sure what
> would be the right way to obtain the pages in the first place. Maybe we
> should provide something.
> 
> The second could be as simple as having a pgprot_dma_coherent() like we
> have a pgprot_uncached() for example, which would be either uncached or
> cached depending on the consistency of DMA on the platform. But we need
> to run that through things like MIPS which may have additional virtual
> address space requirements.

All good questions.  So, let's ask the original authors :)

Frank and Ian, any thoughts about the vmap call in the
comedi_buf_alloc() call?  Why is it using PAGE_KERNEL_NOCACHE, and what
is the prealloc_buf buffer used for?

The problem is that PAGE_KERNEL_NOCACHE isn't a "standard" interface,
and not all architectures support it.

thanks,

greg k-h
