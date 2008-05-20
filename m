From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: driver-core/pci merge failure
Date: Wed, 21 May 2008 01:40:43 +0200
Message-ID: <200805210140.43861.rjw@sisk.pl>
References: <20080519120328.40aa6d5d.sfr@canb.auug.org.au> <200805201408.44509.jbarnes@virtuousgeek.org> <20080520233113.GA5053@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:47150 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753402AbYETXkM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 20 May 2008 19:40:12 -0400
In-Reply-To: <20080520233113.GA5053@kroah.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Wednesday, 21 of May 2008, Greg KH wrote:
> On Tue, May 20, 2008 at 02:08:44PM -0700, Jesse Barnes wrote:
> > On Monday, May 19, 2008 10:31 pm Stephen Rothwell wrote:
> > > Hi Rafael, Greg,
> > >
> > > On Tue, 20 May 2008 00:39:59 +0200 "Rafael J. Wysocki" <rjw@sisk.pl> wrote:
> > > > On Monday, 19 of May 2008, Greg KH wrote:
> > > > > On Mon, May 19, 2008 at 04:25:02PM +0200, Rafael J. Wysocki wrote:
> > > > > > Please revert "PM: New suspend and hibernation callbacks for PCI bus
> > > > > > type" until we fix that up.
> > > > >
> > > > > Do you want me to drop this from my tree?
> > > >
> > > > Yes, please.  I'll send the updated patch to Jesse, if he doesn't object,
> > > > as I said in the other thread.
> > >
> > > I have reverted that patch in linux-next today.  Let me know when things
> > > change.
> > >
> > > (I reverted in the import of the quilt tree, so it appears in
> > > quilt-import.log not merge.log.)
> > 
> > Ok, I pushed the PCI PM ops patch into my linux-next tree, along with a 
> > duplicate of the new PM ops patch (which is also in Greg's tree).  This would 
> > be slightly easier if Greg used git too, since then I could just cherry pick 
> > the commit...
> 
> It still would be a mess :)
> 
> As I no longer control the PCI tree, this just got more complex.  I have
> no problem with you taking that patch in your tree, you can keep my
> signed-off-by.
> 
> Rafael, I'll be dropping the following patches from my tree:
> 	driver-core/pm-introduce-new-top-level-suspend-and-hibernation-callbacks.patch
> 	driver-core/pm-new-suspend-and-hibernation-callbacks-for-platform-bus-type.patch
> 	driver-core/pm-new-suspend-and-hibernation-callbacks-for-pci-bus-type.patch
> 
> I'm guessing you want Jesse to also pick up the platform-bus one as
> well, so that does not get lost.

Yes.  The patch is appended.

> Is that ok?

OK by me.

Thanks,
Rafael

---
From: Rafael J. Wysocki <rjw@sisk.pl>

Implement new suspend and hibernation callbacks for the platform bus
type.

Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>
Acked-by: Pavel Machek <pavel@ucw.cz>
Acked-by: Jesse Barnes <jbarnes@virtuousgeek.org>
---
 drivers/base/platform.c         |  296 ++++++++++++++++++++++++++++++++++++++--
 include/linux/platform_device.h |    1 
 2 files changed, 289 insertions(+), 8 deletions(-)

Index: linux-2.6/include/linux/platform_device.h
===================================================================
--- linux-2.6.orig/include/linux/platform_device.h
+++ linux-2.6/include/linux/platform_device.h
@@ -53,6 +53,7 @@ struct platform_driver {
 	int (*suspend_late)(struct platform_device *, pm_message_t state);
 	int (*resume_early)(struct platform_device *);
 	int (*resume)(struct platform_device *);
+	struct pm_ext_ops *pm;
 	struct device_driver driver;
 };
 
Index: linux-2.6/drivers/base/platform.c
===================================================================
--- linux-2.6.orig/drivers/base/platform.c
+++ linux-2.6/drivers/base/platform.c
@@ -453,6 +453,8 @@ int platform_driver_register(struct plat
 		drv->driver.suspend = platform_drv_suspend;
 	if (drv->resume)
 		drv->driver.resume = platform_drv_resume;
+	if (drv->pm)
+		drv->driver.pm = &drv->pm->base;
 	return driver_register(&drv->driver);
 }
 EXPORT_SYMBOL_GPL(platform_driver_register);
@@ -560,7 +562,9 @@ static int platform_match(struct device 
 	return (strncmp(pdev->name, drv->name, BUS_ID_SIZE) == 0);
 }
 
