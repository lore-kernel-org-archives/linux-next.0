From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pci tree
Date: Fri, 22 Apr 2016 10:48:39 +1000
Message-ID: <20160422104839.604a191a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51710 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752076AbcDVAsm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Apr 2016 20:48:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Murali Karicheri <m-karicheri2@ti.com>, Rob Herring <robh@kernel.org>

Hi Bjorn,

After merging the pci tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/pci/host/pci-keystone.c: In function 'ks_pcie_probe':
drivers/pci/host/pci-keystone.c:412:16: error: 'node' undeclared (first use in this function)
  ks_pcie->np = node;
                ^

Caused by commit

  7be92716c1aa ("PCI: keystone: Add error IRQ handler")

I have used the pci tree from next-20160421 for today.

-- 
Cheers,
Stephen Rothwell
