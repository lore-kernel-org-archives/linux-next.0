From: Joe Perches <joe@perches.com>
Subject: [PATCH V2] printk/cache: Mark printk_once test variable
 __read_mostly
Date: Wed, 30 Oct 2013 16:01:42 -0700
Message-ID: <1383174102.9435.54.camel@joe-AO722>
References: <1383128301-20231-1-git-send-email-james.hogan@imgtec.com>
	 <20131030134839.8bdf70cc68d1bf0beb1fb63a@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay0221.hostedemail.com ([216.40.44.221]:51838 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751369Ab3J3XBr (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Oct 2013 19:01:47 -0400
In-Reply-To: <20131030134839.8bdf70cc68d1bf0beb1fb63a@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: James Hogan <james.hogan@imgtec.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linux-metag@vger.kernel.org

Add #include <linux/cache.h> to define __read_mostly.

Convert cache.h to use uapi/linux/kernel.h instead
of linux/kernel.h to avoid recursive #includes.

Convert the ALIGN macro to __KERNEL_ALIGN.

printk_once only sets the bool variable tested
once so mark it __read_mostly.

Neaten the alignment so it matches the rest of the
pr_<level>_once #defines too.

Signed-off-by: Joe Perches <joe@perches.com>
---
V2: Add cache.h which was nearly always used
    indirectly via #include <some_other_file.h>,
    generally module.h
    Update cache.h to avoid recursive #include

 include/linux/cache.h  |  4 ++--
 include/linux/printk.h | 19 ++++++++++---------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/linux/cache.h b/include/linux/cache.h
index 4c57065..63a1d97 100644
--- a/include/linux/cache.h
+++ b/include/linux/cache.h
@@ -1,11 +1,11 @@
 #ifndef __LINUX_CACHE_H
 #define __LINUX_CACHE_H
 
-#include <linux/kernel.h>
+#include <uapi/linux/kernel.h>
 #include <asm/cache.h>
 
 #ifndef L1_CACHE_ALIGN
-#define L1_CACHE_ALIGN(x) ALIGN(x, L1_CACHE_BYTES)
+#define L1_CACHE_ALIGN(x) __KERNEL_ALIGN(x, L1_CACHE_BYTES)
 #endif
 
 #ifndef SMP_CACHE_BYTES
diff --git a/include/linux/printk.h b/include/linux/printk.h
index e6131a78..2449da9 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -5,6 +5,7 @@
 #include <linux/init.h>
 #include <linux/kern_levels.h>
 #include <linux/linkage.h>
+#include <linux/cache.h>
 
 extern const char linux_banner[];
 extern const char linux_proc_banner[];
@@ -251,17 +252,17 @@ extern asmlinkage void dump_stack(void) __cold;
  */
 
 #ifdef CONFIG_PRINTK
-#define printk_once(fmt, ...)			\
-({						\
-	static bool __print_once;		\
-						\
-	if (!__print_once) {			\
-		__print_once = true;		\
-		printk(fmt, ##__VA_ARGS__);	\
-	}					\
+#define printk_once(fmt, ...)					\
+({								\
+	static bool __print_once __read_mostly;			\
+								\
+	if (!__print_once) {					\
+		__print_once = true;				\
+		printk(fmt, ##__VA_ARGS__);			\
+	}							\
 })
 #else
-#define printk_once(fmt, ...)			\
+#define printk_once(fmt, ...)					\
 	no_printk(fmt, ##__VA_ARGS__)
 #endif
 
