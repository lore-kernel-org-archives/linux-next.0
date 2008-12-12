From: Russ Anderson <rja@sgi.com>
Subject: [BUGFIX][PATCH] sgi-xp: xpc needs to pass the physical address, not virtual
Date: Fri, 12 Dec 2008 11:07:00 -0600
Message-ID: <20081212170659.GA13377@sgi.com>
Reply-To: Russ Anderson <rja@sgi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay1.sgi.com ([192.48.179.29]:50999 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1757408AbYLLRHG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Dec 2008 12:07:06 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>, tglx@linutronix.de, linux-next@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "H. Peter Anvin" <hpa@zytor.com>, Dean Nelson <dcn@sgi.com>, Russ Anderson <rja@sgi.com>

xpc needs to pass the physical address, not virtual.

Signed-off-by: Russ Anderson <rja@sgi.com>
Acked-by: Dean Nelson <dcn@sgi.com>

---
Testing uncovered this problem.  The virtual address happens to work
most of the time due to the way bios was masking off the node bits.
Passing the physical address makes it work all of the time.


 arch/x86/include/asm/uv/bios.h |    2 +-
 arch/x86/kernel/bios_uv.c      |    4 +---
 drivers/misc/sgi-xp/xpc_uv.c   |    8 ++++----
 3 files changed, 6 insertions(+), 8 deletions(-)

Index: linux/drivers/misc/sgi-xp/xpc_uv.c
===================================================================
--- linux.orig/drivers/misc/sgi-xp/xpc_uv.c	2008-12-11 15:23:58.000000000 -0600
+++ linux/drivers/misc/sgi-xp/xpc_uv.c	2008-12-11 15:49:02.000000000 -0600
@@ -119,16 +119,16 @@ xpc_gru_mq_watchlist_alloc_uv(struct xpc
 	int ret;
 
 #if defined CONFIG_X86_64
-	ret = uv_bios_mq_watchlist_alloc(mq->mmr_blade, mq->address, mq->order,
-					 &mq->mmr_offset);
+	ret = uv_bios_mq_watchlist_alloc(mq->mmr_blade, uv_gpa(mq->address),
+					 mq->order, &mq->mmr_offset);
 	if (ret < 0) {
 		dev_err(xpc_part, "uv_bios_mq_watchlist_alloc() failed, "
 			"ret=%d\n", ret);
 		return ret;
 	}
 #elif defined CONFIG_IA64_GENERIC || defined CONFIG_IA64_SGI_UV
-	ret = sn_mq_watchlist_alloc(mq->mmr_blade, mq->address, mq->order,
-				    &mq->mmr_offset);
+	ret = sn_mq_watchlist_alloc(mq->mmr_blade, uv_gpa(mq->address),
+				    mq->order, &mq->mmr_offset);
 	if (ret < 0) {
 		dev_err(xpc_part, "sn_mq_watchlist_alloc() failed, ret=%d\n",
 			ret);
Index: linux/arch/x86/include/asm/uv/bios.h
===================================================================
--- linux.orig/arch/x86/include/asm/uv/bios.h	2008-12-11 15:23:57.000000000 -0600
+++ linux/arch/x86/include/asm/uv/bios.h	2008-12-11 15:34:30.000000000 -0600
@@ -100,7 +100,7 @@ extern s64 uv_bios_call_reentrant(enum u
 
 extern s64 uv_bios_get_sn_info(int, int *, long *, long *, long *);
 extern s64 uv_bios_freq_base(u64, u64 *);
-extern int uv_bios_mq_watchlist_alloc(int, void *, unsigned int,
+extern int uv_bios_mq_watchlist_alloc(int, unsigned long, unsigned int,
 					unsigned long *);
 extern int uv_bios_mq_watchlist_free(int, int);
 extern s64 uv_bios_change_memprotect(u64, u64, enum uv_memprotect);
Index: linux/arch/x86/kernel/bios_uv.c
===================================================================
--- linux.orig/arch/x86/kernel/bios_uv.c	2008-12-11 15:23:57.000000000 -0600
+++ linux/arch/x86/kernel/bios_uv.c	2008-12-11 15:36:09.000000000 -0600
@@ -101,15 +101,13 @@ s64 uv_bios_get_sn_info(int fc, int *uvt
 }
 
 int
-uv_bios_mq_watchlist_alloc(int blade, void *mq, unsigned int mq_size,
+uv_bios_mq_watchlist_alloc(int blade, unsigned long addr, unsigned int mq_size,
 			   unsigned long *intr_mmr_offset)
 {
 	union uv_watchlist_u size_blade;
-	unsigned long addr;
 	u64 watchlist;
 	s64 ret;
 
-	addr = (unsigned long)mq;
 	size_blade.size = mq_size;
 	size_blade.blade = blade;
 
-- 
Russ Anderson, OS RAS/Partitioning Project Lead  
SGI - Silicon Graphics Inc          rja@sgi.com
