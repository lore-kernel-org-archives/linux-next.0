From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mips tree with the pci-current tree
Date: Fri, 22 Sep 2017 10:01:14 +1000
Message-ID: <20170922100114.569b940e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51147 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751728AbdIVABQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Sep 2017 20:01:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Manuel Lauss <manuel.lauss@gmail.com>

Hi all,

Today's linux-next merge of the mips tree got a conflict in:

  arch/mips/pci/pci-octeon.c

between commit:

  19a8d6b7604d ("MIPS: PCI: Move map_irq() hooks out of initdata")

from the pci-current tree and commit:

  8eba3651f1da ("MIPS: PCI: fix pcibios_map_irq section mismatch")

from the mips tree.

I fixed it up (basically the same patch - I used the pci-current tree
version) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
