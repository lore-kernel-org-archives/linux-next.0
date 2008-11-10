From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: proc tree build failure
Date: Mon, 10 Nov 2008 08:36:23 +0100
Message-ID: <20081110073623.GA475@elte.hu>
References: <20081110162941.e9e9ef3a.sfr@canb.auug.org.au> <20081110055311.GA3138@x200.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:41670 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753454AbYKJHgi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 10 Nov 2008 02:36:38 -0500
Content-Disposition: inline
In-Reply-To: <20081110055311.GA3138@x200.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Ken Chen <kenchen@google.com>


* Alexey Dobriyan <adobriyan@gmail.com> wrote:

> On Mon, Nov 10, 2008 at 04:29:41PM +1100, Stephen Rothwell wrote:
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > 
> > fs/proc/base.c:2547: error: 'pid_stack' undeclared here (not in a function)
> > 
> > Caused by an interaction of commits
> > 078e9901c02d4899db5b24f708b8dfbca8935891 ("stacktrace:
> > add /proc/<pid>/stack to dump task's stack trace") and
> > 35f0b5fd7fab907a1119eaa614d9b24e5e225755 ("stacktrace:
> > convert /proc/<pid>/stack to seqfiles") from the tip-core tree with commit
> > 5d8880e3e0fb96459c652ac5e1504b90c949b3b9 ("proc: remove '##' usage") from
> > the proc tree.
> > 
> > The former added a new usage of INF (which the second converted to a
> > ONE).  I added the following patch to the merge of the proc tree and can
> > carry it.
> 
> Time to steal this /proc/*/stack from Ingo. :-)

Alexey, would you like to carry them for v2.6.29? They are in a 
separate tree here, the pull coordinates are below.

Please preserve the sha1's (do not rebase/cherry-pick, etc.) so that i 
can carry it too without causing confusion.

	Ingo

------------------->

The core/stacktrace git tree can be pulled from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/linux-2.6-tip.git core/stacktrace

 Thanks,

	Ingo

------------------>
Ken Chen (2):
      stacktrace: add /proc/<pid>/stack to dump task's stack trace
      stacktrace: convert /proc/<pid>/stack to seqfiles


 Documentation/filesystems/proc.txt |    1 +
 fs/proc/base.c                     |   50 ++++++++++++++++++++++++++++++++++-
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/proc.txt b/Documentation/filesystems/proc.txt
index bcceb99..11f5b75 100644
--- a/Documentation/filesystems/proc.txt
+++ b/Documentation/filesystems/proc.txt
@@ -139,6 +139,7 @@ Table 1-1: Process specific entries in /proc
  statm		Process memory status information
  status		Process status in human readable form
  wchan		If CONFIG_KALLSYMS is set, a pre-decoded wchan
+ stack		Report full stack trace, enable via CONFIG_STACKTRACE
  smaps		Extension based on maps, the rss size for each mapped file
 ..............................................................................
 
diff --git a/fs/proc/base.c b/fs/proc/base.c
index 486cf3f..6d294a4 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -65,6 +65,7 @@
 #include <linux/mm.h>
 #include <linux/rcupdate.h>
 #include <linux/kallsyms.h>
+#include <linux/stacktrace.h>
 #include <linux/resource.h>
 #include <linux/module.h>
 #include <linux/mount.h>
@@ -130,6 +131,12 @@ struct pid_entry {
 		{ .proc_show = &proc_##OTYPE } )
 
 /*
+ * buffer size used for proc read.  See proc_info_read().
+ * 4K page size but our output routines use some slack for overruns
+ */
+#define PROC_BLOCK_SIZE	(3*1024)
+
+/*
  * Count the number of hardlinks for the pid_entry table, excluding the .
  * and .. links.
  */
@@ -340,6 +347,44 @@ static int proc_pid_wchan(struct task_struct *task, char *buffer)
 }
 #endif /* CONFIG_KALLSYMS */
 
+#ifdef CONFIG_STACKTRACE
+
+#define MAX_STACK_TRACE_DEPTH	64
+
+static int proc_pid_stack(struct seq_file *m, struct pid_namespace *ns,
+			  struct pid *pid, struct task_struct *task)
+{
+	struct stack_trace trace;
+	unsigned long *entries;
+	int i;
+
+	entries = kmalloc(sizeof(*entries)*MAX_STACK_TRACE_DEPTH, GFP_KERNEL);
+	if (!entries)
+		return -ENOMEM;
+
+	trace.nr_entries	= 0;
+	trace.max_entries	= MAX_STACK_TRACE_DEPTH;
+	trace.entries		= entries;
+	trace.skip		= 0;
+
+	/*
+	 * Protect against the task exiting (and deallocating its
+	 * stack, etc.) while we save its backtrace:
+	 */
+	read_lock(&tasklist_lock);
+	save_stack_trace_tsk(task, &trace);
+	read_unlock(&tasklist_lock);
+
+	for (i = 0; i < trace.nr_entries; i++) {
+		seq_printf(m, "[<%p>] %pS\n",
+			   (void *)entries[i], (void *)entries[i]);
+	}
+	kfree(entries);
+
+	return 0;
+}
+#endif
+
 #ifdef CONFIG_SCHEDSTATS
 /*
  * Provides /proc/PID/schedstat
@@ -688,8 +733,6 @@ static const struct file_operations proc_mountstats_operations = {
 	.release	= mounts_release,
 };
 
-#define PROC_BLOCK_SIZE	(3*1024)		/* 4K page size but our output routines use some slack for overruns */
-
 static ssize_t proc_info_read(struct file * file, char __user * buf,
 			  size_t count, loff_t *ppos)
 {
@@ -2491,6 +2534,9 @@ static const struct pid_entry tgid_base_stuff[] = {
 #ifdef CONFIG_KALLSYMS
 	INF("wchan",      S_IRUGO, pid_wchan),
 #endif
+#ifdef CONFIG_STACKTRACE
+	ONE("stack",      S_IRUSR, pid_stack),
+#endif
 #ifdef CONFIG_SCHEDSTATS
 	INF("schedstat",  S_IRUGO, pid_schedstat),
 #endif
