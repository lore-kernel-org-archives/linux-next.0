From: Xunlei Pang <xlpang@redhat.com>
Subject: [PATCH] crash: Fix linux-next build warning
Date: Mon, 15 May 2017 14:43:26 +0800
Message-ID: <1494830606-27736-1-git-send-email-xlpang@redhat.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:38480 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1758037AbdEOGon (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 15 May 2017 02:44:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, akpm@linux-foundation.org, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, Xunlei Pang <xlpang@redhat.com>

linux-next build (arm multi_v7_defconfig) produced this warning:

In file included from include/asm-generic/bug.h:15:0,
                 from arch/arm/include/asm/bug.h:59,
                 from include/linux/bug.h:4,
                 from include/linux/elfcore.h:5,
                 from include/linux/crash_core.h:5,
                 from kernel/crash_core.c:9:
kernel/crash_core.c: In function 'vmcoreinfo_append_str':
include/linux/kernel.h:757:16: warning: comparison of distinct pointer
types lacks a cast
  (void) (&min1 == &min2);   \
                ^
include/linux/kernel.h:760:2: note: in expansion of macro '__min'
  __min(typeof(x), typeof(y),   \
  ^
kernel/crash_core.c:360:6: note: in expansion of macro 'min'
  r = min(r, VMCOREINFO_BYTES - vmcoreinfo_size);
      ^

This patch fixes it with an explicit "size_t" type-casting on
VMCOREINFO_BYTES.

Andrew will help merge it into commit fc7d2b44367f ("powerpc/fadump:
use the correct VMCOREINFO_NOTE_SIZE for phdr") before sending it to
stable.

Signed-off-by: Xunlei Pang <xlpang@redhat.com>
---
 kernel/crash_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 4a4a4ba..6db80fc 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -357,7 +357,7 @@ void vmcoreinfo_append_str(const char *fmt, ...)
 	r = vscnprintf(buf, sizeof(buf), fmt, args);
 	va_end(args);
 
-	r = min(r, VMCOREINFO_BYTES - vmcoreinfo_size);
+	r = min(r, (size_t)VMCOREINFO_BYTES - vmcoreinfo_size);
 
 	memcpy(&vmcoreinfo_data[vmcoreinfo_size], buf, r);
 
-- 
1.8.3.1
