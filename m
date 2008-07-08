From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  stacktace build failure
Date: Tue, 8 Jul 2008 22:15:40 +1000
Message-ID: <20080708221540.9e0c0d2e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48645 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759755AbYGHMPo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 08:15:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

Hi Ingo,

Today's linux-next build (spac64 allmodconfig) failed like this:

arch/sparc64/kernel/stacktrace.c:50: warning: type defaults to `int' in declaration of `EXPORT_SYMBOL_GPL'
arch/sparc64/kernel/stacktrace.c:50: warning: parameter names (without types) in function declaration
arch/sparc64/kernel/stacktrace.c:50: warning: data definition has no type or storage class

Signed-off-by: Stephen Rothwell <sf@canb.auug.org.au>

diff --git a/arch/sparc64/kernel/stacktrace.c b/arch/sparc64/kernel/stacktrace.c
index 49656ed..b3e3737 100644
--- a/arch/sparc64/kernel/stacktrace.c
+++ b/arch/sparc64/kernel/stacktrace.c
@@ -1,6 +1,7 @@
 #include <linux/sched.h>
 #include <linux/stacktrace.h>
 #include <linux/thread_info.h>
+#include <linux/module.h>
 #include <asm/ptrace.h>
 #include <asm/stacktrace.h>
 
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

P.S. this is not actually tested, but seems obvious.
