From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: origin tree build failure
Date: Tue, 12 Jan 2010 12:14:34 +1100
Message-ID: <20100112121434.49930eea.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46765 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752896Ab0ALBOg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Jan 2010 20:14:36 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Albin Tonnerre <albin.tonnerre@free-electrons.com>

Hi all,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

lib/decompress_unlzo.c:53: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'parse_header'
lib/decompress_unlzo.c:90: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'unlzo'

Caused by commit 7dd65feb6c603e13eba501c34c662259ab38e70e ("lib: add
support for LZO-compressed kernels") and commit
cacb246f8db2b9eba89d44a0f0dd4f6ed93bc113 ("Add LZO compression support
for initramfs and old-style initrd").

I can't figure out how that was supposed to build, so I added the
following patch (which is most likely not correct).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 12 Jan 2010 11:50:16 +1100
Subject: [PATCH] lib: fixup for unlzo build

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 lib/decompress_unlzo.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/lib/decompress_unlzo.c b/lib/decompress_unlzo.c
index db521f4..b4d423f 100644
--- a/lib/decompress_unlzo.c
+++ b/lib/decompress_unlzo.c
@@ -50,6 +50,10 @@ static const unsigned char lzop_magic[] = {
 #define LZO_BLOCK_SIZE        (256*1024l)
 #define HEADER_HAS_FILTER      0x00000800L
 
+#ifndef INIT
+#define INIT
+#endif
+
 STATIC inline int INIT parse_header(u8 *input, u8 *skip)
 {
 	int l;
-- 
1.6.6

I then got these:

lib/decompress_unlzo.c: In function 'unlzo':
lib/decompress_unlzo.c:106: error: 'error' undeclared (first use in this function)
lib/decompress_unlzo.c:111: error: implicit declaration of function 'error'

So I just reverted commit
cacb246f8db2b9eba89d44a0f0dd4f6ed93bc113 ("Add LZO compression support
for initramfs and old-style initrd") after removing my fix above.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
