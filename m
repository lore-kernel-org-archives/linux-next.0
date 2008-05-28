From: Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>
Subject: [PATCH 4/4] Updated version of 9d06d9963852e7818157994c645c640239cb5137
Date: Wed, 28 May 2008 15:01:03 +0900
Message-ID: <483CF51F.4010409@jp.fujitsu.com>
References: <20080528122758.70c4bec9.sfr@canb.auug.org.au> <483CC873.5000300@jp.fujitsu.com> <200805272108.32974.jbarnes@virtuousgeek.org> <483CF356.1010807@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fgwmail6.fujitsu.co.jp ([192.51.44.36]:34987 "EHLO
	fgwmail6.fujitsu.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753460AbYE1GCN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 May 2008 02:02:13 -0400
In-Reply-To: <483CF356.1010807@jp.fujitsu.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

Fix the following problems of shpchp driver about getting hotplug
control from firmware.

  - The shpchp driver must not control the hotplug controller if it
    fails to get control from the firmware. But current shpchp
    controls the hotplug controller regardless the result, because it
    doesn't check the return value of get_hp_hw_control_from_firmware().

  - Current shpchp driver doesn't support _OSC.

The pciehp driver already have the code for evaluating _OSC and OSHP
and shpchp and pciehp can share it. So this patch move that code from
pciehp to acpi_pcihp.c.

Signed-off-by: Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>

---
 drivers/pci/hotplug/acpi_pcihp.c  |   85 ++++++++++++++++++++++++++++++++++++--
 drivers/pci/hotplug/pciehp.h      |   10 +++-
 drivers/pci/hotplug/pciehp_hpc.c  |   69 ------------------------------
 drivers/pci/hotplug/shpchp.h      |   14 +++---
 drivers/pci/hotplug/shpchp_core.c |   15 +++---
 drivers/pci/hotplug/shpchp_hpc.c  |    1 
 include/linux/pci_hotplug.h       |    2 
 7 files changed, 105 insertions(+), 91 deletions(-)

Index: linux-2.6.26-rc4/drivers/pci/hotplug/acpi_pcihp.c
===================================================================
--- linux-2.6.26-rc4.orig/drivers/pci/hotplug/acpi_pcihp.c
+++ linux-2.6.26-rc4/drivers/pci/hotplug/acpi_pcihp.c
@@ -30,6 +30,7 @@
 #include <linux/types.h>
 #include <linux/pci.h>
 #include <linux/pci_hotplug.h>
+#include <linux/pci-acpi.h>
 #include <acpi/acpi.h>
 #include <acpi/acpi_bus.h>
 #include <acpi/actypes.h>
@@ -299,7 +300,7 @@ free_and_return:
  *
  * @handle - the handle of the hotplug controller.
  */
-acpi_status acpi_run_oshp(acpi_handle handle)
+static acpi_status acpi_run_oshp(acpi_handle handle)
 {
 	acpi_status		status;
 	struct acpi_buffer	string = { ACPI_ALLOCATE_BUFFER, NULL };
@@ -322,9 +323,6 @@ acpi_status acpi_run_oshp(acpi_handle ha
 	kfree(string.pointer);
 	return status;
 }
-EXPORT_SYMBOL_GPL(acpi_run_oshp);
-
-
 
 /* acpi_get_hp_params_from_firmware
  *
@@ -374,6 +372,85 @@ acpi_status acpi_get_hp_params_from_firm
 }
 EXPORT_SYMBOL_GPL(acpi_get_hp_params_from_firmware);
 
+/**
+ * acpi_get_hp_hw_control_from_firmware
+ * @dev: the pci_dev of the bridge that has a hotplug controller
+ * @flags: requested control bits for _OSC
+ *
+ * Attempt to take hotplug control from firmware.
+ */
+int acpi_get_hp_hw_control_from_firmware(struct pci_dev *dev, u32 flags)
+{
+	acpi_status status;
+	acpi_handle chandle, handle = DEVICE_ACPI_HANDLE(&(dev->dev));
+	struct pci_dev *pdev = dev;
+	struct pci_bus *parent;
+	struct acpi_buffer string = { ACPI_ALLOCATE_BUFFER, NULL };
+
+	flags &= (OSC_PCI_EXPRESS_NATIVE_HP_CONTROL |
+		  OSC_SHPC_NATIVE_HP_CONTROL |
+		  OSC_PCI_EXPRESS_CAP_STRUCTURE_CONTROL);
+	if (!flags) {
+		err("Invalid flags %u specified!\n", flags);
+		return -EINVAL;
+	}
+
+	/*
+	 * Per PCI firmware specification, we should run the ACPI _OSC
+	 * method to get control of hotplug hardware before using it. If
+	 * an _OSC is missing, we look for an OSHP to do the same thing.
+	 * To handle different BIOS behavior, we look for _OSC and OSHP
+	 * within the scope of the hotplug controller and its parents,
+	 * upto the host bridge under which this controller exists.
+	 */
+	while (!handle) {
+		/*
+		 * This hotplug controller was not listed in the ACPI name
+		 * space at all. Try to get acpi handle of parent pci bus.
+		 */
+		if (!pdev || !pdev->bus->parent)
+			break;
+		parent = pdev->bus->parent;
+		dbg("Could not find %s in acpi namespace, trying parent\n",
+		    pci_name(pdev));
+		if (!parent->self)
+			/* Parent must be a host bridge */
+			handle = acpi_get_pci_rootbridge_handle(
+					pci_domain_nr(parent),
+					parent->number);
+		else
+			handle = DEVICE_ACPI_HANDLE(&(parent->self->dev));
+		pdev = parent->self;
+	}
+
+	while (handle) {
+		acpi_get_name(handle, ACPI_FULL_PATHNAME, &string);
+		dbg("Trying to get hotplug control for %s \n",
+		    (char *)string.pointer);
+		status = pci_osc_control_set(handle, flags);
+		if (status == AE_NOT_FOUND)
+			status = acpi_run_oshp(handle);
+		if (ACPI_SUCCESS(status)) {
+			dbg("Gained control for hotplug HW for pci %s (%s)\n",
+			    pci_name(dev), (char *)string.pointer);
+			kfree(string.pointer);
+			return 0;
+		}
+		if (acpi_root_bridge(handle))
+			break;
+		chandle = handle;
+		status = acpi_get_parent(chandle, &handle);
+		if (ACPI_FAILURE(status))
+			break;
+	}
+
+	dbg("Cannot get control of hotplug hardware for pci %s\n",
+	    pci_name(dev));
+
+	kfree(string.pointer);
+	return -ENODEV;
+}
+EXPORT_SYMBOL(acpi_get_hp_hw_control_from_firmware);
 
 /* acpi_root_bridge - check to see if this acpi object is a root bridge
  *
Index: linux-2.6.26-rc4/drivers/pci/hotplug/pciehp.h
===================================================================
--- linux-2.6.26-rc4.orig/drivers/pci/hotplug/pciehp.h
+++ linux-2.6.26-rc4/drivers/pci/hotplug/pciehp.h
@@ -202,9 +202,13 @@ struct hpc_ops {
 #include <acpi/actypes.h>
 #include <linux/pci-acpi.h>
 
-extern int pciehp_acpi_get_hp_hw_control_from_firmware(struct pci_dev *dev);
-#define pciehp_get_hp_hw_control_from_firmware(dev)			\
-	pciehp_acpi_get_hp_hw_control_from_firmware(dev)
+static inline int pciehp_get_hp_hw_control_from_firmware(struct pci_dev *dev)
+{
+	u32 flags = (OSC_PCI_EXPRESS_NATIVE_HP_CONTROL |
+		     OSC_PCI_EXPRESS_CAP_STRUCTURE_CONTROL);
+	return acpi_get_hp_hw_control_from_firmware(dev, flags);
+}
+
 static inline int pciehp_get_hp_params_from_firmware(struct pci_dev *dev,
 			struct hotplug_params *hpp)
 {
Index: linux-2.6.26-rc4/drivers/pci/hotplug/pciehp_hpc.c
===================================================================
--- linux-2.6.26-rc4.orig/drivers/pci/hotplug/pciehp_hpc.c
+++ linux-2.6.26-rc4/drivers/pci/hotplug/pciehp_hpc.c
@@ -1009,75 +1009,6 @@ static struct hpc_ops pciehp_hpc_ops = {
 	.check_lnk_status		= hpc_check_lnk_status,
 };
 
-#ifdef CONFIG_ACPI
-int pciehp_acpi_get_hp_hw_control_from_firmware(struct pci_dev *dev)
-{
-	acpi_status status;
-	acpi_handle chandle, handle = DEVICE_ACPI_HANDLE(&(dev->dev));
-	struct pci_dev *pdev = dev;
-	struct pci_bus *parent;
-	struct acpi_buffer string = { ACPI_ALLOCATE_BUFFER, NULL };
-
-	/*
-	 * Per PCI firmware specification, we should run the ACPI _OSC
-	 * method to get control of hotplug hardware before using it.
-	 * If an _OSC is missing, we look for an OSHP to do the same thing.
-	 * To handle different BIOS behavior, we look for _OSC and OSHP
-	 * within the scope of the hotplug controller and its parents, upto
-	 * the host bridge under which this controller exists.
-	 */
-	while (!handle) {
-		/*
-		 * This hotplug controller was not listed in the ACPI name
-		 * space at all. Try to get acpi handle of parent pci bus.
-		 */
-		if (!pdev || !pdev->bus->parent)
-			break;
-		parent = pdev->bus->parent;
-		dbg("Could not find %s in acpi namespace, trying parent\n",
-				pci_name(pdev));
-		if (!parent->self)
-			/* Parent must be a host bridge */
-			handle = acpi_get_pci_rootbridge_handle(
-					pci_domain_nr(parent),
-					parent->number);
-		else
-			handle = DEVICE_ACPI_HANDLE(
-					&(parent->self->dev));
-		pdev = parent->self;
-	}
-
-	while (handle) {
-		acpi_get_name(handle, ACPI_FULL_PATHNAME, &string);
-		dbg("Trying to get hotplug control for %s \n",
-			(char *)string.pointer);
-		status = pci_osc_control_set(handle,
-				OSC_PCI_EXPRESS_CAP_STRUCTURE_CONTROL |
-				OSC_PCI_EXPRESS_NATIVE_HP_CONTROL);
-		if (status == AE_NOT_FOUND)
-			status = acpi_run_oshp(handle);
-		if (ACPI_SUCCESS(status)) {
-			dbg("Gained control for hotplug HW for pci %s (%s)\n",
-				pci_name(dev), (char *)string.pointer);
-			kfree(string.pointer);
-			return 0;
-		}
-		if (acpi_root_bridge(handle))
-			break;
-		chandle = handle;
-		status = acpi_get_parent(chandle, &handle);
-		if (ACPI_FAILURE(status))
-			break;
-	}
-
-	dbg("Cannot get control of hotplug hardware for pci %s\n",
-			pci_name(dev));
-
-	kfree(string.pointer);
-	return -1;
-}
-#endif
-
 static int pcie_init_hardware_part1(struct controller *ctrl,
 				    struct pcie_device *dev)
 {
Index: linux-2.6.26-rc4/include/linux/pci_hotplug.h
===================================================================
--- linux-2.6.26-rc4.orig/include/linux/pci_hotplug.h
+++ linux-2.6.26-rc4/include/linux/pci_hotplug.h
@@ -227,9 +227,9 @@ struct hotplug_params {
 #include <acpi/acpi.h>
 #include <acpi/acpi_bus.h>
 #include <acpi/actypes.h>
-extern acpi_status acpi_run_oshp(acpi_handle handle);
 extern acpi_status acpi_get_hp_params_from_firmware(struct pci_bus *bus,
 				struct hotplug_params *hpp);
+int acpi_get_hp_hw_control_from_firmware(struct pci_dev *dev, u32 flags);
 int acpi_root_bridge(acpi_handle handle);
 #endif
 #endif
Index: linux-2.6.26-rc4/drivers/pci/hotplug/shpchp.h
===================================================================
--- linux-2.6.26-rc4.orig/drivers/pci/hotplug/shpchp.h
+++ linux-2.6.26-rc4/drivers/pci/hotplug/shpchp.h
@@ -170,6 +170,7 @@ extern void shpchp_queue_pushbutton_work
 extern int shpc_init( struct controller *ctrl, struct pci_dev *pdev);
 
 #ifdef CONFIG_ACPI
+#include <linux/pci-acpi.h>
 static inline int get_hp_params_from_firmware(struct pci_dev *dev,
 					      struct hotplug_params *hpp)
 {
@@ -177,14 +178,15 @@ static inline int get_hp_params_from_fir
 			return -ENODEV;
 	return 0;
 }
-#define get_hp_hw_control_from_firmware(pdev)				\
-	do {								\
-		if (DEVICE_ACPI_HANDLE(&(pdev->dev)))			\
-			acpi_run_oshp(DEVICE_ACPI_HANDLE(&(pdev->dev)));\
-	} while (0)
+
+static inline int get_hp_hw_control_from_firmware(struct pci_dev *dev)
+{
+	u32 flags = OSC_SHPC_NATIVE_HP_CONTROL;
+	return acpi_get_hp_hw_control_from_firmware(dev, flags);
+}
 #else
 #define get_hp_params_from_firmware(dev, hpp) (-ENODEV)
-#define get_hp_hw_control_from_firmware(dev) do { } while (0)
+#define get_hp_hw_control_from_firmware(dev) (0)
 #endif
 
 struct ctrl_reg {
Index: linux-2.6.26-rc4/drivers/pci/hotplug/shpchp_core.c
===================================================================
--- linux-2.6.26-rc4.orig/drivers/pci/hotplug/shpchp_core.c
+++ linux-2.6.26-rc4/drivers/pci/hotplug/shpchp_core.c
@@ -330,13 +330,14 @@ static int get_cur_bus_speed (struct hot
 
 static int is_shpc_capable(struct pci_dev *dev)
 {
-       if ((dev->vendor == PCI_VENDOR_ID_AMD) || (dev->device ==
-                               PCI_DEVICE_ID_AMD_GOLAM_7450))
-               return 1;
-       if (pci_find_capability(dev, PCI_CAP_ID_SHPC))
-               return 1;
-
-       return 0;
+	if ((dev->vendor == PCI_VENDOR_ID_AMD) || (dev->device ==
+						PCI_DEVICE_ID_AMD_GOLAM_7450))
+		return 1;
+	if (!pci_find_capability(dev, PCI_CAP_ID_SHPC))
+		return 0;
+	if (get_hp_hw_control_from_firmware(dev))
+		return 0;
+	return 1;
 }
 
 static int shpc_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
Index: linux-2.6.26-rc4/drivers/pci/hotplug/shpchp_hpc.c
===================================================================
--- linux-2.6.26-rc4.orig/drivers/pci/hotplug/shpchp_hpc.c
+++ linux-2.6.26-rc4/drivers/pci/hotplug/shpchp_hpc.c
@@ -1084,7 +1084,6 @@ int shpc_init(struct controller *ctrl, s
 	dbg("%s: HPC at b:d:f:irq=0x%x:%x:%x:%x\n", __func__,
 			pdev->bus->number, PCI_SLOT(pdev->devfn),
 			PCI_FUNC(pdev->devfn), pdev->irq);
-	get_hp_hw_control_from_firmware(pdev);
 
 	/*
 	 * If this is the first controller to be initialized,


