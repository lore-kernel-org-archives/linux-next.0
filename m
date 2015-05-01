From: Gobinda Charan Maji <gobinda.cemk07@gmail.com>
Subject: [PATCH] sysfs: tightened sysfs permission checks
Date: Fri,  1 May 2015 17:38:23 +0530
Message-ID: <1430482103-21248-1-git-send-email-gobinda.cemk07@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:33338 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753730AbbEAMI3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 May 2015 08:08:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Linux Next <linux-next@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

There were some inconsistency in restriction to VERIFY_OCTAL_PERMISSIONS().
Previously the test was "User perms >= group perms >= other perms". The
permission field of User, Group or Other consists of three bits. LSB is
EXECUTE permission, MSB is READ permission and the middle bit is WRITE
permission. But logically WRITE is "more privileged" than READ.

Say for example, permission value is "0430". Here User has only READ
permission whereas Group has both WRITE and EXECUTE permission.

So, the checks could be tightened and the tests are separated to
USER_READABLE >= GROUP_READABLE >= OTHER_READABLE,
USER_WRITABLE >= GROUP_WRITABLE and OTHER_WRITABLE is not permitted.

Signed-off-by: Gobinda Charan Maji <gobinda.cemk07@gmail.com>
---
 include/linux/kernel.h | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 3a5b48e..cd54b35 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -818,13 +818,15 @@ static inline void ftrace_dump(enum ftrace_dump_mode oops_dump_mode) { }
 #endif
 
 /* Permissions on a sysfs file: you didn't miss the 0 prefix did you? */
-#define VERIFY_OCTAL_PERMISSIONS(perms)					\
-	(BUILD_BUG_ON_ZERO((perms) < 0) +				\
-	 BUILD_BUG_ON_ZERO((perms) > 0777) +				\
-	 /* User perms >= group perms >= other perms */			\
-	 BUILD_BUG_ON_ZERO(((perms) >> 6) < (((perms) >> 3) & 7)) +	\
-	 BUILD_BUG_ON_ZERO((((perms) >> 3) & 7) < ((perms) & 7)) +	\
-	 /* Other writable?  Generally considered a bad idea. */	\
-	 BUILD_BUG_ON_ZERO((perms) & 2) +				\
+#define VERIFY_OCTAL_PERMISSIONS(perms)						\
+	(BUILD_BUG_ON_ZERO((perms) < 0) +					\
+	 BUILD_BUG_ON_ZERO((perms) > 0777) +					\
+	 /* USER_READABLE >= GROUP_READABLE >= OTHER_READABLE */		\
+	 BUILD_BUG_ON_ZERO((((perms) >> 6) & 4) < (((perms) >> 3) & 4)) +	\
+	 BUILD_BUG_ON_ZERO((((perms) >> 3) & 4) < ((perms) & 4)) +		\
+	 /* USER_WRITABLE >= GROUP_WRITABLE */					\
+	 BUILD_BUG_ON_ZERO((((perms) >> 6) & 2) < (((perms) >> 3) & 2)) +	\
+	 /* OTHER_WRITABLE?  Generally considered a bad idea. */		\
+	 BUILD_BUG_ON_ZERO((perms) & 2) +					\
 	 (perms))
 #endif
-- 
1.8.1.4
