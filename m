From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: timers tree build failure
Date: Wed, 15 Oct 2008 14:31:59 +1100
Message-ID: <20081015143159.73569b40.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38400 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752136AbYJODcH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 23:32:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>

Hi all,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

include/linux/hrtimer.h:337: error: expected declaration specifiers or '...' before 'tick_cpu_device'
include/linux/hrtimer.h:337: warning: 'struct tick_device' declared inside parameter list
include/linux/hrtimer.h:337: warning: its scope is only this definition or declaration, which is probably not what you want
include/linux/hrtimer.h:337: warning: data definition has no type or storage class
include/linux/hrtimer.h:337: warning: type defaults to 'int' in declaration of 'DECLARE_PER_CPU'

Caused by commit 2e94d1f71f7e4404d997e6fb4f1618aa147d76f9 ("hrtimer: peek
at the timer queue just before going idle") which added a DECLARE_PER_CPU()
without adding the include of linux/percpu.h.  I added the patch below.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 15 Oct 2008 14:20:28 +1100
Subject: [PATCH] DECLARE_PER_CPU needs linux/percpu.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/hrtimer.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/linux/hrtimer.h b/include/linux/hrtimer.h
index 179e3ea..1bde031 100644
--- a/include/linux/hrtimer.h
+++ b/include/linux/hrtimer.h
@@ -20,6 +20,7 @@
 #include <linux/init.h>
 #include <linux/list.h>
 #include <linux/wait.h>
+#include <linux/percpu.h>
 
 struct hrtimer_clock_base;
 struct hrtimer_cpu_base;
-- 
1.5.6.5
