From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] fs: fix compat_ioctl when CONFIG_BLOCK=n
Date: Thu, 25 Feb 2010 09:55:09 -0800
Message-ID: <4B86B97D.6030208@oracle.com>
References: <20100225183523.80361261.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:43729 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933098Ab0BYRzk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 25 Feb 2010 12:55:40 -0500
In-Reply-To: <20100225183523.80361261.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Al Viro <viro@zeniv.linux.org.uk>

From: Randy Dunlap <randy.dunlap@oracle.com>

fs/compat_ioctl.c should omit pktcdvd.h and its ioctl when CONFIG_BLOCK
is not enabled.  This fixes these build errors:

In file included from fs/compat_ioctl.c:105:
include/linux/pktcdvd.h:166: error: field 'read_queue' has incomplete type
include/linux/pktcdvd.h:167: error: field 'write_queue' has incomplete type
include/linux/pktcdvd.h:207: error: field 'orig_bios' has incomplete type
make[2]: *** [fs/compat_ioctl.o] Error 1

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/compat_ioctl.c |    4 ++++
 1 file changed, 4 insertions(+)

--- linux-next-20100225.orig/fs/compat_ioctl.c
+++ linux-next-20100225/fs/compat_ioctl.c
@@ -102,7 +102,9 @@
 #include <linux/nbd.h>
 #include <linux/random.h>
 #include <linux/filter.h>
+#ifdef CONFIG_BLOCK
 #include <linux/pktcdvd.h>
+#endif
 
 #include <linux/hiddev.h>
 
@@ -1126,8 +1128,10 @@ COMPATIBLE_IOCTL(PPGETMODE)
 COMPATIBLE_IOCTL(PPGETPHASE)
 COMPATIBLE_IOCTL(PPGETFLAGS)
 COMPATIBLE_IOCTL(PPSETFLAGS)
+#ifdef CONFIG_BLOCK
 /* pktcdvd */
 COMPATIBLE_IOCTL(PACKET_CTRL_CMD)
+#endif
 /* Big A */
 /* sparc only */
 /* Big Q for sound/OSS */
