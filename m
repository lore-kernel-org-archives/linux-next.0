From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure in Linus' tree
Date: Sun, 27 Mar 2016 17:06:18 +1100
Message-ID: <20160327170618.7713e43c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38304 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752080AbcC0GGW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 27 Mar 2016 02:06:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

Hi all,

After merging the fixes tree, today's linux-next build (perf powerpcle)
failed like this:

arch/powerpc/util/header.c:17:1: error: no previous prototype for 'get_cpuid' [-Werror=missing-prototypes]
 get_cpuid(char *buffer, size_t sz)
 ^
arch/powerpc/util/header.c: In function 'get_cpuid':
arch/powerpc/util/header.c:24:7: error: implicit declaration of function 'scnprintf' [-Werror=implicit-function-declaration]
  nb = scnprintf(buffer, sz, "%lu,%lu$", PVR_VER(pvr), PVR_REV(pvr));
       ^
arch/powerpc/util/header.c:24:2: error: nested extern declaration of 'scnprintf' [-Werror=nested-externs]
  nb = scnprintf(buffer, sz, "%lu,%lu$", PVR_VER(pvr), PVR_REV(pvr));
  ^

Caused by commit

  531d2410635c ("perf tools: Do not include stringify.h from the kernel sources")

I added the following fix patch for for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Sun, 27 Mar 2016 14:44:26 +1100
Subject: [PATCH] perf tools: we stil need header.h for various things

Fixes:  531d2410635c ("perf tools: Do not include stringify.h from the kernel sources")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 tools/perf/arch/powerpc/util/header.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/arch/powerpc/util/header.c b/tools/perf/arch/powerpc/util/header.c
index 6138bdef6e63..8a0191a11f87 100644
--- a/tools/perf/arch/powerpc/util/header.c
+++ b/tools/perf/arch/powerpc/util/header.c
@@ -5,6 +5,8 @@
 #include <string.h>
 #include <linux/stringify.h>
 
+#include "../../util/header.h"
+
 #define mfspr(rn)       ({unsigned long rval; \
 			 asm volatile("mfspr %0," __stringify(rn) \
 				      : "=r" (rval)); rval; })
-- 
2.7.0

-- 
Cheers,
Stephen Rothwell
