From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: linux-next: manual merge of the mips tree with the pci-current
 tree
Date: Fri, 22 Sep 2017 10:20:09 +0100
Message-ID: <20170922092009.GA1523@red-moon>
References: <20170922100114.569b940e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:55182 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751809AbdIVJRl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 22 Sep 2017 05:17:41 -0400
Content-Disposition: inline
In-Reply-To: <20170922100114.569b940e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Ralf Baechle <ralf@linux-mips.org>, Manuel Lauss <manuel.lauss@gmail.com>
Cc: James Hogan <james.hogan@imgtec.com>, Bjorn Helgaas <bhelgaas@google.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Manuel, Ralf,

On Fri, Sep 22, 2017 at 10:01:14AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the mips tree got a conflict in:
> 
>   arch/mips/pci/pci-octeon.c
> 
> between commit:
> 
>   19a8d6b7604d ("MIPS: PCI: Move map_irq() hooks out of initdata")

This commit (coming from the PCI tree) should be a superset of the fix
in the MIPS tree below, do you mind having a look please and if that's
the case drop commit below from the MIPS tree please ?

> from the pci-current tree and commit:
> 
>   8eba3651f1da ("MIPS: PCI: fix pcibios_map_irq section mismatch")
> 
> from the mips tree.
> 
> I fixed it up (basically the same patch - I used the pci-current tree
> version) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be mentioned
> to your upstream maintainer when your tree is submitted for merging.
> You may also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.

I had no idea of:

8eba3651f1da ("MIPS: PCI: fix pcibios_map_irq section mismatch")

existence, apologies.

Lorenzo
