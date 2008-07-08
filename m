From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: manual merge of the net tree
Date: Tue, 8 Jul 2008 16:23:22 +0200
Message-ID: <200807081623.23564.rjw@sisk.pl>
References: <20080708142759.18b9314a.sfr@canb.auug.org.au> <20080708060358.GA6610@yamamaya.is-a-geek.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:39706 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752378AbYGHOVh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 10:21:37 -0400
In-Reply-To: <20080708060358.GA6610@yamamaya.is-a-geek.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tobias Diedrich <ranma@tdiedrich.de>, David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, Jesse Barnes <jbarnes@virtuousgeek.org>, Jeff Garzik <jgarzik@redhat.com>

On Tuesday, 8 of July 2008, Tobias Diedrich wrote:
> Stephen Rothwell wrote:
> > Today's linux-next merge of the net tree got a conflict in
> > drivers/pci/pci-acpi.c between commit
> > eb9d0fe40e313c0a74115ef456a2e43a6c8da72f ("PCI ACPI: Rework PCI handling
> > of wake-up") from the pci tree and commit
> > f5ccbcfacaae57e3312e623432a79d5f1f079cf5 ("Fix forcedeth
> > hibernate/wake-on-lan problems") from the net tree.
> > 
> > The former removed the hook that the latter is trying to use.  I have
> > used the pci version of this file for now.  There needs to be a better
> > solution and since this net commit only updates pci code, maybe the
> > solution lies there.
> 
> Assuming it's part of Rafaels "PCI wake-up" patchset, then using
> that one should be right I think. :)

Yes, the net commit should be reverted.  Please find a revert patch below,
details in the changelog.

Thanks,
Rafael

---
PCI ACPI: Remove acpi_platform_enable_wakeup

This patch removes "Fix forcedeth hibernate/wake-on-lan problems",
commit f5ccbcfacaae57e3312e623432a79d5f1f079cf5 in linux-next,
which is incorrect, because it directly manipulates the
wakeup.state.enabled flags of ACPI devices while these flags are
supposed to be used by the user space to control wake-up.  Moreover,
it affects not only the device it is supposed to fix (forcedeth), but
also every PCI device that happens to call
device_init_wakeup(dev, 1).

There are patches in the PCI tree that should fix the issue handled by this
commit.

Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>
---
 drivers/pci/pci-acpi.c |   20 --------------------
 1 file changed, 20 deletions(-)

Index: linux-next/drivers/pci/pci-acpi.c
===================================================================
--- linux-next.orig/drivers/pci/pci-acpi.c
+++ linux-next/drivers/pci/pci-acpi.c
@@ -259,25 +259,6 @@ static pci_power_t acpi_pci_choose_state
 	}
 	return PCI_POWER_ERROR;
 }
-
-static int acpi_platform_enable_wakeup(struct device *dev, int is_on)
-{
-	struct acpi_device	*adev;
-	int			status;
-
-	if (!device_can_wakeup(dev))
-		return -EINVAL;
-
-	if (is_on && !device_may_wakeup(dev))
-		return -EINVAL;
-
-	status = acpi_bus_get_device(DEVICE_ACPI_HANDLE(dev), &adev);
-	if (status < 0)
-		return status;
-
-	adev->wakeup.state.enabled = !!is_on;
-	return 0;
-}
 #endif
 
 static int acpi_pci_set_power_state(struct pci_dev *dev, pci_power_t state)
@@ -362,7 +343,6 @@ static int __init acpi_pci_init(void)
 		return 0;
 #ifdef	CONFIG_ACPI_SLEEP
 	platform_pci_choose_state = acpi_pci_choose_state;
-	platform_enable_wakeup = acpi_platform_enable_wakeup;
 #endif
 	platform_pci_set_power_state = acpi_pci_set_power_state;
 	return 0;
