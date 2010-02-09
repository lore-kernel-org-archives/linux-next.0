From: Bjorn Helgaas <bjorn.helgaas@hp.com>
Subject: Re: linux-next: build failure after merge of the pci tree
Date: Tue, 9 Feb 2010 09:27:44 -0700
Message-ID: <201002090927.44621.bjorn.helgaas@hp.com>
References: <20100209115427.fe1b7f0c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g1t0027.austin.hp.com ([15.216.28.34]:14315 "EHLO
	g1t0027.austin.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754341Ab0BIQ1s (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2010 11:27:48 -0500
In-Reply-To: <20100209115427.fe1b7f0c.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Monday 08 February 2010 05:54:27 pm Stephen Rothwell wrote:
> Hi Jesse,
> 
> After merging the pci tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> arch/powerpc/kernel/pci_64.c: In function 'pcibios_unmap_io_space':
> arch/powerpc/kernel/pci_64.c:101: error: 'struct pci_bus' has no member named 'resource'
> arch/powerpc/kernel/pci_64.c: In function 'pcibios_map_io_space':
> arch/powerpc/kernel/pci_64.c:149: error: 'struct pci_bus' has no member named 'resource'
> arch/powerpc/kernel/pci_64.c:149: error: 'struct pci_bus' has no member named 'resource'

Crap, sorry.  Looks like I missed one in mn10300, too (and maybe
more).  Let me know if you see any others; I don't have cross-compile
setups for all arches.  But I'll fix up everything I can find.

Bjorn
