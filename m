From: Russ Anderson <rja@sgi.com>
Subject: [patch bugfix (take 2)] x86: prevent /sys/firmware/sgi_uv from being created on non-uv systems
Date: Fri, 3 Apr 2009 17:24:23 -0500
Message-ID: <20090403222423.GA28546@sgi.com>
Reply-To: Russ Anderson <rja@sgi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay2.sgi.com ([192.48.179.30]:60641 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752969AbZDCWY0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 3 Apr 2009 18:24:26 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>
Cc: Russ Anderson <rja@sgi.com>

/sys/firmware/sgi_uv should only be created on uv systems.

Signed-off-by: Russ Anderson <rja@sgi.com>

---
The previous patch was an old version.  


 arch/x86/kernel/uv_sysfs.c |    4 ++++
 1 file changed, 4 insertions(+)

Index: linux/arch/x86/kernel/uv_sysfs.c
===================================================================
--- linux.orig/arch/x86/kernel/uv_sysfs.c	2009-04-03 17:16:57.000000000 -0500
+++ linux/arch/x86/kernel/uv_sysfs.c	2009-04-03 17:17:25.000000000 -0500
@@ -21,6 +21,7 @@
 
 #include <linux/sysdev.h>
 #include <asm/uv/bios.h>
+#include <asm/uv/uv.h>
 
 struct kobject *sgi_uv_kobj;
 
@@ -46,6 +47,9 @@ static struct kobj_attribute coherence_i
 static int __init sgi_uv_sysfs_init(void)
 {
 	unsigned long ret;
+
+	if (!is_uv_system())
+		return -ENODEV;
 
 	if (!sgi_uv_kobj)
 		sgi_uv_kobj = kobject_create_and_add("sgi_uv", firmware_kobj);
-- 
Russ Anderson, OS RAS/Partitioning Project Lead  
SGI - Silicon Graphics Inc          rja@sgi.com
