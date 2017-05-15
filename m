From: Xunlei Pang <xpang@redhat.com>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Date: Mon, 15 May 2017 12:02:18 +0800
Message-ID: <5919284A.4050202@redhat.com>
References: <20170515115602.30e05989@canb.auug.org.au>
Reply-To: xlpang@redhat.com
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:50622 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750772AbdEOEAz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 15 May 2017 00:00:55 -0400
In-Reply-To: <20170515115602.30e05989@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Xunlei Pang <xlpang@redhat.com>

On 05/15/2017 at 09:56 AM, Stephen Rothwell wrote:
> Hi Andrew,
>
> After merging the akpm-current tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>
> In file included from include/asm-generic/bug.h:15:0,
>                  from arch/arm/include/asm/bug.h:59,
>                  from include/linux/bug.h:4,
>                  from include/linux/elfcore.h:5,
>                  from include/linux/crash_core.h:5,
>                  from kernel/crash_core.c:9:
> kernel/crash_core.c: In function 'vmcoreinfo_append_str':
> include/linux/kernel.h:757:16: warning: comparison of distinct pointer types lacks a cast
>   (void) (&min1 == &min2);   \
>                 ^
> include/linux/kernel.h:760:2: note: in expansion of macro '__min'
>   __min(typeof(x), typeof(y),   \
>   ^
> kernel/crash_core.c:360:6: note: in expansion of macro 'min'
>   r = min(r, VMCOREINFO_BYTES - vmcoreinfo_size);
>       ^
>
> Introduced by commit
>
>   fc7d2b44367f ("powerpc/fadump: use the correct VMCOREINFO_NOTE_SIZE for phdr")
>

Hi Stephen/Andrew,

Sorry for the trouble.

The following patch will fix it, do you want to me to send it out separately? or help merge it into
fc7d2b44367f ("powerpc/fadump: use the correct VMCOREINFO_NOTE_SIZE for phdr") directly?

Thanks,
Xunlei

===========================================

From: Xunlei Pang <xlpang@redhat.com>
Subject: [PATCH] crash: Fix build warning

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

This patch fixes it.

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
 
-    r = min(r, VMCOREINFO_BYTES - vmcoreinfo_size);
+    r = min(r, (size_t)VMCOREINFO_BYTES - vmcoreinfo_size);
 
     memcpy(&vmcoreinfo_data[vmcoreinfo_size], buf, r);
 
-- 
1.8.3.1
