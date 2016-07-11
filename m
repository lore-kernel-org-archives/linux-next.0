From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Mon, 11 Jul 2016 07:48:17 +0300
Message-ID: <20160711044817.GE14693@lahna.fi.intel.com>
References: <20160711114653.066355ae@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:4141 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750729AbcGKEs0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Jul 2016 00:48:26 -0400
Content-Disposition: inline
In-Reply-To: <20160711114653.066355ae@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Octavian Purdila <octavian.purdila@intel.com>

On Mon, Jul 11, 2016 at 11:46:53AM +1000, Stephen Rothwell wrote:
> Hi Rafael,
> 
> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> ERROR: "configfs_unregister_subsystem" [samples/configfs/configfs_sample.ko] undefined!
> ERROR: "configfs_register_subsystem" [samples/configfs/configfs_sample.ko] undefined!
> ERROR: "config_group_init" [samples/configfs/configfs_sample.ko] undefined!
> ERROR: "config_item_init_type_name" [samples/configfs/configfs_sample.ko] undefined!
> ERROR: "config_group_init_type_name" [samples/configfs/configfs_sample.ko] undefined!
> ERROR: "configfs_undepend_item" [fs/ocfs2/cluster/ocfs2_nodemanager.ko] undefined!
> ERROR: "config_item_put" [fs/ocfs2/cluster/ocfs2_nodemanager.ko] undefined!
> ERROR: "config_item_init_type_name" [fs/ocfs2/cluster/ocfs2_nodemanager.ko] undefined!
> 
> ... and many more ...
> 
> Presumably (maybe?) caused by commit
> 
>   0bf54fcd9504 ("ACPI: add support for configfs")
> 
> though it is not obvious why this should be a problem.

Looks like it is the module name (configfs.o) that confuses modpost or
linker. The below patch fixes it for me.

From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] ACPI: Rename configfs.c to acpi_configfs.c to prevent link error

If we compile ACPI configfs.c as module it will confuse the linker as it
hides symbols from the actual configfs:

Kernel: arch/x86/boot/bzImage is ready  (#1236)
  MODPOST 5739 modules
ERROR: "configfs_unregister_subsystem" [samples/configfs/configfs_sample.ko] undefined!
ERROR: "configfs_register_subsystem" [samples/configfs/configfs_sample.ko] undefined!
ERROR: "config_group_init" [samples/configfs/configfs_sample.ko] undefined!
ERROR: "config_item_init_type_name" [samples/configfs/configfs_sample.ko] undefined!
ERROR: "config_group_init_type_name" [samples/configfs/configfs_sample.ko] undefined!
ERROR: "configfs_undepend_item" [fs/ocfs2/cluster/ocfs2_nodemanager.ko] undefined!
...

Prevent these by renaming the file to acpi_configfs.c instead.

Reported-by: Scott Lawson <scott.lawson@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/acpi/Makefile                        | 2 +-
 drivers/acpi/{configfs.c => acpi_configfs.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/acpi/{configfs.c => acpi_configfs.c} (100%)

diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
index 1dc2173ad8d0..f72a83df1cf3 100644
--- a/drivers/acpi/Makefile
+++ b/drivers/acpi/Makefile
@@ -99,6 +99,6 @@ obj-$(CONFIG_ACPI_EXTLOG)	+= acpi_extlog.o
 obj-$(CONFIG_PMIC_OPREGION)	+= pmic/intel_pmic.o
 obj-$(CONFIG_CRC_PMIC_OPREGION) += pmic/intel_pmic_crc.o
 obj-$(CONFIG_XPOWER_PMIC_OPREGION) += pmic/intel_pmic_xpower.o
-obj-$(CONFIG_ACPI_CONFIGFS)	+= configfs.o
+obj-$(CONFIG_ACPI_CONFIGFS)	+= acpi_configfs.o
 
 video-objs			+= acpi_video.o video_detect.o
diff --git a/drivers/acpi/configfs.c b/drivers/acpi/acpi_configfs.c
similarity index 100%
rename from drivers/acpi/configfs.c
rename to drivers/acpi/acpi_configfs.c
-- 
2.8.1
