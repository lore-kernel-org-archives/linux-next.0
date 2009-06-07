From: Subrata Modak <subrata@linux.vnet.ibm.com>
Subject: Re: [BUILD FAILURE 01/04] Next June 04:PPC64 randconfig
	[drivers/staging/comedi/drivers.o]
Date: Sun, 07 Jun 2009 20:06:45 +0530
Message-ID: <1244385405.5265.7.camel@subratamodak.linux.ibm.com>
References: <20090605182625.24093.7808.sendpatchset@elm3a191.beaverton.ibm.com>
	 <1244261806.31984.36.camel@pasglop> <20090606055103.GA9446@kroah.com>
	 <200906060936.22322.fmhess@speakeasy.net>
Reply-To: subrata@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e7.ny.us.ibm.com ([32.97.182.137]:60406 "EHLO e7.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750944AbZFGOgw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 7 Jun 2009 10:36:52 -0400
In-Reply-To: <200906060936.22322.fmhess@speakeasy.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: fmhess@users.sourceforge.net
Cc: Greg KH <greg@kroah.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Ian Abbott <abbotti@mev.co.uk>, David Miller <davem@davemloft.net>, sachinp@linux.vnet.ibm.com, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, Linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, paulus@samba.org, Geert.Uytterhoeven@sonycom.com, geert@linux-m68k.org

On Sat, 2009-06-06 at 09:36 -0400, Frank Mori Hess wrote:
> On Saturday 06 June 2009, Greg KH wrote:
> > Frank and Ian, any thoughts about the vmap call in the
> > comedi_buf_alloc() call?  Why is it using PAGE_KERNEL_NOCACHE, and what
> > is the prealloc_buf buffer used for?
> 
> It is a circular buffer used to hold data streaming either to or from a 
> board (for example when producing an analog output waveform).  Reads and 
> writes to the device files read/write to the circular buffer, plus a few 
> drivers do dma directly to/from it.  I personally don't have a problem 
> with requiring drivers to have their own dma buffers and making them copy 
> data between their private dma buffers and the main circular buffer.  I 
> guess the original design wanted to support zero-copy dma.

Great to hear that. How about a patch that solves my build problem on
PPC64(the problem seems to be existing for long) ? 

Regards--
Subrata

> 
