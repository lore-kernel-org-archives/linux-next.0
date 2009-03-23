From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree with the genirq tree
Date: Mon, 23 Mar 2009 11:58:34 +1100
Message-ID: <20090323115834.b7d82abc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56541 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756844AbZCWA6j (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 22 Mar 2009 20:58:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, Alex Chiang <achiang@hp.com>, Thomas Gleixner <tglx@linutronix.de>

Hi Jesse,

Today's linux-next merge of the pci tree got a conflict in
Documentation/feature-removal-schedule.txt between commits
0e57aa11abb15b70db53d1f95ae70b3c980ac885 ("genirq: deprecate __do_IRQ")
and cb065c06b6cc615a58860d619d7fa7952cd6a18b ("genirq: deprecate obsolete
typedefs and defines") from the genirq tree and commit
f110ca489c9b7cf3f6c9656e383e787f3aee217f ("PCI Hotplug: schedule fakephp
for feature removal") from the pci tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc Documentation/feature-removal-schedule.txt
index 9aa1dda,8851eea..0000000
--- a/Documentation/feature-removal-schedule.txt
+++ b/Documentation/feature-removal-schedule.txt
@@@ -345,19 -346,34 +346,51 @@@ Why:	See commits 129f8ae9b1b5be94517da7
  	cause the thermal throttling not to happen at the right time.
  Who:	Dave Jones <davej@redhat.com>, Matthew Garrett <mjg@redhat.com>
  
 +-----------------------------
 +
 +What:	__do_IRQ all in one fits nothing interrupt handler
 +When:	2.6.32
 +Why:	__do_IRQ was kept for easy migration to the type flow handlers.
 +	More than two years of migration time is enough.
 +Who:	Thomas Gleixner <tglx@linutronix.de>
 +
 +-----------------------------
 +
 +What:	obsolete generic irq defines and typedefs
 +When:	2.6.30
 +Why:	The defines and typedefs (hw_interrupt_type, no_irq_type, irq_desc_t)
 +	have been kept around for migration reasons. After more than two years
 +	it's time to remove them finally
 +Who:	Thomas Gleixner <tglx@linutronix.de>
++
+ ---------------------------
+ 
+ What:	fakephp and associated sysfs files in /sys/bus/pci/slots/
+ When:	2011
+ Why:	In 2.6.27, the semantics of /sys/bus/pci/slots was redefined to
+ 	represent a machine's physical PCI slots. The change in semantics
+ 	had userspace implications, as the hotplug core no longer allowed
+ 	drivers to create multiple sysfs files per physical slot (required
+ 	for multi-function devices, e.g.). fakephp was seen as a developer's
+ 	tool only, and its interface changed. Too late, we learned that
+ 	there were some users of the fakephp interface.
+ 
+ 	In 2.6.30, the original fakephp interface was restored. At the same
+ 	time, the PCI core gained the ability that fakephp provided, namely
+ 	function-level hot-remove and hot-add.
+ 
+ 	Since the PCI core now provides the same functionality, exposed in:
+ 
+ 		/sys/bus/pci/rescan
+ 		/sys/bus/pci/devices/.../remove
+ 		/sys/bus/pci/devices/.../rescan
+ 
+ 	there is no functional reason to maintain fakephp as well.
+ 
+ 	We will keep the existing module so that 'modprobe fakephp' will
+ 	present the old /sys/bus/pci/slots/... interface for compatibility,
+ 	but users are urged to migrate their applications to the API above.
+ 
+ 	After a reasonable transition period, we will remove the legacy
+ 	fakephp interface.
+ Who:	Alex Chiang <achiang@hp.com>
