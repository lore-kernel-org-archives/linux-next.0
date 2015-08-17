From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree with the arm-soc tree
Date: Mon, 17 Aug 2015 11:08:55 +1000
Message-ID: <20150817110855.4fcf9a66@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58304 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751575AbbHQBI5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 16 Aug 2015 21:08:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, Ray Jui <rjui@broadcom.com>

Hi Bjorn,

Today's linux-next merge of the pci tree got a conflict in:

  drivers/pci/host/Kconfig

between commit:

  70d334ca71b0 ("PCI: iproc: Fix BCMA dependency in Kconfig")

from the arm-soc tree and commit:

  05aa7d6a72c1 ("PCI: iproc: Allow BCMA bus driver to be built as module")

from the pci tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/pci/host/Kconfig
index 48b5b3058d9d,e339a8c42f76..000000000000
--- a/drivers/pci/host/Kconfig
+++ b/drivers/pci/host/Kconfig
@@@ -135,8 -135,8 +135,8 @@@ config PCIE_IPROC_PLATFOR
  	  through the generic platform bus interface
  
  config PCIE_IPROC_BCMA
- 	bool "Broadcom iProc PCIe BCMA bus driver"
+ 	tristate "Broadcom iProc PCIe BCMA bus driver"
 -	depends on ARCH_BCM_IPROC || (ARM && COMPILE_TEST)
 +	depends on ARM && (ARCH_BCM_IPROC || COMPILE_TEST)
  	select PCIE_IPROC
  	select BCMA
  	select PCI_DOMAINS
