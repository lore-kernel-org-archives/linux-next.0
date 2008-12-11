From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree
Date: Thu, 11 Dec 2008 11:53:11 +1100
Message-ID: <20081211115311.0337ffe9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58278 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755560AbYLKAxR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Dec 2008 19:53:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Greg KH <greg@kroah.com>, Roel Kluin <roel.kluin@gmail.com>

Hi Jesse,

Today's linux-next merge of the pci tree got a conflict in
drivers/pci/pci-driver.c between commit
fc9f864789c8a9e3ce747765f31ee8320bb66b60 ("PM: Simplify the new
suspend/hibernation framework for devices") from the driver-core tree and
commit be74163f1a84d5e5cfecda34232afceef8eb0b93 ("PCI: Make some
functions & structures static") from the pci tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/pci/pci-driver.c
index 99d867b,20c89a1..0000000
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@@ -681,15 -668,17 +695,15 @@@ static int pci_pm_restore_noirq(struct 
  
  #endif /* !CONFIG_HIBERNATION */
  
- struct dev_pm_ops pci_dev_pm_ops = {
 -static struct pm_ext_ops pci_pm_ops = {
 -	.base = {
 -		.prepare = pci_pm_prepare,
 -		.complete = pci_pm_complete,
 -		.suspend = pci_pm_suspend,
 -		.resume = pci_pm_resume,
 -		.freeze = pci_pm_freeze,
 -		.thaw = pci_pm_thaw,
 -		.poweroff = pci_pm_poweroff,
 -		.restore = pci_pm_restore,
 -	},
++static struct dev_pm_ops pci_dev_pm_ops = {
 +	.prepare = pci_pm_prepare,
 +	.complete = pci_pm_complete,
 +	.suspend = pci_pm_suspend,
 +	.resume = pci_pm_resume,
 +	.freeze = pci_pm_freeze,
 +	.thaw = pci_pm_thaw,
 +	.poweroff = pci_pm_poweroff,
 +	.restore = pci_pm_restore,
  	.suspend_noirq = pci_pm_suspend_noirq,
  	.resume_noirq = pci_pm_resume_noirq,
  	.freeze_noirq = pci_pm_freeze_noirq,
