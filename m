From: Hiroshi Shimamoto <h-shimamoto@ct.jp.nec.com>
Subject: [PATCH -next] initramfs: fix compilation warning
Date: Tue, 26 Aug 2008 16:56:58 -0700
Message-ID: <48B4984A.6090508@ct.jp.nec.com>
References: <20080826184008.6be39f19.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gateway-1237.mvista.com ([63.81.120.158]:11773 "EHLO
	gateway-1237.mvista.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751887AbYHZX53 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 26 Aug 2008 19:57:29 -0400
In-Reply-To: <20080826184008.6be39f19.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Shaohua Li <shaohua.li@intel.com>, Arjan van de Ven <arjan@linux.intel.com>, Ingo Molnar <mingo@elte.hu>

From: Hiroshi Shimamoto <h-shimamoto@ct.jp.nec.com>

  CC      init/initramfs.o
init/initramfs.c:517: warning: 'clean_rootfs' defined but not used

clean_rootfs is not used when CONFIG_BLK_DEV_RAM disabled.

Signed-off-by: Hiroshi Shimamoto <h-shimamoto@ct.jp.nec.com>
---
 init/initramfs.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index da8d030..2f056e2 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -512,6 +512,7 @@ skip:
 	initrd_end = 0;
 }
 
+#ifdef CONFIG_BLK_DEV_RAM
 #define BUF_SIZE 1024
 static void __init clean_rootfs(void)
 {
@@ -558,6 +559,7 @@ static void __init clean_rootfs(void)
 	sys_close(fd);
 	kfree(buf);
 }
+#endif
 
 static int __init populate_rootfs(void)
 {
-- 
1.5.6
