From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH next] sysctl: fix build breakage
Date: Mon, 6 Apr 2009 11:01:52 +0400
Message-ID: <20090406070152.GA29032@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f158.google.com ([209.85.220.158]:50787 "EHLO
	mail-fx0-f158.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751050AbZDFHCF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 6 Apr 2009 03:02:05 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@elte.hu, sfr@canb.auug.org.au, kees@ubuntu.com

Fix this build error when MODULES is not set:
kernel/sysctl.c:545: error: 'one' undeclared here

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 kernel/sysctl.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 4a0f8ad..655762b 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -91,7 +91,7 @@ extern int rcutorture_runnable;
 #endif /* #ifdef CONFIG_RCU_TORTURE_TEST */
 
 /* Constants used for minimum and  maximum */
-#if defined(CONFIG_DETECT_HUNG_TASK) || defined(CONFIG_DETECT_SOFTLOCKUP) || defined(CONFIG_HIGHMEM)
+#if defined(CONFIG_DETECT_HUNG_TASK) || defined(CONFIG_DETECT_SOFTLOCKUP) || defined(CONFIG_HIGHMEM) || defined(CONFIG_MODULES)
 static int one = 1;
 #endif
 #ifdef CONFIG_DETECT_SOFTLOCKUP
