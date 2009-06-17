From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: Tree for June 17 (pci/slot)
Date: Wed, 17 Jun 2009 16:10:01 -0700
Message-ID: <20090617161001.734321be@jbarnes-g45>
References: <20090617155354.075c60ae.sfr@canb.auug.org.au>
	<4A39194B.2060200@oracle.com>
	<20090617163604.GT19977@parisc-linux.org>
	<20090617102901.6e39aac2@jbarnes-g45>
	<4A392B48.7060206@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <4A392B48.7060206@oracle.com>
Sender: linux-pci-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Matthew Wilcox <matthew@wil.cx>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Alex Chiang <achiang@hp.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, 17 Jun 2009 10:43:36 -0700
Randy Dunlap <randy.dunlap@oracle.com> wrote:

> Jesse Barnes wrote:
> > On Wed, 17 Jun 2009 10:36:04 -0600
> > Matthew Wilcox <matthew@wil.cx> wrote:
> > 
> >> On Wed, Jun 17, 2009 at 09:26:51AM -0700, Randy Dunlap wrote:
> >>> Stephen Rothwell wrote:
> >>>> Hi all,
> >>>>
> >>>> Changes since 20090616:
> >>>
> >>> When CONFIG_SYSFS=n:
> >>>
> >>> drivers/pci/slot.c:327: error: 'module_kset' undeclared (first use
> >>> in this function)
> >> Is there any point to pci_slot existing without CONFIG_SYSFS?
> >> I don't see how you can interact with it in any meaningful way.
> >> Perhaps CONFIG_PCI_SLOT should depend on CONFIG_SYSFS?
> > 
> > I've got a code fix queued up, but maybe a Kconfig dependency is the
> > way to go...
> 
> What is the code fix like?
> The Kconfig fix makes sense to me.
> 
> 
Here's the patch I have (sorry cut & paste):

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
  * pci_hp_create_link - create symbolic link to the hotplug driver
module. @@ -344,6 +345,14 @@ void pci_hp_remove_module_link(struct
pci_slot *pci_slot) sysfs_remove_link(&pci_slot->kobj, "module");
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
Jesse Barnes, Intel Open Source Technology Center
