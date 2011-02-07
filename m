From: George Kashperko <george@znau.edu.ua>
Subject: Re: [PATCH] Fix SSB chipcommon HT/ALP avail bits layout and usage
Date: Mon, 07 Feb 2011 23:14:03 +0200
Message-ID: <1297113243.32607.31.camel@dev.znau.edu.ua>
References: <1297107730.32607.10.camel@dev.znau.edu.ua>
	 (sfid-20110207_204928_918460_412E3BD6)  <1297108556.18125.1.camel@maggie>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.academy.zt.ua ([82.207.120.245]:34590 "EHLO
	mail.academy.zt.ua" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754744Ab1BGVVT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Feb 2011 16:21:19 -0500
Received: from [10.0.2.42] by mail.academy.zt.ua (Cipher SSLv3:RC4-MD5:128) (MDaemon PRO v11.0.3)
	with ESMTP id md50000019491.msg
	for <linux-next@vger.kernel.org>; Mon, 07 Feb 2011 23:20:45 +0200
In-Reply-To: <1297108556.18125.1.camel@maggie>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Michael =?ISO-8859-1?Q?B=FCsch?= <mb@bu3sch.de>

BCM4328 chipcommon have different CLKCTLST register HT and ALP availability
bits' layout comparing to other BCM chips. 4328 HT/ALP availability bits are
16/17 whereas other BCM chips' HT/ALP availability bits are 17/16. Therefore
current pmu pll initialization code forces active low power clock for all
non-4328 chips instead of switching HT clock on.
Knowledge on different bits layout goes from Broadcom's code available from
GPL'ed firmwares for newer 4716/18 socs and also from staging bcm80211 drivers.
You can check definitions and usage for CCS_ALPAVAIL/CCS_HTAVAIL and
CCS0_ALPAVAIL/CCS0_HTAVAIL (defined in hndsoc.h) in Broadcom's pmu
initialization code (see hndpmu.c) to see this difference.
Patch also fixes typo in ALP avail define description.
Signed-off-by: George Kashperko <george@znau.edu.ua>
---
 drivers/ssb/driver_chipcommon_pmu.c       |    4 ++--
 include/linux/ssb/ssb_driver_chipcommon.h |    6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)
--- linux-next-20110203.orig/drivers/ssb/driver_chipcommon_pmu.c	2011-02-01 05:05:49.000000000 +0200
+++ linux-next-20110203/drivers/ssb/driver_chipcommon_pmu.c	2011-02-07 19:18:06.000000000 +0200
@@ -132,12 +132,12 @@ static void ssb_pmu0_pllinit_r0(struct s
 	}
 	for (i = 1500; i; i--) {
 		tmp = chipco_read32(cc, SSB_CHIPCO_CLKCTLST);
-		if (!(tmp & SSB_CHIPCO_CLKCTLST_HAVEHT))
+		if (!(tmp & SSB_CHIPCO_CLKCTLST_HAVEHT_4328))
 			break;
 		udelay(10);
 	}
 	tmp = chipco_read32(cc, SSB_CHIPCO_CLKCTLST);
-	if (tmp & SSB_CHIPCO_CLKCTLST_HAVEHT)
+	if (tmp & SSB_CHIPCO_CLKCTLST_HAVEHT_4328)
 		ssb_printk(KERN_EMERG PFX "Failed to turn the PLL off!\n");
 
 	/* Set PDIV in PLL control 0. */
--- linux-next-20110203.orig/include/linux/ssb/ssb_driver_chipcommon.h	2011-02-01 05:05:49.000000000 +0200
+++ linux-next-20110203/include/linux/ssb/ssb_driver_chipcommon.h	2011-02-07 19:43:22.000000000 +0200
@@ -189,8 +189,10 @@
 #define  SSB_CHIPCO_CLKCTLST_HAVEALPREQ	0x00000008 /* ALP available request */
 #define  SSB_CHIPCO_CLKCTLST_HAVEHTREQ	0x00000010 /* HT available request */
 #define  SSB_CHIPCO_CLKCTLST_HWCROFF	0x00000020 /* Force HW clock request off */
-#define  SSB_CHIPCO_CLKCTLST_HAVEHT	0x00010000 /* HT available */
-#define  SSB_CHIPCO_CLKCTLST_HAVEALP	0x00020000 /* APL available */
+#define  SSB_CHIPCO_CLKCTLST_HAVEALP	0x00010000 /* ALP available */
+#define  SSB_CHIPCO_CLKCTLST_HAVEHT	0x00020000 /* HT available */
+#define  SSB_CHIPCO_CLKCTLST_HAVEHT_4328	0x00010000 /* HT available on 4328 */
+#define  SSB_CHIPCO_CLKCTLST_HAVEALP_4328	0x00020000/* ALP available on 4328 */
 #define SSB_CHIPCO_HW_WORKAROUND	0x01E4 /* Hardware workaround (rev >= 20) */
 #define SSB_CHIPCO_UART0_DATA		0x0300
 #define SSB_CHIPCO_UART0_IMR		0x0304
