From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: [PATCH 1/3] x86: suppress sparse returning void warnings
Date: Thu, 17 Jul 2008 14:22:34 -0700
Message-ID: <1216329754.6029.29.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.173]:50666 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757890AbYGQVWf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Jul 2008 17:22:35 -0400
Received: by wf-out-1314.google.com with SMTP id 27so91449wfd.4
        for <linux-next@vger.kernel.org>; Thu, 17 Jul 2008 14:22:35 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next <linux-next@vger.kernel.org>

include/asm/paravirt.h:1404:2: warning: returning void-valued expression
include/asm/paravirt.h:1414:2: warning: returning void-valued expression

Signed-off-by: Harvey Harrison <harvey.harrison@gmail.com>
---
Appeared between next-20080716 and next-20080717

 include/asm-x86/paravirt.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/asm-x86/paravirt.h b/include/asm-x86/paravirt.h
index b2aba8f..27c9f22 100644
--- a/include/asm-x86/paravirt.h
+++ b/include/asm-x86/paravirt.h
@@ -1401,7 +1401,7 @@ static inline int __raw_spin_is_contended(struct raw_spinlock *lock)
 
 static __always_inline void __raw_spin_lock(struct raw_spinlock *lock)
 {
-	return PVOP_VCALL1(pv_lock_ops.spin_lock, lock);
+	PVOP_VCALL1(pv_lock_ops.spin_lock, lock);
 }
 
 static __always_inline int __raw_spin_trylock(struct raw_spinlock *lock)
@@ -1411,7 +1411,7 @@ static __always_inline int __raw_spin_trylock(struct raw_spinlock *lock)
 
 static __always_inline void __raw_spin_unlock(struct raw_spinlock *lock)
 {
-	return PVOP_VCALL1(pv_lock_ops.spin_unlock, lock);
+	PVOP_VCALL1(pv_lock_ops.spin_unlock, lock);
 }
 
 #endif
-- 
1.5.6.3.536.g61aad
