From: Paul Mundt <lethal@linux-sh.org>
Subject: [PATCH -next] fanotify: select ANON_INODES.
Date: Tue, 24 Nov 2009 15:02:56 +0900
Message-ID: <20091124060256.GA30779@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]:48403 "EHLO
	master.linux-sh.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754472AbZKXGDn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 24 Nov 2009 01:03:43 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Paris <eparis@redhat.com>
Cc: linux-next@vger.kernel.org

fanotify references anon_inode_getfd(), which is only available with
ANON_INODES enabled. Presently this bails out with the following:

  LD      vmlinux
fs/built-in.o: In function `sys_fanotify_init':
(.text+0x26d1c): undefined reference to `anon_inode_getfd'
make: *** [vmlinux] Error 1

which is trivially corrected by adding an ANON_INODES select.

Signed-off-by: Paul Mundt <lethal@linux-sh.org>

---

 fs/notify/fanotify/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/notify/fanotify/Kconfig b/fs/notify/fanotify/Kconfig
index f9d7ae0..668e5df 100644
--- a/fs/notify/fanotify/Kconfig
+++ b/fs/notify/fanotify/Kconfig
@@ -1,6 +1,7 @@
 config FANOTIFY
 	bool "Filesystem wide access notification"
 	select FSNOTIFY
+	select ANON_INODES
 	default y
 	---help---
 	   Say Y here to enable fanotify suport.  fanotify is a file access
