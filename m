From: Martin Wilck <mwilck@suse.com>
Subject: [PATCH] string.h: un-fortify memcpy_and_pad
Date: Wed,  6 Sep 2017 14:36:57 +0200
Message-ID: <20170906123657.25534-1-mwilck@suse.com>
References: <20170831182101.0e4ad9a2@canb.auug.org.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170831182101.0e4ad9a2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>
Cc: Sagi Grimberg <sagi@grimberg.me>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Martin Wilck <mwilck@suse.de>
List-Id: linux-next.vger.kernel.org

The way I'd implemented the new helper memcpy_and_pad  with
__FORTIFY_INLINE caused compiler warnings for certain kernel
configurations.

This helper is only used in a single place at this time, and thus
doesn't benefit much from fortification. So simplify the code
by dropping fortification support for now.

Fixes: 01f33c336e2d "string.h: add memcpy_and_pad()"
Signed-off-by: Martin Wilck <mwilck@suse.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>

---
 include/linux/string.h | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/include/linux/string.h b/include/linux/string.h
index e1eeb0a8a9693..54d21783e18dd 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -434,20 +434,9 @@ __FORTIFY_INLINE char *strcpy(char *p, const char *q)
  * @count: The number of bytes to copy
  * @pad: Character to use for padding if space is left in destination.
  */
-__FORTIFY_INLINE void memcpy_and_pad(void *dest, size_t dest_len,
-				     const void *src, size_t count, int pad)
+static inline void memcpy_and_pad(void *dest, size_t dest_len,
+				  const void *src, size_t count, int pad)
 {
-	size_t dest_size = __builtin_object_size(dest, 0);
-	size_t src_size = __builtin_object_size(src, 0);
-
-	if (__builtin_constant_p(dest_len) && __builtin_constant_p(count)) {
-		if (dest_size < dest_len && dest_size < count)
-			__write_overflow();
-		else if (src_size < dest_len && src_size < count)
-			__read_overflow3();
-	}
-	if (dest_size < dest_len)
-		fortify_panic(__func__);
 	if (dest_len > count) {
 		memcpy(dest, src, count);
 		memset(dest + count, pad,  dest_len - count);
-- 
2.14.0
