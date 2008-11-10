From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: proc tree build failure
Date: Mon, 10 Nov 2008 16:29:41 +1100
Message-ID: <20081110162941.e9e9ef3a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48581 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751209AbYKJF3r (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 10 Nov 2008 00:29:47 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: linux-next@vger.kernel.org, Ken Chen <kenchen@google.com>, Ingo Molnar <mingo@elte.hu>

Hi Alexey,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

fs/proc/base.c:2547: error: 'pid_stack' undeclared here (not in a function)

Caused by an interaction of commits
078e9901c02d4899db5b24f708b8dfbca8935891 ("stacktrace:
add /proc/<pid>/stack to dump task's stack trace") and
35f0b5fd7fab907a1119eaa614d9b24e5e225755 ("stacktrace:
convert /proc/<pid>/stack to seqfiles") from the tip-core tree with commit
5d8880e3e0fb96459c652ac5e1504b90c949b3b9 ("proc: remove '##' usage") from
the proc tree.

The former added a new usage of INF (which the second converted to a
ONE).  I added the following patch to the merge of the proc tree and can
carry it.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 10 Nov 2008 16:25:29 +1100
Subject: [PATCH] proc: merge fix 1

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/proc/base.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/proc/base.c b/fs/proc/base.c
index 20e7752..f025953 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -2544,7 +2544,7 @@ static const struct pid_entry tgid_base_stuff[] = {
 	INF("wchan",      S_IRUGO, proc_pid_wchan),
 #endif
 #ifdef CONFIG_STACKTRACE
-	ONE("stack",      S_IRUSR, pid_stack),
+	ONE("stack",      S_IRUSR, proc_pid_stack),
 #endif
 #ifdef CONFIG_SCHEDSTATS
 	INF("schedstat",  S_IRUGO, proc_pid_schedstat),
-- 
1.5.6.5
