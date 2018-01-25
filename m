From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the devicetree tree with the pci tree
Date: Fri, 26 Jan 2018 07:34:13 +1100
Message-ID: <20180126073413.56901025@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50965 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750838AbeAYUeU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 25 Jan 2018 15:34:20 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Rob,

Today's linux-next merge of the devicetree tree got a conflict in:

  drivers/of/Kconfig

between commit:

  4670d610d592 ("PCI: Move OF-related PCI functions into PCI core")

from the pci tree and commit:

  6019a3d07d72 ("of: enable unittests on UML")

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/of/Kconfig
index ee244c2e8c2b,06898039d11e..000000000000
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@@ -61,7 -63,11 +63,7 @@@ config OF_DYNAMI
  
  config OF_ADDRESS
  	def_bool y
- 	depends on !SPARC && HAS_IOMEM
+ 	depends on !SPARC && (HAS_IOMEM || UML)
 -	select OF_ADDRESS_PCI if PCI
 -
 -config OF_ADDRESS_PCI
 -	bool
  
  config OF_IRQ
  	def_bool y
