From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: pci tree build failure
Date: Wed, 25 Mar 2009 20:37:11 -0700
Message-ID: <20090325203711.5c8a6bc9@hobbes.virtuouswap>
References: <20090323124948.fed84e3a.sfr@canb.auug.org.au>
	<20090325122121.225a0ccb.sfr@canb.auug.org.au>
	<20090324183800.6ba50715@hobbes.virtuouswap>
	<20090325144117.9c54ae5a.sfr@canb.auug.org.au>
	<20090325043001.GF20264@linux.intel.com>
	<20090325085550.3788540b@hobbes.virtuouswap>
	<20090326140531.cde0be37.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-154.bluehost.com ([67.222.39.34]:35527 "HELO
	outbound-mail-154.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1753124AbZCZDn4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Mar 2009 23:43:56 -0400
In-Reply-To: <20090326140531.cde0be37.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Matthew Wilcox <willy@linux.intel.com>, linux-next@vger.kernel.org

On Thu, 26 Mar 2009 14:05:31 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Jesse,
> 
> On Wed, 25 Mar 2009 08:55:50 -0700 Jesse Barnes
> <jbarnes@virtuousgeek.org> wrote:
> >
> > Ok fix pushed.  Yeah it does seem weird.  This file clearly uses PCI
> > defines...
> 
> Thanks.
> 
> Actually all that file required was a "forward" declaration of "struct
> pci_dev".  It was not accessing the pci_dev in any way, just passing
> pointers to them on to other routines.  I guess it got such a
> declaration indirectly.
> 
> /me likes to understand ...

Looked liked it used the PCI MSI capability ID offset though?  In that
case it would really want at least pci_regs.h, but pci.h seems a little
more complete in this case.

-- 
Jesse Barnes, Intel Open Source Technology Center
