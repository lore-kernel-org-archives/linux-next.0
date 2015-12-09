From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the vfs tree
Date: Wed, 9 Dec 2015 16:58:06 +1100
Message-ID: <20151209165806.5fcd0872@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:32831 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750920AbbLIF6I (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Dec 2015 00:58:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Al,

After merging the vfs tree, today's linux-next build (i386 defconfig)
failed like this:

In file included from include/linux/poll.h:9:0,
                 from include/linux/rtc.h:56,
                 from include/linux/mc146818rtc.h:15,
                 from drivers/char/nvram.c:105:
drivers/char/nvram.c: In function 'nvram_llseek':
include/linux/fs.h:898:36: error: 'PAGE_CACHE_SIZE' undeclared (first use in this function)
 #define MAX_LFS_FILESIZE (((loff_t)PAGE_CACHE_SIZE << (BITS_PER_LONG-1))-1)
                                    ^
drivers/char/nvram.c:216:56: note: in expansion of macro 'MAX_LFS_FILESIZE'
  return generic_file_llseek_size(file, offset, origin, MAX_LFS_FILESIZE,
                                                        ^
include/linux/fs.h:898:36: note: each undeclared identifier is reported only once for each function it appears in
 #define MAX_LFS_FILESIZE (((loff_t)PAGE_CACHE_SIZE << (BITS_PER_LONG-1))-1)
                                    ^
drivers/char/nvram.c:216:56: note: in expansion of macro 'MAX_LFS_FILESIZE'
  return generic_file_llseek_size(file, offset, origin, MAX_LFS_FILESIZE,
                                                        ^
drivers/char/nvram.c:218:1: warning: control reaches end of non-void function [-Wreturn-type]   
 }
 ^

Caused by commit

  acde094daf36 ("don't open-code generic_file_llseek_size()")

I applied the following fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 9 Dec 2015 16:48:00 +1100
Subject: [PATCH] fix for "don't open-code generic_file_llseek_size()"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/char/nvram.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/char/nvram.c b/drivers/char/nvram.c
index 2157787cf11b..78a1cd690c96 100644
--- a/drivers/char/nvram.c
+++ b/drivers/char/nvram.c
@@ -39,6 +39,7 @@
 
 #include <linux/module.h>
 #include <linux/nvram.h>
+#include <linux/pagemap.h>	/* for PAGE_CACHE_SIZE */
 
 #define PC		1
 #define ATARI		2
-- 
2.6.2

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
