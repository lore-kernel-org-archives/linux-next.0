From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] pm_domain: delete duplicate stubs for dev_gpd_data
Date: Sat, 25 Feb 2012 12:51:49 -0500
Message-ID: <1330192309-25935-1-git-send-email-paul.gortmaker@windriver.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:34172 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757223Ab2BYRwD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 25 Feb 2012 12:52:03 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: rjw@sisk.pl
Cc: g.liakhovetski@gmx.de, damm@opensource.se, linux-next@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>

Two recent commits independently added a stub for this function,
causing this build failure:

  CC      drivers/sh/pm_runtime.o
In file included from drivers/sh/pm_runtime.c:15:0:
include/linux/pm_domain.h:216:46: error: redefinition of 'dev_gpd_data'
include/linux/pm_domain.h:158:46: note: previous definition of 'dev_gpd_data' was here

Keep the one using ERR_PTR() and delete the other.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

---

[linux-next commits are d57694ca59c0b310a162984a7a6a4efce8ddf815
 and 9b4f617b1c2004332113b4a2c89dfb6e8029c987 that cause duplicate]

diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 47bb082..5c2bbc2 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -213,10 +213,6 @@ static inline bool default_stop_ok(struct device *dev)
 }
 #define simple_qos_governor NULL
 #define pm_domain_always_on_gov NULL
-static inline struct generic_pm_domain_data *dev_gpd_data(struct device *dev)
-{
-	return NULL;
-}
 #endif
 
 static inline int pm_genpd_remove_callbacks(struct device *dev)
-- 
1.7.9.1
