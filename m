From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH] tracing/mm: Move include of trace/events/kmem.h out of
 header into slab.c
Date: Mon, 09 Jan 2012 17:15:42 -0500
Message-ID: <1326147342.7642.41.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, Kay Sievers <kay.sievers@vrfy.org>, Andrew Morton <akpm@linux-foundation.org>, Frederic Weisbecker <fweisbec@gmail.com>, Ingo Molnar <mingo@redhat.com>, linux-next@vger.kernel.org, David Miller <davem@davemloft.net>, Linus <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

Including trace/events/*.h TRACE_EVENT() macro headers in other headers
can cause strange side effects if another trace/event/*.h header
includes that header. Having trace/events/kmem.h inside slab_def.h
caused a compile error in sparc64 when changes were done to some header
files. Moving the kmem.h trace header out of slab.h and into slab.c
fixes the problem.

Note, both slub.c and slob.c already include the trace/events/kmem.h
file. Only slab.c had it missing.

Link: http://lkml.kernel.org/r/20120105190405.1e3191fb5a43b2a0f1655e1f@canb.auug.org.au

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>

diff --git a/include/linux/slab_def.h b/include/linux/slab_def.h
index d00e0ba..fbd1117 100644
--- a/include/linux/slab_def.h
+++ b/include/linux/slab_def.h
@@ -15,8 +15,6 @@
 #include <asm/cache.h>		/* kmalloc_sizes.h needs L1_CACHE_BYTES */
 #include <linux/compiler.h>
 
-#include <trace/events/kmem.h>
-
 /*
  * struct kmem_cache
  *
diff --git a/mm/slab.c b/mm/slab.c
index 83311c9a..2acfa0d 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -121,6 +121,8 @@
 #include	<asm/tlbflush.h>
 #include	<asm/page.h>
 
+#include <trace/events/kmem.h>
+
 /*
  * DEBUG	- 1 for kmem_cache_create() to honour; SLAB_RED_ZONE & SLAB_POISON.
  *		  0 for faster, smaller code (especially in the critical paths).
