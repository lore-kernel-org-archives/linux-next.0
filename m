From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 31 Aug 2017 18:21:01 +1000
Message-ID: <20170831182101.0e4ad9a2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54967 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750711AbdHaIVF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 31 Aug 2017 04:21:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Martin Wilck <mwilck@suse.com>, Sagi Grimberg <sagi@grimberg.me>, Christoph Hellwig <hch@lst.de>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from /home/sfr/next/next/include/uapi/linux/uuid.h:21:0,
                 from /home/sfr/next/next/include/linux/uuid.h:19,
                 from /home/sfr/next/next/include/linux/mod_devicetable.h:12,
                 from /home/sfr/next/next/scripts/mod/devicetable-offsets.c:2:
/home/sfr/next/next/include/linux/string.h: In function 'memcpy_and_pad':
/home/sfr/next/next/include/linux/string.h:450:3: error: implicit declaration of function 'fortify_panic' [-Werror=implicit-function-declaration]
   fortify_panic(__func__);
   ^

Caused by commit

  9b04e51112ba ("fortify: use WARN instead of BUG for now")

interacting with commit

  01f33c336e2d ("string.h: add memcpy_and_pad()")

from the block tree.

I have applied the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 31 Aug 2017 18:13:43 +1000
Subject: [PATCH] fortify: use WARN instead of BUG for now fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/string.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/string.h b/include/linux/string.h
index edd2b6154b80..e3b713114732 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -447,7 +447,7 @@ __FORTIFY_INLINE void memcpy_and_pad(void *dest, size_t dest_len,
 			__read_overflow3();
 	}
 	if (dest_size < dest_len)
-		fortify_panic(__func__);
+		fortify_overflow(__func__);
 	if (dest_len > count) {
 		memcpy(dest, src, count);
 		memset(dest + count, pad,  dest_len - count);
-- 
2.13.2

-- 
Cheers,
Stephen Rothwell
