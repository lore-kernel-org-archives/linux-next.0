From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pm tree with Linus' tree
Date: Mon, 9 Nov 2015 10:45:12 +1100
Message-ID: <20151109104512.781b6af2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, "Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>
List-Id: linux-next.vger.kernel.org

Hi Rafael,

Today's linux-next merge of the pm tree got a conflict in:

  drivers/of/of_pci.c
  include/linux/of_pci.h

between commits:

  f81c11af617c ("of/pci: Add of_pci_check_probe_only to parse "linux,pci-probe-only"")

from Linus' tree and commit:

  50230713b639 ("PCI: OF: Move of_pci_dma_configure() to pci_dma_configure()")

from the pm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/of/of_pci.c
index ff27177f49ed,b66ee4ebf650..000000000000
--- a/drivers/of/of_pci.c
+++ b/drivers/of/of_pci.c
@@@ -118,51 -117,6 +118,31 @@@ int of_get_pci_domain_nr(struct device_
  }
  EXPORT_SYMBOL_GPL(of_get_pci_domain_nr);
  
 +/**
 + * of_pci_check_probe_only - Setup probe only mode if linux,pci-probe-only
 + *                           is present and valid
 + */
 +void of_pci_check_probe_only(void)
 +{
 +	u32 val;
 +	int ret;
 +
 +	ret = of_property_read_u32(of_chosen, "linux,pci-probe-only", &val);
 +	if (ret) {
 +		if (ret == -ENODATA || ret == -EOVERFLOW)
 +			pr_warn("linux,pci-probe-only without valid value, ignoring\n");
 +		return;
 +	}
 +
 +	if (val)
 +		pci_add_flags(PCI_PROBE_ONLY);
 +	else
 +		pci_clear_flags(PCI_PROBE_ONLY);
 +
 +	pr_info("PCI: PROBE_ONLY %sabled\n", val ? "en" : "dis");
 +}
 +EXPORT_SYMBOL_GPL(of_pci_check_probe_only);
 +
- /**
-  * of_pci_dma_configure - Setup DMA configuration
-  * @dev: ptr to pci_dev struct of the PCI device
-  *
-  * Function to update PCI devices's DMA configuration using the same
-  * info from the OF node of host bridge's parent (if any).
-  */
- void of_pci_dma_configure(struct pci_dev *pci_dev)
- {
- 	struct device *dev = &pci_dev->dev;
- 	struct device *bridge = pci_get_host_bridge_device(pci_dev);
- 
- 	if (!bridge->parent)
- 		return;
- 
- 	of_dma_configure(dev, bridge->parent->of_node);
- 	pci_put_host_bridge_device(bridge);
- }
- EXPORT_SYMBOL_GPL(of_pci_dma_configure);
- 
  #if defined(CONFIG_OF_ADDRESS)
  /**
   * of_pci_get_host_bridge_resources - Parse PCI host bridge resources from DT
diff --cc include/linux/of_pci.h
index 38c0533a3359,ce0e5abeb454..000000000000
--- a/include/linux/of_pci.h
+++ b/include/linux/of_pci.h
@@@ -16,8 -16,6 +16,7 @@@ int of_pci_get_devfn(struct device_nod
  int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin);
  int of_pci_parse_bus_range(struct device_node *node, struct resource *res);
  int of_get_pci_domain_nr(struct device_node *node);
- void of_pci_dma_configure(struct pci_dev *pci_dev);
 +void of_pci_check_probe_only(void);
  #else
  static inline int of_irq_parse_pci(const struct pci_dev *pdev, struct of_phandle_args *out_irq)
  {
@@@ -52,10 -50,6 +51,8 @@@ of_get_pci_domain_nr(struct device_nod
  {
  	return -1;
  }
 +
- static inline void of_pci_dma_configure(struct pci_dev *pci_dev) { }
- 
 +static inline void of_pci_check_probe_only(void) { }
  #endif
  
  #if defined(CONFIG_OF_ADDRESS)
