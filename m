From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree with the tegra tree
Date: Fri, 1 Jul 2016 11:09:08 +1000
Message-ID: <20160701110908.02f45e0a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Thierry Reding <treding@nvidia.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Bjorn,

Today's linux-next merge of the pci tree got a conflict in:

  drivers/pci/host/pci-tegra.c

between commit:

  e8a64f7a44be ("PCI: tegra: Use pci_remap_iospace()")

from the tegra tree and commit:

  a73253d223df ("PCI: tegra: Request host bridge window resources with core function")

from the pci tree.

I fixed it up (hopefully - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/pci/host/pci-tegra.c
index 7689f448ff92,6e6ef0d3d739..000000000000
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@@ -620,17 -626,7 +619,7 @@@ static int tegra_pcie_setup(int nr, str
  	if (err < 0)
  		return err;
  
- 	err = devm_request_resource(pcie->dev, &ioport_resource, &pcie->pio);
- 	if (err < 0)
- 		return err;
- 
- 	err = devm_request_resource(pcie->dev, &pcie->all, &pcie->mem);
- 	if (err < 0)
- 		return err;
- 
- 	err = devm_request_resource(pcie->dev, &pcie->all, &pcie->prefetch);
- 	if (err)
- 		return err;
 -	pci_ioremap_io(pcie->pio.start, pcie->io.start);
++	pci_remap_iospace(&pcie->pio, pcie->io.start);
  
  	pci_add_resource_offset(&sys->resources, &pcie->pio, sys->io_offset);
  	pci_add_resource_offset(&sys->resources, &pcie->mem, sys->mem_offset);
