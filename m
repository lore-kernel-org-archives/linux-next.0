From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure
Date: Mon, 12 May 2008 00:54:54 -0700 (PDT)
Message-ID: <20080512.005454.31875425.davem@davemloft.net>
References: <20080512154717.2d0947f0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:35353
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1760448AbYELHzA (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 12 May 2008 03:55:00 -0400
In-Reply-To: <20080512154717.2d0947f0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: greg@kroah.com, linux-next@vger.kernel.org, kay.sievers@vrfy.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 12 May 2008 15:47:17 +1000

> Today's linux-next build (sparc64 defconfig) fails like this:
> 
> arch/sparc64/kernel/pci.c: In function `of_create_pci_dev':
> arch/sparc64/kernel/pci.c:412: warning: passing arg 1 of `sprintf' discards qualifiers from pointer target type
> make[2]: *** [arch/sparc64/kernel/pci.o] Error 1
> 
> (I assume sparc64 builds with -Werr)

Yes, it builds everything except the FPU emulator under arch/sparc64
with -Werror

> This started on May 8 with the introduction of "driver-core: prepare for
> removal of 20 char limit from struct device".
> 
> The sparc64 pci code above looks like this:
> 
> 	sprintf(pci_name(dev), "%04x:%02x:%02x.%d", pci_domain_nr(bus),
> 		dev->bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn));
> 

There is identical code in arch/powerpc/kernel/pci_64.c, it doesn't
break the build there becuase powerpc doesn't use -Werror (yet) :-)

I'm getting a little tired of all of these breakages that occur when
the core PCI probing under drivers/pci or related datastructures are
modified but nobody even tests the build of powerpc or sparc's OF
based PCI bus probing code.

There have also been functional breakages due to core PCI changes
because of this, an update goes into the drivers/pci/*.c code but
doesn't get noticed for arch/{sparc64,powerpc}/'s PCI probing code
until some poor arch maintainer or user tries to bootup on those
platforms.
