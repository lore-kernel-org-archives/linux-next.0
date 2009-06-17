From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH next] PCI hotplug: fix build when !SYSFS
Date: Wed, 17 Jun 2009 16:23:17 +0400
Message-ID: <1245241397-6781-1-git-send-email-a.beregalov@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f212.google.com ([209.85.220.212]:33692 "EHLO
	mail-fx0-f212.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754009AbZFQMbL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Jun 2009 08:31:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: jbarnes@virtuousgeek.org, kaneshige.kenji@jp.fujitsu.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Cc: Alexander Beregalov <a.beregalov@gmail.com>

Fix this build error when CONFIG_SYSFS is not set:
drivers/pci/slot.c: In function 'pci_hp_create_module_link':
drivers/pci/slot.c:327: error: 'module_kset' undeclared

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---
 drivers/pci/slot.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/pci/slot.c b/drivers/pci/slot.c
index eddb074..dd6c097 100644
--- a/drivers/pci/slot.c
+++ b/drivers/pci/slot.c
@@ -308,6 +308,7 @@ void pci_destroy_slot(struct pci_slot *slot)
 EXPORT_SYMBOL_GPL(pci_destroy_slot);
 
 #if defined(CONFIG_HOTPLUG_PCI) || defined(CONFIG_HOTPLUG_PCI_MODULE)
+#ifdef CONFIG_SYSFS
 #include <linux/pci_hotplug.h>
 /**
  * pci_hp_create_link - create symbolic link to the hotplug driver module.
@@ -344,6 +345,14 @@ void pci_hp_remove_module_link(struct pci_slot *pci_slot)
 	sysfs_remove_link(&pci_slot->kobj, "module");
 }
 EXPORT_SYMBOL_GPL(pci_hp_remove_module_link);
+#else /* CONFIG_SYSFS */
+
+inline void pci_hp_create_module_link(struct pci_slot *pci_slot) {}
+EXPORT_SYMBOL_GPL(pci_hp_create_module_link);
+
+inline void pci_hp_remove_module_link(struct pci_slot *pci_slot) {}
+EXPORT_SYMBOL_GPL(pci_hp_remove_module_link);
+#endif /* CONFIG_SYSFS */
 #endif
 
 static int pci_slot_init(void)
-- 
1.6.2.4
