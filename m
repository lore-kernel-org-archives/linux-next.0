From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH -next] time, s390: get rid of compile warning
Date: Thu, 22 Sep 2011 09:19:17 +0200
Message-ID: <1316675957-5538-1-git-send-email-heiko.carstens@de.ibm.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate2.uk.ibm.com ([194.196.100.162]:50577 "EHLO
	mtagate2.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751977Ab1IVHTU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 Sep 2011 03:19:20 -0400
Received: from d06nrmr1507.portsmouth.uk.ibm.com (d06nrmr1507.portsmouth.uk.ibm.com [9.149.38.233])
	by mtagate2.uk.ibm.com (8.13.1/8.13.1) with ESMTP id p8M7JIOo026650
	for <linux-next@vger.kernel.org>; Thu, 22 Sep 2011 07:19:18 GMT
Received: from d06av12.portsmouth.uk.ibm.com (d06av12.portsmouth.uk.ibm.com [9.149.37.247])
	by d06nrmr1507.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id p8M7JIKF2662532
	for <linux-next@vger.kernel.org>; Thu, 22 Sep 2011 08:19:18 +0100
Received: from d06av12.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av12.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id p8M7JIJ1010829
	for <linux-next@vger.kernel.org>; Thu, 22 Sep 2011 01:19:18 -0600
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-next@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>

"s390: Use direct ktime path for s390 clockevent device" in linux-next
introduces this compile warning:

arch/s390/kernel/time.c: In function 's390_next_ktime':
arch/s390/kernel/time.c:118:2: warning:
  comparison of distinct pointer types lacks a cast [enabled by default]

Just use a u64 instead of an s64 variable. This is not a problem since it
will always contain a positive value.

Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---
 arch/s390/kernel/time.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/s390/kernel/time.c b/arch/s390/kernel/time.c
index c537164..8d65bd0 100644
--- a/arch/s390/kernel/time.c
+++ b/arch/s390/kernel/time.c
@@ -112,7 +112,7 @@ static void fixup_clock_comparator(unsigned long long delta)
 static int s390_next_ktime(ktime_t expires,
 			   struct clock_event_device *evt)
 {
-	s64 nsecs;
+	u64 nsecs;
 
 	nsecs = ktime_to_ns(ktime_sub(expires, ktime_get_monotonic_offset()));
 	do_div(nsecs, 125);
-- 
1.7.5.4
