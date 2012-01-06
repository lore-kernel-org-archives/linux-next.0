From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] fs: fix fs/fs-writeback.c build error
Date: Thu, 05 Jan 2012 16:18:30 -0800
Message-ID: <4F063DD6.5050403@xenotime.net>
References: <20120105191218.42825638a431bc1aba4879de@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy1-pub.bluehost.com ([66.147.249.253]:40236 "HELO
	oproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751289Ab2AFWGL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Jan 2012 17:06:11 -0500
In-Reply-To: <20120105191218.42825638a431bc1aba4879de@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, Al Viro <viro@ZenIV.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>

From: Randy Dunlap <rdunlap@xenotime.net>

In linux-next, fs/fs-writeback.c no longer #includes <linux/buffer_head.h>,
which #included <linux/pagemap.h>, so add that latter header file to
<linux/writeback.h> to fix the build error:

fs/fs-writeback.c:510:11: error: 'PAGE_CACHE_SHIFT' undeclared (first use in this function)

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
 include/linux/writeback.h |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20120105.orig/include/linux/writeback.h
+++ linux-next-20120105/include/linux/writeback.h
@@ -6,6 +6,7 @@
 
 #include <linux/sched.h>
 #include <linux/fs.h>
+#include <linux/pagemap.h>
 
 DECLARE_PER_CPU(int, dirty_throttle_leaks);
 
