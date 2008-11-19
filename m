From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the s390 tree
Date: Thu, 20 Nov 2008 10:13:09 +1100
Message-ID: <20081120101309.0553d091.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57683 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751712AbYKSXNZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Nov 2008 18:13:25 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>, Paul Mackerras <paulus@samba.org>, Hendrik Brueckner <brueckner@linux.vnet.ibm.com>

Hi Martin,

Today's linux-next merge of the s390 tree got a conflict in
drivers/char/Kconfig drivers/char/Makefile between commit
d5e54913433fff89609adfc4b96fefcf807a9030 ("powerpc: udbg-based backend
for hvc_console") from the powerpc tree and commit
c7f224c72b6973056497af6bb69efce6d5a19e86 ("[S390] s390/hvc_console: z/VM
IUCV hypervisor console support") from the s390 tree.

Just overlapping additions. I fixed it up (see below) and can carry the
fix.  The conflict could be eliminated by one of the two sets of changes
moving slightly in the files (I am hinting about the s390 ones here as
Paul does not like rebasing his tree ...).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/char/Kconfig
index f57907a,755adf7..0000000
--- a/drivers/char/Kconfig
+++ b/drivers/char/Kconfig
@@@ -631,12 -631,16 +631,22 @@@ config HVC_XE
  	help
  	  Xen virtual console device driver
  
 +config HVC_UDBG
 +       bool "udbg based fake hypervisor console"
 +       depends on PPC && EXPERIMENTAL
 +       select HVC_DRIVER
 +       default n
 +
+ config HVC_IUCV
+ 	bool "z/VM IUCV Hypervisor console support (VM only)"
+ 	depends on S390
+ 	select HVC_DRIVER
+ 	select IUCV
+ 	default y
+ 	help
+ 	  This driver provides a Hypervisor console (HVC) back-end to access
+ 	  a Linux (console) terminal via a z/VM IUCV communication path.
+ 
  config VIRTIO_CONSOLE
  	tristate "Virtio console"
  	depends on VIRTIO
diff --cc drivers/char/Makefile
index 52e1552,36151ba..0000000
--- a/drivers/char/Makefile
+++ b/drivers/char/Makefile
@@@ -50,7 -50,7 +50,8 @@@ obj-$(CONFIG_HVC_BEAT)		+= hvc_beat.
  obj-$(CONFIG_HVC_DRIVER)	+= hvc_console.o
  obj-$(CONFIG_HVC_IRQ)		+= hvc_irq.o
  obj-$(CONFIG_HVC_XEN)		+= hvc_xen.o
 +obj-$(CONFIG_HVC_UDBG)		+= hvc_udbg.o
+ obj-$(CONFIG_HVC_IUCV)		+= hvc_iucv.o
  obj-$(CONFIG_VIRTIO_CONSOLE)	+= virtio_console.o
  obj-$(CONFIG_RAW_DRIVER)	+= raw.o
  obj-$(CONFIG_SGI_SNSC)		+= snsc.o snsc_event.o
