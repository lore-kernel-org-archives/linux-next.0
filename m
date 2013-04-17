From: Li Zhong <zhong@linux.vnet.ibm.com>
Subject: [RFC PATCH linux-next] pci: fix kernel BUG at drivers/pci/bus.c:213
Date: Wed, 17 Apr 2013 17:14:47 +0800
Message-ID: <1366190087.12424.55.camel@ThinkPad-T5421.cn.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp08.in.ibm.com ([122.248.162.8]:51153 "EHLO
	e28smtp08.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965887Ab3DQJPA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Apr 2013 05:15:00 -0400
Received: from /spool/local
	by e28smtp08.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <zhong@linux.vnet.ibm.com>;
	Wed, 17 Apr 2013 14:39:09 +0530
Received: from d28relay05.in.ibm.com (d28relay05.in.ibm.com [9.184.220.62])
	by d28dlp03.in.ibm.com (Postfix) with ESMTP id 960B81258059
	for <linux-next@vger.kernel.org>; Wed, 17 Apr 2013 14:46:22 +0530 (IST)
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay05.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id r3H9EmFX62128342
	for <linux-next@vger.kernel.org>; Wed, 17 Apr 2013 14:44:48 +0530
Received: from d28av05.in.ibm.com (loopback [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id r3H9EogV014085
	for <linux-next@vger.kernel.org>; Wed, 17 Apr 2013 19:14:51 +1000
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: bhelgaas@google.com
Cc: linux-next list <linux-next@vger.kernel.org>

When running 3.9.0-rc7-next-20130416, the issue below prevents my
machine from booting: 
[    0.409057] ------------[ cut here ]------------
[    0.409868] kernel BUG at drivers/pci/bus.c:213!
[    0.410000] invalid opcode: 0000 [#1] PREEMPT SMP 
[    0.410000] Modules linked in:
[    0.410000] CPU 0 
[    0.410000] Pid: 1, comm: swapper/0 Not tainted 3.9.0-rc7-next-20130416 #1 Bochs Bochs
[    0.410000] RIP: 0010:[<ffffffff812f9232>]  [<ffffffff812f9232>] pci_bus_add_devices+0xa2/0xb0
[    0.410000] RSP: 0000:ffff88007c84bc78  EFLAGS: 00010246
[    0.410000] RAX: 000000000000002b RBX: ffff88007be9a000 RCX: 0000000000000006
[    0.410000] RDX: 0000000000000c00 RSI: ffff88007bcc0750 RDI: ffff88007bcc0000
[    0.410000] RBP: ffff88007c84bc98 R08: 0000000000000000 R09: 0000000000000001
[    0.410000] R10: 0000000000000000 R11: 0000000000000000 R12: ffff88007bf3a828
[    0.410000] R13: ffff88007bf3a800 R14: ffff88007beba080 R15: ffff88007c83a1e0
[    0.410000] FS:  0000000000000000(0000) GS:ffff88007ce00000(0000) knlGS:0000000000000000
[    0.410000] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
[    0.410000] CR2: ffff88000275a000 CR3: 0000000001a0b000 CR4: 00000000000006b0
[    0.410000] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    0.410000] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
[    0.410000] Process swapper/0 (pid: 1, threadinfo ffff88007c84a000, task ffff88007bcc0000)
[    0.410000] Stack:
[    0.410000]  ffff88007beba000 ffff88007be89600 ffff88007beba000 0000000000000008
[    0.410000]  ffff88007c84bcd8 ffffffff81319663 0000000000000000 ffffffff813155bf
[    0.410000]  ffff88007c804c20 ffff88007beba000 ffffffff81a87920 0000000000000000
[    0.410000] Call Trace:
[    0.410000]  [<ffffffff81319663>] acpi_pci_root_add+0x29d/0x302
[    0.410000]  [<ffffffff813155bf>] ? acpi_scan_match_handler+0x2f/0x71
[    0.410000]  [<ffffffff81315672>] acpi_bus_device_attach+0x71/0xc8
[    0.410000]  [<ffffffff8132ead1>] acpi_ns_walk_namespace+0xbe/0x179
[    0.410000]  [<ffffffff81315601>] ? acpi_scan_match_handler+0x71/0x71
[    0.410000]  [<ffffffff81315601>] ? acpi_scan_match_handler+0x71/0x71
[    0.410000]  [<ffffffff8132ef91>] acpi_walk_namespace+0x98/0xcb
[    0.410000]  [<ffffffff81cdb23d>] ? acpi_sleep_proc_init+0x2a/0x2a
[    0.410000]  [<ffffffff81316356>] acpi_bus_scan+0x8b/0x9f
[    0.410000]  [<ffffffff81cdb669>] acpi_scan_init+0x57/0x14b

It seems caused by commit cc8f7f9e4e79a0940af6b4b6fdfbcf18a03aa9f4. 
It caused the device not to be added before sysfs_initialized is set. 

For the devices added earlier, pci_create_sysfs_dev_files() is called in
late_initcall pci_sysfs_init().

The fix below ignores the error retval, if sysfs_initialized is not set.

I'm not sure whether I missed something. 

--
diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
index 445a99d..efebb6f 100644
--- a/drivers/pci/bus.c
+++ b/drivers/pci/bus.c
@@ -175,7 +175,7 @@ int pci_bus_add_device(struct pci_dev *dev)
 	 * are not assigned yet for some devices.
 	 */
 	retval = pci_create_sysfs_dev_files(dev);
-	if (retval)
+	if (retval < 0 && is_sysfs_initialized())
 		return retval;
 
 	dev->match_driver = true;
diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index b189c716..26827c5 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -1426,6 +1426,11 @@ void pci_remove_sysfs_dev_files(struct pci_dev *pdev)
 
 }
 
+int is_sysfs_initialized()
+{
+	return sysfs_initialized;
+}
+
 static int __init pci_sysfs_init(void)
 {
 	struct pci_dev *pdev = NULL;
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 0f1b306..149b946 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -8,6 +8,7 @@
 
 /* Functions internal to the PCI core code */
 
+int is_sysfs_initialized(void);
 int __must_check pci_create_sysfs_dev_files(struct pci_dev *pdev);
 void pci_remove_sysfs_dev_files(struct pci_dev *pdev);
 #if !defined(CONFIG_DMI) && !defined(CONFIG_ACPI)
