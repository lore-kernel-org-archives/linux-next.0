From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the final tree (staging
 related)
Date: Thu, 16 Jun 2011 12:14:48 -0700
Message-ID: <20110616191448.GA10255@kroah.com>
References: <20110609172745.dfd3a298.sfr@canb.auug.org.au>
 <20110609184127.GA2760@kroah.com>
 <20110609192243.GA3980@kroah.com>
 <20110610160548.529797c7.sfr@canb.auug.org.au>
 <20110610160938.cd01c408.sfr@canb.auug.org.au>
 <20110610223423.GB15868@kroah.com>
 <20110615142155.bd538b73.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4.smtp.messagingengine.com ([66.111.4.28]:52934 "EHLO
	out4.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756431Ab1FPTPA (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Jun 2011 15:15:00 -0400
Content-Disposition: inline
In-Reply-To: <20110615142155.bd538b73.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: brudley@broadcom.com, henryp@broadcom.com, rvossen@broadcom.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>

On Wed, Jun 15, 2011 at 02:21:55PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Fri, 10 Jun 2011 15:34:23 -0700 Greg KH <greg@kroah.com> wrote:
> >
> > On Fri, Jun 10, 2011 at 04:09:38PM +1000, Stephen Rothwell wrote:
> > > 
> > > On Fri, 10 Jun 2011 16:05:48 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > No, I still get these:
> > > > 
> > > > In file included from drivers/staging/comedi/drivers/addi_apci_035.c:7:0:
> > > > drivers/staging/comedi/drivers/addi-data/addi_common.c: In function 'i_ADDI_Attach':
> > > > drivers/staging/comedi/drivers/addi-data/addi_common.c:2765:7: error: implicit declaration of function 'virt_to_bus'
> > > > 
> > > > virt_to_bus is only defined for 32 bit powerpc (not 64 bit) (and maybe
> > > > not at all on some architectures e.g. sparc).
> > > > 
> > > > From Documentation/DMA-API-HOWTO.txt:
> > > > "All drivers should be using these interfaces with no exceptions.  It
> > > > is planned to completely remove virt_to_bus() and bus_to_virt() as
> > > > they are entirely deprecated.  Some ports already do not provide these
> > > > as it is impossible to correctly support them."
> > > 
> > > Drivers that use virt_to_bus should Kconfig depend on VIRT_TO_BUS.
> > 
> > Ah, I missed that, sorry.  I'll go make that change as well.
> 
> Ping?

Sorry, been swamped with other work, I'll get to this soon...

With a very relative value of soon.

greg k-h
