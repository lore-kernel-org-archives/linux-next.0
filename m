From: William Hubbs <w.d.hubbs@gmail.com>
Subject: [PATCH] init: fix name of root device in /proc/mounts
Date: Tue,  5 Feb 2013 14:07:47 -0600
Message-ID: <1360094867-28009-1-git-send-email-w.d.hubbs@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:53925 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755204Ab3BEUIE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Feb 2013 15:08:04 -0500
Received: by mail-ob0-f170.google.com with SMTP id wc20so630617obb.29
        for <linux-next@vger.kernel.org>; Tue, 05 Feb 2013 12:08:03 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: mpagano@gentoo.org, William Hubbs <w.d.hubbs@gmail.com>

On a system that does not use an initramfs, /dev/root is always
listed in /proc/mounts. This breaks software which scans /proc/mounts to
determine which file systems are mounted since /dev/root is not a valid
device name.

This changes that processing so that "/dev/root" is only added to
/proc/mounts if a root device is not specified with the root= option on
the kernel command line.

Signed-off-by: William Hubbs <w.d.hubbs@gmail.com>
---
 init/do_mounts.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index 1d1b634..efc37d2 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -480,7 +480,10 @@ void __init change_floppy(char *fmt, ...)
 	va_start(args, fmt);
 	vsprintf(buf, fmt, args);
 	va_end(args);
-	fd = sys_open("/dev/root", O_RDWR | O_NDELAY, 0);
+	if (saved_root_name[0])
+		fd = sys_open(saved_root_name, O_RDWR | O_NDELAY, 0);
+	else
+		fd = sys_open("/dev/root", O_RDWR | O_NDELAY, 0);
 	if (fd >= 0) {
 		sys_ioctl(fd, FDEJECT, 0);
 		sys_close(fd);
@@ -523,8 +526,13 @@ void __init mount_root(void)
 	}
 #endif
 #ifdef CONFIG_BLOCK
-	create_dev("/dev/root", ROOT_DEV);
-	mount_block_root("/dev/root", root_mountflags);
+	if (saved_root_name[0]) {
+		create_dev(saved_root_name, ROOT_DEV);
+		mount_block_root(saved_root_name, root_mountflags);
+	} else {
+		create_dev("/dev/root", ROOT_DEV);
+		mount_block_root("/dev/root", root_mountflags);
+	}
 #endif
 }
 
-- 
1.7.12.4
