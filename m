From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: sh build failure
Date: Fri, 20 Mar 2009 19:34:32 +0100
Message-ID: <20090320183432.GD31629@elte.hu>
References: <20090320110602.86351a91.sfr@canb.auug.org.au> <20090320182413.GB1847@Krystal>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:47819 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756335AbZCTSer (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Mar 2009 14:34:47 -0400
Content-Disposition: inline
In-Reply-To: <20090320182413.GB1847@Krystal>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Paul Mundt <lethal@linux-sh.org>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>


* Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca> wrote:

> * Stephen Rothwell (sfr@canb.auug.org.au) wrote:
> > Hi Paul,
> > 
> > Yesterday's linux-next build of sh allmodconfig failed like this:
> > 
> > kernel/built-in.o: In function `disable_all_kprobes':
> > kernel/kprobes.c:1382: undefined reference to `text_mutex'
> > kernel/built-in.o: In function `__unregister_kprobe_top':
> > kernel/kprobes.c:773: undefined reference to `text_mutex'
> > kernel/built-in.o: In function `register_kprobe':
> > kernel/kprobes.c:724: undefined reference to `text_mutex'
> > 
> > Introduced by commit 4460fdad85becd569f11501ad5b91814814335ff ("tracing,
> > Text Edit Lock - kprobes architecture independent support") from the
> > tracing tree.  text_mutex is defined in mm/memory.c which is only built
> > if CONFIG_MMU is defined, which is not true for sh allmodconfig.
> 
> Hrm, so we should move the text_mutex in a obj-y file. It's not clear to
> me which of mm/Makefile would be the best choice :
> 
> obj-y                   := bootmem.o filemap.o mempool.o oom_kill.o fadvise.o \
>                            maccess.o page_alloc.o page-writeback.o pdflush.o \
>                            readahead.o swap.o truncate.o vmscan.o shmem.o \
>                            prio_tree.o util.o mmzone.o vmstat.o backing-dev.o \
>                            page_isolation.o mm_init.o $(mmu-y)
> 
> Or maybe we add a new file, or put this in kernel/*.c. Suggestions ?

i already fixed it earlier today via the commit below.

(the commit notification did not go out to the thread because lkml 
was not Cc:-ed.)

	Ingo

-------------------->
>From 505f2b970b2269ce4cb669b3ff4f6479d379cec2 Mon Sep 17 00:00:00 2001
From: Ingo Molnar <mingo@elte.hu>
Date: Fri, 20 Mar 2009 11:05:04 +0100
Subject: [PATCH] tracing, Text Edit Lock - kprobes architecture independent support, nommu fix

Impact: build fix on SH !CONFIG_MMU

Stephen Rothwell reported this linux-next build failure on the SH
architecture:

  kernel/built-in.o: In function `disable_all_kprobes':
  kernel/kprobes.c:1382: undefined reference to `text_mutex'
  [...]

And observed:

| Introduced by commit 4460fdad85becd569f11501ad5b91814814335ff ("tracing,
| Text Edit Lock - kprobes architecture independent support") from the
| tracing tree.  text_mutex is defined in mm/memory.c which is only built
| if CONFIG_MMU is defined, which is not true for sh allmodconfig.

Move this lock to kernel/extable.c (which is already home to various
kernel text related routines), which file is always built-in.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Mundt <lethal@linux-sh.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
LKML-Reference: <20090320110602.86351a91.sfr@canb.auug.org.au>
Signed-off-by: Ingo Molnar <mingo@elte.hu>
---
 kernel/extable.c |   14 ++++++++++++--
 mm/memory.c      |    8 --------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/kernel/extable.c b/kernel/extable.c
index 0df6253..25d39b0 100644
--- a/kernel/extable.c
+++ b/kernel/extable.c
@@ -15,11 +15,21 @@
     along with this program; if not, write to the Free Software
     Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */
+#include <linux/ftrace.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/init.h>
-#include <linux/ftrace.h>
-#include <asm/uaccess.h>
+
 #include <asm/sections.h>
+#include <asm/uaccess.h>
+
+/*
+ * mutex protecting text section modification (dynamic code patching).
+ * some users need to sleep (allocating memory...) while they hold this lock.
+ *
+ * NOT exported to modules - patching kernel text is a really delicate matter.
+ */
+DEFINE_MUTEX(text_mutex);
 
 extern struct exception_table_entry __start___ex_table[];
 extern struct exception_table_entry __stop___ex_table[];
diff --git a/mm/memory.c b/mm/memory.c
index 05fab3b..dfc9e4e 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -101,14 +101,6 @@ int randomize_va_space __read_mostly =
 					2;
 #endif
 
-/*
- * mutex protecting text section modification (dynamic code patching).
- * some users need to sleep (allocating memory...) while they hold this lock.
- *
- * NOT exported to modules - patching kernel text is a really delicate matter.
- */
-DEFINE_MUTEX(text_mutex);
-
 static int __init disable_randmaps(char *s)
 {
 	randomize_va_space = 0;
