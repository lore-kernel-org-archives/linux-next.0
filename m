From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure
Date: Wed, 3 Sep 2008 18:45:01 +1000
Message-ID: <20080903184501.f280daf7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58041 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751687AbYICIpI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Sep 2008 04:45:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org

Hi David,

Today's linux-next build (powerpc allnoconfig) failed like this:

In file included from arch/powerpc/include/asm/statfs.h:5,
                 from include/linux/statfs.h:7,
                 from include/linux/vfs.h:5,
                 from fs/open.c:23:
include/asm-generic/statfs.h:20: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__u32'
include/asm-generic/statfs.h:36: error: two or more data types in declaration specifiers
include/asm-generic/statfs.h:36: warning: useless type name in empty declaration
include/asm-generic/statfs.h:47: error: expected specifier-qualifier-list before '__statfs_word'

and it went downhill from there.

Introduced by commit 97bea16fbd30f35637447cf0884ac0e1fe467a37 ("Make
<asm-generic/statfs.h> suitable for 64-bit platforms") from the dwmw2
tree.  I applied the following patch.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 3 Sep 2008 18:37:34 +1000
Subject: [PATCH] statfs: fix typo

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/asm-generic/statfs.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/asm-generic/statfs.h b/include/asm-generic/statfs.h
index 68b6d69..6129d68 100644
--- a/include/asm-generic/statfs.h
+++ b/include/asm-generic/statfs.h
@@ -17,7 +17,7 @@ typedef __kernel_fsid_t	fsid_t;
 #if BITS_PER_LONG == 64
 #define __statfs_word long
 #else
-typedef __statfs_word __u32
+#define __statfs_word __u32
 #endif
 #endif
 
-- 
1.5.6.5
