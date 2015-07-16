From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 16 Jul 2015 15:20:36 +1000
Message-ID: <20150716152036.3551cef7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45967 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751389AbbGPFUi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Jul 2015 01:20:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eric B Munson <emunson@akamai.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/kernel/entry-common.S: Assembler messages:
arch/arm/kernel/entry-common.S:108: Error: __NR_syscalls is not equal to the size of the syscall table

Caused by commit

  d221fc1f0f25 ("mm: mlock: add new mlock, munlock, and munlockall system calls")

I have added the following fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 16 Jul 2015 14:58:53 +1000
Subject: [PATCH] mm: mlock: fix for add new mlock, munlock, and munlockall system calls

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/arm/include/asm/unistd.h | 2 +-
 arch/arm/kernel/calls.S       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/unistd.h b/arch/arm/include/asm/unistd.h
index 32640c431a08..2516c09d65d7 100644
--- a/arch/arm/include/asm/unistd.h
+++ b/arch/arm/include/asm/unistd.h
@@ -19,7 +19,7 @@
  * This may need to be greater than __NR_last_syscall+1 in order to
  * account for the padding in the syscall table
  */
-#define __NR_syscalls  (388)
+#define __NR_syscalls  (392)
 
 /*
  * *NOTE*: This is a ghost syscall private to the kernel.  Only the
diff --git a/arch/arm/kernel/calls.S b/arch/arm/kernel/calls.S
index 514e77b26414..88808221383b 100644
--- a/arch/arm/kernel/calls.S
+++ b/arch/arm/kernel/calls.S
@@ -399,7 +399,7 @@
 		CALL(sys_execveat)
 		CALL(sys_mlock2)
 		CALL(sys_munlock2)
-/* 400 */	CALL(sys_munlockall2)
+/* 390 */	CALL(sys_munlockall2)
 #ifndef syscalls_counted
 .equ syscalls_padding, ((NR_syscalls + 3) & ~3) - NR_syscalls
 #define syscalls_counted
-- 
2.1.4

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
