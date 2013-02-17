From: Li Zhong <zhong@linux.vnet.ibm.com>
Subject: [PATCH linux-next]cputime: fix compiler warning caused by
 timeval_to_cputime()
Date: Sun, 17 Feb 2013 14:53:26 +0800
Message-ID: <1361084006.2580.16.camel@ThinkPad-T5421.cn.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp04.au.ibm.com ([202.81.31.146]:36098 "EHLO
	e23smtp04.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752522Ab3BQGxf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 17 Feb 2013 01:53:35 -0500
Received: from /spool/local
	by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <zhong@linux.vnet.ibm.com>;
	Sun, 17 Feb 2013 16:44:29 +1000
Received: from d23relay03.au.ibm.com (d23relay03.au.ibm.com [9.190.235.21])
	by d23dlp01.au.ibm.com (Postfix) with ESMTP id 51C8B2CE804A
	for <linux-next@vger.kernel.org>; Sun, 17 Feb 2013 17:53:31 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
	by d23relay03.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id r1H6rSnC44892248
	for <linux-next@vger.kernel.org>; Sun, 17 Feb 2013 17:53:29 +1100
Received: from d23av03.au.ibm.com (loopback [127.0.0.1])
	by d23av03.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id r1H6rTPl030647
	for <linux-next@vger.kernel.org>; Sun, 17 Feb 2013 17:53:29 +1100
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: linux-next list <linux-next@vger.kernel.org>

Saw the following compiler warning on next tree:

kernel/itimer.c: In function 'set_cpu_itimer':
kernel/itimer.c:152:2: warning: passing argument 1 of
'timeval_to_cputime' discards 'const' qualifier from pointer target type
[enabled by default]
...

Signed-off-by: Li Zhong <zhong@linux.vnet.ibm.com>
---
 include/asm-generic/cputime_nsecs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/asm-generic/cputime_nsecs.h b/include/asm-generic/cputime_nsecs.h
index b6485ca..a8ece9a 100644
--- a/include/asm-generic/cputime_nsecs.h
+++ b/include/asm-generic/cputime_nsecs.h
@@ -76,7 +76,7 @@ static inline void cputime_to_timespec(const cputime_t ct, struct timespec *val)
 /*
  * Convert cputime <-> timeval (msec)
  */
-static inline cputime_t timeval_to_cputime(struct timeval *val)
+static inline cputime_t timeval_to_cputime(const struct timeval *val)
 {
 	u64 ret = val->tv_sec * NSEC_PER_SEC + val->tv_usec * NSEC_PER_USEC;
 	return (__force cputime_t) ret;
-- 
1.8.1.2
