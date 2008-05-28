From: Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>
Subject: [PATCH 2/4] Updated version of 4c8cc2d54b1d35cf24ede6057e05f103cfa28852
Date: Wed, 28 May 2008 14:57:30 +0900
Message-ID: <483CF44A.1060103@jp.fujitsu.com>
References: <20080528122758.70c4bec9.sfr@canb.auug.org.au> <483CC873.5000300@jp.fujitsu.com> <200805272108.32974.jbarnes@virtuousgeek.org> <483CF356.1010807@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fgwmail6.fujitsu.co.jp ([192.51.44.36]:34791 "EHLO
	fgwmail6.fujitsu.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753200AbYE1F6N (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 May 2008 01:58:13 -0400
In-Reply-To: <483CF356.1010807@jp.fujitsu.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

Current pciehp evaluates _OSC/OSHP method after some controller
initialization is done. So if evaluating _OSC/OSHP is failed, we need
to cleanup already initialized data structures or hardware. This
clearly is not robust way. With this patch, _OSC/OSHP evaluation is
done first.

Signed-off-by: Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>

---
 drivers/pci/hotplug/pciehp.h      |    1 +
 drivers/pci/hotplug/pciehp_core.c |   10 +++++++---
 drivers/pci/hotplug/pciehp_hpc.c  |   17 ++---------------
 3 files changed, 10 insertions(+), 18 deletions(-)

Index: linux-2.6.26-rc4/drivers/pci/hotplug/pciehp_core.c
===================================================================
--- linux-2.6.26-rc4.orig/drivers/pci/hotplug/pciehp_core.c
+++ linux-2.6.26-rc4/drivers/pci/hotplug/pciehp_core.c
@@ -444,7 +444,13 @@ static int pciehp_probe(struct pcie_devi
 	struct controller *ctrl;
 	struct slot *t_slot;
 	u8 value;
-	struct pci_dev *pdev;
+	struct pci_dev *pdev = dev->port;
+
+	if (pciehp_force)
+		dbg("Bypassing BIOS check for pciehp use on %s\n",
+		    pci_name(pdev));
+	else if (pciehp_get_hp_hw_control_from_firmware(pdev))
+		goto err_out_none;
 
 	ctrl = kzalloc(sizeof(*ctrl), GFP_KERNEL);
 	if (!ctrl) {
@@ -453,8 +459,6 @@ static int pciehp_probe(struct pcie_devi
 	}
 	INIT_LIST_HEAD(&ctrl->slot_list);
 
-	pdev = dev->port;
-
 	rc = pcie_init(ctrl, dev);
 	if (rc) {
 		dbg("%s: controller initialization failed\n", PCIE_MODULE_NAME);
Index: linux-2.6.26-rc4/drivers/pci/hotplug/pciehp_hpc.c
===================================================================
--- linux-2.6.26-rc4.orig/drivers/pci/hotplug/pciehp_hpc.c
+++ linux-2.6.26-rc4/drivers/pci/hotplug/pciehp_hpc.c
@@ -1018,7 +1018,7 @@ static struct hpc_ops pciehp_hpc_ops = {
 };
 
 #ifdef CONFIG_ACPI
-static int pciehp_acpi_get_hp_hw_control_from_firmware(struct pci_dev *dev)
+int pciehp_acpi_get_hp_hw_control_from_firmware(struct pci_dev *dev)
 {
 	acpi_status status;
 	acpi_handle chandle, handle = DEVICE_ACPI_HANDLE(&(dev->dev));
@@ -1122,23 +1122,10 @@ int pcie_init_hardware_part2(struct cont
 
 	if (pcie_write_cmd(ctrl, cmd, mask)) {
 		err("%s: Cannot enable software notification\n", __func__);
-		goto abort;
+		return -1;
 	}
 
-	if (pciehp_force)
-		dbg("Bypassing BIOS check for pciehp use on %s\n",
-				pci_name(ctrl->pci_dev));
-	else if (pciehp_get_hp_hw_control_from_firmware(ctrl->pci_dev))
-		goto abort_disable_intr;
-
 	return 0;
-
-	/* We end up here for the many possible ways to fail this API. */
-abort_disable_intr:
-	if (pcie_write_cmd(ctrl, 0, HP_INTR_ENABLE))
-		err("%s : disabling interrupts failed\n", __func__);
-abort:
-	return -1;
 }
 
 static inline void dbg_ctrl(struct controller *ctrl)
Index: linux-2.6.26-rc4/drivers/pci/hotplug/pciehp.h
===================================================================
--- linux-2.6.26-rc4.orig/drivers/pci/hotplug/pciehp.h
+++ linux-2.6.26-rc4/drivers/pci/hotplug/pciehp.h
@@ -202,6 +202,7 @@ struct hpc_ops {
 #include <acpi/actypes.h>
 #include <linux/pci-acpi.h>
 
+extern int pciehp_acpi_get_hp_hw_control_from_firmware(struct pci_dev *dev);
 #define pciehp_get_hp_hw_control_from_firmware(dev)			\
 	pciehp_acpi_get_hp_hw_control_from_firmware(dev)
 static inline int pciehp_get_hp_params_from_firmware(struct pci_dev *dev,


