From: tip-bot for John Stultz <tipbot@zytor.com>
Subject: [tip:timers/core] time: Rename udelay_test.c to test_udelay.c
Date: Sat, 22 Nov 2014 11:31:36 -0800
Message-ID: <tip-fd866e2b116b01d42428491899fe9925c42c121c@git.kernel.org>
Reply-To: greg@kroah.com, linux-kernel@vger.kernel.org, mingo@kernel.org,
	  john.stultz@linaro.org, mingo@elte.hu, keescook@chromium.org,
	  tglx@linutronix.de, davidriley@chromium.org,
	  sfr@canb.auug.org.au, hpa@zytor.com, linux-next@vger.kernel.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:48582 "EHLO
	terminus.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752096AbaKVTcP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 22 Nov 2014 14:32:15 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-tip-commits@vger.kernel.org
Cc: mingo@kernel.org, john.stultz@linaro.org, mingo@elte.hu, keescook@chromium.org, greg@kroah.com, sfr@canb.auug.org.au, hpa@zytor.com, linux-next@vger.kernel.org, tglx@linutronix.de, davidriley@chromium.org

Commit-ID:  fd866e2b116b01d42428491899fe9925c42c121c
Gitweb:     http://git.kernel.org/tip/fd866e2b116b01d42428491899fe9925c42c121c
Author:     John Stultz <john.stultz@linaro.org>
AuthorDate: Mon, 4 Aug 2014 11:30:56 -0700
Committer:  John Stultz <john.stultz@linaro.org>
CommitDate: Fri, 21 Nov 2014 11:59:55 -0800

time: Rename udelay_test.c to test_udelay.c

Kees requested that this test module be renamed for consistency sake,
so this patch renames the udelay_test.c file (recently added to
tip/timers/core for 3.17) to test_udelay.c

Cc: Kees Cook <keescook@chromium.org>
Cc: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@elte.hu>
Cc: Linux-Next <linux-next@vger.kernel.org>
Cc: David Riley <davidriley@chromium.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 kernel/time/Makefile                         | 2 +-
 kernel/time/{udelay_test.c => test_udelay.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/time/Makefile b/kernel/time/Makefile
index 7347426..f622cf2 100644
--- a/kernel/time/Makefile
+++ b/kernel/time/Makefile
@@ -13,7 +13,7 @@ obj-$(CONFIG_TICK_ONESHOT)			+= tick-oneshot.o
 obj-$(CONFIG_TICK_ONESHOT)			+= tick-sched.o
 obj-$(CONFIG_TIMER_STATS)			+= timer_stats.o
 obj-$(CONFIG_DEBUG_FS)				+= timekeeping_debug.o
-obj-$(CONFIG_TEST_UDELAY)			+= udelay_test.o
+obj-$(CONFIG_TEST_UDELAY)			+= test_udelay.o
 
 $(obj)/time.o: $(obj)/timeconst.h
 
diff --git a/kernel/time/udelay_test.c b/kernel/time/test_udelay.c
similarity index 100%
rename from kernel/time/udelay_test.c
rename to kernel/time/test_udelay.c
