From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH next] errno.h: define ERFKILL
Date: Fri,  5 Jun 2009 14:06:48 +0400
Message-ID: <1244196408-12771-1-git-send-email-a.beregalov@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f213.google.com ([209.85.218.213]:43988 "EHLO
	mail-bw0-f213.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752008AbZFELSt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 5 Jun 2009 07:18:49 -0400
Received: by bwz9 with SMTP id 9so1410667bwz.37
        for <linux-next@vger.kernel.org>; Fri, 05 Jun 2009 04:18:50 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: johannes@sipsolutions.net, linville@tuxdriver.com, linux-next@vger.kernel.org
Cc: davem@davemloft.net, ralf@linux-mips.org, kyle@mcmartin.ca, rth@twiddle.net, ink@jurassic.park.msu.ru, Alexander Beregalov <a.beregalov@gmail.com>

Commit 1f87f7d3 (cfg80211: add rfkill support) added ERFKILL
to asm-generic/errno.h, but alpha, mips, parisc and sparc use
their own numbering scheme and do not include asm-generic/errno.h.
We need to add definition of ERFKILL for them.

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---
 arch/alpha/include/asm/errno.h  |    2 ++
 arch/mips/include/asm/errno.h   |    2 ++
 arch/parisc/include/asm/errno.h |    1 +
 arch/sparc/include/asm/errno.h  |    2 ++
 4 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/alpha/include/asm/errno.h b/arch/alpha/include/asm/errno.h
index 69e2655..98099bd 100644
--- a/arch/alpha/include/asm/errno.h
+++ b/arch/alpha/include/asm/errno.h
@@ -120,4 +120,6 @@
 #define	EOWNERDEAD	136	/* Owner died */
 #define	ENOTRECOVERABLE	137	/* State not recoverable */
 
+#define	ERFKILL		138	/* Operation not possible due to RF-kill */
+
 #endif
diff --git a/arch/mips/include/asm/errno.h b/arch/mips/include/asm/errno.h
index 3c0d840..a0efc73 100644
--- a/arch/mips/include/asm/errno.h
+++ b/arch/mips/include/asm/errno.h
@@ -119,6 +119,8 @@
 #define	EOWNERDEAD	165	/* Owner died */
 #define	ENOTRECOVERABLE	166	/* State not recoverable */
 
+#define	ERFKILL		167	/* Operation not possible due to RF-kill */
+
 #define EDQUOT		1133	/* Quota exceeded */
 
 #ifdef __KERNEL__
diff --git a/arch/parisc/include/asm/errno.h b/arch/parisc/include/asm/errno.h
index e2f3ddc..9992abd 100644
--- a/arch/parisc/include/asm/errno.h
+++ b/arch/parisc/include/asm/errno.h
@@ -120,5 +120,6 @@
 #define EOWNERDEAD	254	/* Owner died */
 #define ENOTRECOVERABLE	255	/* State not recoverable */
 
+#define	ERFKILL		256	/* Operation not possible due to RF-kill */
 
 #endif
diff --git a/arch/sparc/include/asm/errno.h b/arch/sparc/include/asm/errno.h
index a9ef172..4e2bc49 100644
--- a/arch/sparc/include/asm/errno.h
+++ b/arch/sparc/include/asm/errno.h
@@ -110,4 +110,6 @@
 #define	EOWNERDEAD	132	/* Owner died */
 #define	ENOTRECOVERABLE	133	/* State not recoverable */
 
+#define	ERFKILL		134	/* Operation not possible due to RF-kill */
+
 #endif
-- 
1.6.3.1
