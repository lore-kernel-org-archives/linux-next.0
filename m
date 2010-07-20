From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] debugfs: no longer needs to depend on SYSFS
Date: Tue, 20 Jul 2010 16:04:51 -0700
Message-ID: <4C462B93.2050403@oracle.com>
References: <20100712155109.d997bf1c.sfr@canb.auug.org.au> <20100712124750.8ab5e870.randy.dunlap@oracle.com> <20100712212126.GA2684@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:55825 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932946Ab0GTXGq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 20 Jul 2010 19:06:46 -0400
In-Reply-To: <20100712212126.GA2684@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

debugfs no longer uses 'kernel_subsys' (which is gone), and other
kernel/ksysfs.c code is always built, so DEBUG_FS does not need
to depend on SYSFS.

Fixes this kconfig warning:

warning: (TREE_RCU_TRACE || AMD_IOMMU_STATS && AMD_IOMMU || MTD_UBI_DEBUG && MTD && SYSFS && MTD_UBI || UBIFS_FS_DEBUG && MISC_FILESYSTEMS && UBIFS_FS || DEBUG_KMEMLEAK && DEBUG_KERNEL && EXPERIMENTAL && !MEMORY_HOTPLUG && (X86 || ARM || PPC || S390 || SPARC64 || SUPERH || MICROBLAZE) && SYSFS || TRACING || X86_PTDUMP && DEBUG_KERNEL || BLK_DEV_IO_TRACE && TRACING_SUPPORT && FTRACE && SYSFS && BLOCK) selects DEBUG_FS which has unmet direct dependencies (SYSFS)

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 lib/Kconfig.debug |    1 -
 1 file changed, 1 deletion(-)

--- linux-next-20100713.orig/lib/Kconfig.debug
+++ linux-next-20100713/lib/Kconfig.debug
@@ -76,7 +76,6 @@ config UNUSED_SYMBOLS
 
 config DEBUG_FS
 	bool "Debug Filesystem"
-	depends on SYSFS
 	help
 	  debugfs is a virtual file system that kernel developers use to put
 	  debugging files into.  Enable this option to be able to read and
