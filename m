From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree with Linus' tree
Date: Fri, 9 Dec 2016 10:44:09 +1100
Message-ID: <20161209104409.1f64df16@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47317 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932825AbcLHXoN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Dec 2016 18:44:13 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>

Hi Bjorn,

Today's linux-next merge of the pci tree got a conflict in:

  drivers/pci/msi.c

between commit:

  62c61514191b ("doc: Add missing parameter for msi_setup")

from Linus' tree and commit:

  67f1e4473857 ("PCI/MSI: Document new parameter for msi_capability_init()")

from the pci tree.

I fixed it up (I just used the pci tree version) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but
any non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
