From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH -next] futex: fix futex_hashsize initialization
Date: Thu, 16 Jan 2014 14:54:50 +0100
Message-ID: <20140116135450.GA4345@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp17.uk.ibm.com ([195.75.94.113]:46108 "EHLO
	e06smtp17.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751369AbaAPNy6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Jan 2014 08:54:58 -0500
Received: from /spool/local
	by e06smtp17.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Thu, 16 Jan 2014 13:54:56 -0000
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>, Davidlohr Bueso <davidlohr@hp.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Waiman Long <Waiman.Long@hp.com>, Jason Low <jason.low2@hp.com>

"futexes: Increase hash table size for better performance" introduces a new
alloc_large_system_hash() call. alloc_large_system_hash() however may allocate
less memory than requested, e.g. limited by MAX_ORDER.

Hence pass a pointer to alloc_large_system_hash() which will contain the hash
shift when the function returns. Afterwards correctly set futex_hashsize.

Fixes a crash on s390 where the requested allocation size was 4MB but only 1MB
was allocated.

Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---
 kernel/futex.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/futex.c b/kernel/futex.c
index 3666aa0017ed..44a1261cb9ff 100644
--- a/kernel/futex.c
+++ b/kernel/futex.c
@@ -2846,6 +2846,7 @@ SYSCALL_DEFINE6(futex, u32 __user *, uaddr, int, op, u32, val,
 static int __init futex_init(void)
 {
 	u32 curval;
+	unsigned int futex_shift;
 	unsigned long i;
 
 #if CONFIG_BASE_SMALL
@@ -2857,8 +2858,9 @@ static int __init futex_init(void)
 	futex_queues = alloc_large_system_hash("futex", sizeof(*futex_queues),
 					       futex_hashsize, 0,
 					       futex_hashsize < 256 ? HASH_SMALL : 0,
-					       NULL, NULL, futex_hashsize, futex_hashsize);
-
+					       &futex_shift, NULL,
+					       futex_hashsize, futex_hashsize);
+	futex_hashsize = 1UL << futex_shift;
 	/*
 	 * This will fail and we want it. Some arch implementations do
 	 * runtime detection of the futex_atomic_cmpxchg_inatomic()
-- 
1.8.4.5
