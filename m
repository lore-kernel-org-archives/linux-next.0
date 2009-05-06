From: Yinghai Lu <yinghai@kernel.org>
Subject: Re: linux-next: pci tree build warning
Date: Wed, 06 May 2009 00:21:20 -0700
Message-ID: <4A013A70.30101@kernel.org>
References: <20090506143007.c0ef2340.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:32954 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751310AbZEFHVp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 May 2009 03:21:45 -0400
In-Reply-To: <20090506143007.c0ef2340.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org

Stephen Rothwell wrote:
> Hi Jesse,
> 
> Today's linux-next build (powerpc ppc64_defconfig) produced this warning:
> 
> drivers/pci/probe.c: In function '__pci_read_base':
> drivers/pci/probe.c:196: warning: large integer implicitly truncated to unsigned type
> 
> Probably introduced by commit 82160fd142cdf6956a677120426bf5baefcc7cf9
> ("PCI/x86: don't assume prefetchable ranges are 64bit").
> 

--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -193,7 +193,7 @@ int __pci_read_base(struct pci_dev *dev, enum pci_bar_type type,
                res->flags |= pci_calc_resource_flags(l) | IORESOURCE_SIZEALIGN;
                if (type == pci_bar_io) {
                        l &= PCI_BASE_ADDRESS_IO_MASK;
-                       mask = PCI_BASE_ADDRESS_IO_MASK & 0xffff;
+                       mask = PCI_BASE_ADDRESS_IO_MASK & IO_SPACE_LIMIT;


and

for x86:
#define IO_SPACE_LIMIT 0xffff

for powerpc
arch/powerpc/include/asm/io.h:#define IO_SPACE_LIMIT ~(0UL)

maybe we need to change back that line...

YH
