From: Roberto Medina <robertoxmed@gmail.com>
Subject: [PATCH] staging: lustre: linux: linux-prim: fixed coding style warnings and errors
Date: Wed, 18 Mar 2015 19:22:49 +0100
Message-ID: <1426702969-3706-1-git-send-email-robertoxmed@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:37290 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752187AbbCRSWJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 18 Mar 2015 14:22:09 -0400
Received: by wixw10 with SMTP id w10so47426668wix.0
        for <linux-next@vger.kernel.org>; Wed, 18 Mar 2015 11:22:08 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: oleg.drokin@intel.com
Cc: gregkh@linuxfoundation.org, andreas.dilger@intel.com, bergwolf@gmail.com, john.hammond@intel.com, xuezhao.liu@emc.com, uja.ornl@gmail.com, asaf.vertz@tandemg.com, HPDD-discuss@lists.01.org, devel@driverdev.osuosl.org, linux-next@vger.kernel.org, Roberto Medina <robertoxmed@gmail.com>

From: Roberto Medina <robertoxmed@gmail.com>

Coding style fixes due to exported symbols and comment style.

Signed-off-by: Roberto Medina <robertoxmed@gmail.com>

---
 .../lustre/lustre/libcfs/linux/linux-prim.c        | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/lustre/lustre/libcfs/linux/linux-prim.c b/drivers/staging/lustre/lustre/libcfs/linux/linux-prim.c
index fde2819..838f5f3 100644
--- a/drivers/staging/lustre/lustre/libcfs/linux/linux-prim.c
+++ b/drivers/staging/lustre/lustre/libcfs/linux/linux-prim.c
@@ -117,11 +117,12 @@ EXPORT_SYMBOL(cfs_timer_deadline);
 void cfs_enter_debugger(void)
 {
 #if defined(CONFIG_KGDB)
-//	BREAKPOINT();
+	/* BREAKPOINT(); */
 #else
 	/* nothing */
 #endif
 }
+EXPORT_SYMBOL(cfs_enter_debugger);
 
 
 sigset_t
@@ -138,6 +139,7 @@ cfs_block_allsigs(void)
 
 	return old;
 }
+EXPORT_SYMBOL(cfs_block_allsigs);
 
 sigset_t cfs_block_sigs(unsigned long sigs)
 {
@@ -151,6 +153,7 @@ sigset_t cfs_block_sigs(unsigned long sigs)
 	spin_unlock_irqrestore(&current->sighand->siglock, flags);
 	return old;
 }
+EXPORT_SYMBOL(cfs_block_sigs);
 
 /* Block all signals except for the @sigs */
 sigset_t cfs_block_sigsinv(unsigned long sigs)
@@ -166,9 +169,10 @@ sigset_t cfs_block_sigsinv(unsigned long sigs)
 
 	return old;
 }
+EXPORT_SYMBOL(cfs_block_sigsinv);
 
 void
-cfs_restore_sigs (sigset_t old)
+cfs_restore_sigs(sigset_t old)
 {
 	unsigned long  flags;
 
@@ -177,12 +181,14 @@ cfs_restore_sigs (sigset_t old)
 	recalc_sigpending();
 	spin_unlock_irqrestore(&current->sighand->siglock, flags);
 }
+EXPORT_SYMBOL(cfs_restore_sigs);
 
 int
 cfs_signal_pending(void)
 {
 	return signal_pending(current);
 }
+EXPORT_SYMBOL(cfs_signal_pending);
 
 void
 cfs_clear_sigpending(void)
@@ -193,25 +199,19 @@ cfs_clear_sigpending(void)
 	clear_tsk_thread_flag(current, TIF_SIGPENDING);
 	spin_unlock_irqrestore(&current->sighand->siglock, flags);
 }
+EXPORT_SYMBOL(cfs_clear_sigpending);
 
 int
 libcfs_arch_init(void)
 {
 	return 0;
 }
+EXPORT_SYMBOL(libcfs_arch_init);
 
 void
 libcfs_arch_cleanup(void)
 {
 	return;
 }
-
-EXPORT_SYMBOL(libcfs_arch_init);
 EXPORT_SYMBOL(libcfs_arch_cleanup);
-EXPORT_SYMBOL(cfs_enter_debugger);
-EXPORT_SYMBOL(cfs_block_allsigs);
-EXPORT_SYMBOL(cfs_block_sigs);
-EXPORT_SYMBOL(cfs_block_sigsinv);
-EXPORT_SYMBOL(cfs_restore_sigs);
-EXPORT_SYMBOL(cfs_signal_pending);
-EXPORT_SYMBOL(cfs_clear_sigpending);
+
-- 
2.3.3
