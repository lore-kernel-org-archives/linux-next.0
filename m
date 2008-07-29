From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure
Date: Tue, 29 Jul 2008 16:23:00 +1000
Message-ID: <20080729162300.733b3e09.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40150 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752172AbYG2GXP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Jul 2008 02:23:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>

Hi Dave,

Today's linux-next build (sparc64 defconfig) failed like this:

kernel/time/tick-common.c: In function `tick_check_new_device':
kernel/time/tick-common.c:210: error: invalid lvalue in unary `&'
kernel/time/tick-common.c:223: error: invalid lvalue in unary `&'
kernel/time/tick-common.c:255: error: invalid lvalue in unary `&'

gcc is version 3.4.5 sparc64 cross compiler (powercp64 host).

The below patch fixes it.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 29 Jul 2008 16:07:37 +1000
Subject: [PATCH] cpumask: statement expressions confuse some versions of gcc

when you take the address of the result.  Noticed on a sparc64 compile
using a version 3.4.5 cross compiler.

kernel/time/tick-common.c: In function `tick_check_new_device':
kernel/time/tick-common.c:210: error: invalid lvalue in unary `&'
kernel/time/tick-common.c:223: error: invalid lvalue in unary `&'
kernel/time/tick-common.c:255: error: invalid lvalue in unary `&'

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/cpumask.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 96d0509..d3219d7 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -287,7 +287,7 @@ static inline const cpumask_t *get_cpu_mask(unsigned int cpu)
  * gcc optimizes it out (it's a constant) and there's no huge stack
  * variable created:
  */
-#define cpumask_of_cpu(cpu) ({ *get_cpu_mask(cpu); })
+#define cpumask_of_cpu(cpu) (*get_cpu_mask(cpu))
 
 
 #define CPU_MASK_LAST_WORD BITMAP_LAST_WORD_MASK(NR_CPUS)
-- 
1.5.6.3