-static int platform_suspend(struct device *dev, pm_message_t mesg)
+#ifdef CONFIG_PM_SLEEP
+
+static int platform_legacy_suspend(struct device *dev, pm_message_t mesg)
 {
 	int ret = 0;
 
@@ -570,7 +574,7 @@ static int platform_suspend(struct devic
 	return ret;
 }
 
-static int platform_suspend_late(struct device *dev, pm_message_t mesg)
+static int platform_legacy_suspend_late(struct device *dev, pm_message_t mesg)
 {
 	struct platform_driver *drv = to_platform_driver(dev->driver);
 	struct platform_device *pdev;
@@ -583,7 +587,7 @@ static int platform_suspend_late(struct 
 	return ret;
 }
 
-static int platform_resume_early(struct device *dev)
+static int platform_legacy_resume_early(struct device *dev)
 {
 	struct platform_driver *drv = to_platform_driver(dev->driver);
 	struct platform_device *pdev;
@@ -596,7 +600,7 @@ static int platform_resume_early(struct 
 	return ret;
 }
 
-static int platform_resume(struct device *dev)
+static int platform_legacy_resume(struct device *dev)
 {
 	int ret = 0;
 
@@ -606,15 +610,291 @@ static int platform_resume(struct device
 	return ret;
 }
 
+static int platform_pm_prepare(struct device *dev)
+{
+	struct device_driver *drv = dev->driver;
+	int ret = 0;
+
+	if (drv && drv->pm && drv->pm->prepare)
+		ret = drv->pm->prepare(dev);
+
+	return ret;
+}
+
+static void platform_pm_complete(struct device *dev)
+{
+	struct device_driver *drv = dev->driver;
+
+	if (drv && drv->pm && drv->pm->complete)
+		drv->pm->complete(dev);
+}
+
+#ifdef CONFIG_SUSPEND
+
+static int platform_pm_suspend(struct device *dev)
+{
+	struct device_driver *drv = dev->driver;
+	int ret = 0;
+
+	if (drv && drv->pm) {
+		if (drv->pm->suspend)
+			ret = drv->pm->suspend(dev);
+	} else {
+		ret = platform_legacy_suspend(dev, PMSG_SUSPEND);
+	}
+
+	return ret;
+}
+
+static int platform_pm_suspend_noirq(struct device *dev)
+{
+	struct platform_driver *pdrv;
+	int ret = 0;
+
+	if (!dev->driver)
+		return 0;
+
+	pdrv = to_platform_driver(dev->driver);
+	if (pdrv->pm) {
+		if (pdrv->pm->suspend_noirq)
+			ret = pdrv->pm->suspend_noirq(dev);
+	} else {
+		ret = platform_legacy_suspend_late(dev, PMSG_SUSPEND);
+	}
+
+	return ret;
+}
+
+static int platform_pm_resume(struct device *dev)
+{
+	struct device_driver *drv = dev->driver;
+	int ret = 0;
+
+	if (drv && drv->pm) {
+		if (drv->pm->resume)
+			ret = drv->pm->resume(dev);
+	} else {
+		ret = platform_legacy_resume(dev);
+	}
+
+	return ret;
+}
+
+static int platform_pm_resume_noirq(struct device *dev)
+{
+	struct platform_driver *pdrv;
+	int ret = 0;
+
+	if (!dev->driver)
+		return 0;
+
+	pdrv = to_platform_driver(dev->driver);
+	if (pdrv->pm) {
+		if (pdrv->pm->resume_noirq)
+			ret = pdrv->pm->resume_noirq(dev);
+	} else {
+		ret = platform_legacy_resume_early(dev);
+	}
+
+	return ret;
+}
+
+#else /* !CONFIG_SUSPEND */
+
+#define platform_pm_suspend		NULL
+#define platform_pm_resume		NULL
+#define platform_pm_suspend_noirq	NULL
+#define platform_pm_resume_noirq	NULL
+
+#endif /* !CONFIG_SUSPEND */
+
+#ifdef CONFIG_HIBERNATION
+
+static int platform_pm_freeze(struct device *dev)
+{
+	struct device_driver *drv = dev->driver;
+	int ret = 0;
+
+	if (!drv)
+		return 0;
+
+	if (drv->pm) {
+		if (drv->pm->freeze)
+			ret = drv->pm->freeze(dev);
+	} else {
+		ret = platform_legacy_suspend(dev, PMSG_FREEZE);
+	}
+
+	return ret;
+}
+
+static int platform_pm_freeze_noirq(struct device *dev)
+{
+	struct platform_driver *pdrv;
+	int ret = 0;
+
+	if (!dev->driver)
+		return 0;
+
+	pdrv = to_platform_driver(dev->driver);
+	if (pdrv->pm) {
+		if (pdrv->pm->freeze_noirq)
+			ret = pdrv->pm->freeze_noirq(dev);
+	} else {
+		ret = platform_legacy_suspend_late(dev, PMSG_FREEZE);
+	}
+
+	return ret;
+}
+
+static int platform_pm_thaw(struct device *dev)
+{
+	struct device_driver *drv = dev->driver;
+	int ret = 0;
+
+	if (drv && drv->pm) {
+		if (drv->pm->thaw)
+			ret = drv->pm->thaw(dev);
+	} else {
+		ret = platform_legacy_resume(dev);
+	}
+
+	return ret;
+}
+
+static int platform_pm_thaw_noirq(struct device *dev)
+{
+	struct platform_driver *pdrv;
+	int ret = 0;
+
+	if (!dev->driver)
+		return 0;
+
+	pdrv = to_platform_driver(dev->driver);
+	if (pdrv->pm) {
+		if (pdrv->pm->thaw_noirq)
+			ret = pdrv->pm->thaw_noirq(dev);
+	} else {
+		ret = platform_legacy_resume_early(dev);
+	}
+
+	return ret;
+}
+
+static int platform_pm_poweroff(struct device *dev)
+{
+	struct device_driver *drv = dev->driver;
+	int ret = 0;
+
+	if (drv && drv->pm) {
+		if (drv->pm->poweroff)
+			ret = drv->pm->poweroff(dev);
+	} else {
+		ret = platform_legacy_suspend(dev, PMSG_HIBERNATE);
+	}
+
+	return ret;
+}
+
+static int platform_pm_poweroff_noirq(struct device *dev)
+{
+	struct platform_driver *pdrv;
+	int ret = 0;
+
+	if (!dev->driver)
+		return 0;
+
+	pdrv = to_platform_driver(dev->driver);
+	if (pdrv->pm) {
+		if (pdrv->pm->poweroff_noirq)
+			ret = pdrv->pm->poweroff_noirq(dev);
+	} else {
+		ret = platform_legacy_suspend_late(dev, PMSG_HIBERNATE);
+	}
+
+	return ret;
+}
+
+static int platform_pm_restore(struct device *dev)
+{
+	struct device_driver *drv = dev->driver;
+	int ret = 0;
+
+	if (drv && drv->pm) {
+		if (drv->pm->restore)
+			ret = drv->pm->restore(dev);
+	} else {
+		ret = platform_legacy_resume(dev);
+	}
+
+	return ret;
+}
+
+static int platform_pm_restore_noirq(struct device *dev)
+{
+	struct platform_driver *pdrv;
+	int ret = 0;
+
+	if (!dev->driver)
+		return 0;
+
+	pdrv = to_platform_driver(dev->driver);
+	if (pdrv->pm) {
+		if (pdrv->pm->restore_noirq)
+			ret = pdrv->pm->restore_noirq(dev);
+	} else {
+		ret = platform_legacy_resume_early(dev);
+	}
+
+	return ret;
+}
+
+#else /* !CONFIG_HIBERNATION */
+
+#define platform_pm_freeze		NULL
+#define platform_pm_thaw		NULL
+#define platform_pm_poweroff		NULL
+#define platform_pm_restore		NULL
+#define platform_pm_freeze_noirq	NULL
+#define platform_pm_thaw_noirq		NULL
+#define platform_pm_poweroff_noirq	NULL
+#define platform_pm_restore_noirq	NULL
+
+#endif /* !CONFIG_HIBERNATION */
+
+struct pm_ext_ops platform_pm_ops = {
+	.base = {
+		.prepare = platform_pm_prepare,
+		.complete = platform_pm_complete,
+		.suspend = platform_pm_suspend,
+		.resume = platform_pm_resume,
+		.freeze = platform_pm_freeze,
+		.thaw = platform_pm_thaw,
+		.poweroff = platform_pm_poweroff,
+		.restore = platform_pm_restore,
+	},
+	.suspend_noirq = platform_pm_suspend_noirq,
+	.resume_noirq = platform_pm_resume_noirq,
+	.freeze_noirq = platform_pm_freeze_noirq,
+	.thaw_noirq = platform_pm_thaw_noirq,
+	.poweroff_noirq = platform_pm_poweroff_noirq,
+	.restore_noirq = platform_pm_restore_noirq,
+};
+
+#define PLATFORM_PM_OPS_PTR	&platform_pm_ops
+
+#else /* !CONFIG_PM_SLEEP */
+
+#define PLATFORM_PM_OPS_PTR	NULL
+
+#endif /* !CONFIG_PM_SLEEP */
+
 struct bus_type platform_bus_type = {
 	.name		= "platform",
 	.dev_attrs	= platform_dev_attrs,
 	.match		= platform_match,
 	.uevent		= platform_uevent,
-	.suspend	= platform_suspend,
-	.suspend_late	= platform_suspend_late,
-	.resume_early	= platform_resume_early,
-	.resume		= platform_resume,
+	.pm		= PLATFORM_PM_OPS_PTR,
 };
 EXPORT_SYMBOL_GPL(platform_bus_type);
 
