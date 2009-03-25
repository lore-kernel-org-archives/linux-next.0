From: Matthew Wilcox <willy@linux.intel.com>
Subject: Re: linux-next: pci tree build failure
Date: Tue, 24 Mar 2009 21:30:01 -0700
Message-ID: <20090325043001.GF20264@linux.intel.com>
References: <20090323124948.fed84e3a.sfr@canb.auug.org.au> <20090325122121.225a0ccb.sfr@canb.auug.org.au> <20090324183800.6ba50715@hobbes.virtuouswap> <20090325144117.9c54ae5a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.89]:8078 "EHLO
	fmsmga101.fm.intel.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752901AbZCYEaE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 25 Mar 2009 00:30:04 -0400
Content-Disposition: inline
In-Reply-To: <20090325144117.9c54ae5a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org

On Wed, Mar 25, 2009 at 02:41:17PM +1100, Stephen Rothwell wrote:
> Hi Jesse,
> 
> On Tue, 24 Mar 2009 18:38:00 -0700 Jesse Barnes <jbarnes@virtuousgeek.org> wrote:
> >
> > On Wed, 25 Mar 2009 12:21:21 +1100
> > Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > > On Mon, 23 Mar 2009 12:49:48 +1100 Stephen Rothwell
> > > <sfr@canb.auug.org.au> wrote:
> > > >
> > > > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > > > 
> > > > arch/powerpc/kernel/msi.c: In function 'arch_msi_check_device':
> > > > arch/powerpc/kernel/msi.c:23: error: 'PCI_CAP_ID_MSI' undeclared
> > > > (first use in this function)
> > > > 
> > > > Caused by commit 1c8d7b0a562da06d3ebe83f01b1ed553205d1ae4 ("PCI
> > > > MSI: Add support for multiple MSI").  PCI_CAP_ID_MSI is defined in
> > > > linux/pci_regs.h which is included by linux/pci.h, but neither is
> > > > included by arch/powerpc/kernel/msi.c.
> > > > 
> > > > I have used the version of the pci tree from next-20090320 for
> > > > today.
> > > 
> > > This is still happening ...

I just got back from a long weekend ...

> > Does this fix it?  Some header file changes must be to blame...
> 
> Yeah, that patch fixes it, but so does just reverting the commit above,
> so I guess that powerpc file did not need any of the pci.h infrastructure
> before.
> 
> Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>

I guess not.  I didn't compile-test it (I don't have a powerpc machine
or cross-compiler).  Seems odd, given that the whole purpose of the file
is to implement PCI MSI ... oh well.
