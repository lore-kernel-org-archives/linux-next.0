From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ftrace tree build failure
Date: Fri, 2 Jan 2009 20:07:54 +1100
Message-ID: <20090102200754.3cd3661c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45928 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757534AbZABJH5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 2 Jan 2009 04:07:57 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org

Hi Ingo,

Today's linux-next build (sparc defconfig) failed like this:

mm/slab.c:105:31: error: tracing/kmemtrace.h: No such file or directory

Caused by commit 3fd4bc015ef879a7d2b955ce97fb125e3a51ba7e
("tracing/kmemtrace: export kmemtrace_mark_alloc_node() /
kmemtrace_mark_free()") from the ftrace tree.

For a "build fix", this didn't :-)

I didn't revert the ftrace tree today, but added the patch below.  A bit
more care, please.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 2 Jan 2009 19:25:21 +1100
Subject: [PATCH] tracing/kmemtrace: fix for build fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/slab.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/mm/slab.c b/mm/slab.c
index 7241a19..ae76de2 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -102,7 +102,7 @@
 #include	<linux/cpu.h>
 #include	<linux/sysctl.h>
 #include	<linux/module.h>
-#include	<tracing/kmemtrace.h>
+#include	<trace/kmemtrace.h>
 #include	<linux/rcupdate.h>
 #include	<linux/string.h>
 #include	<linux/uaccess.h>
-- 
1.6.0.5
