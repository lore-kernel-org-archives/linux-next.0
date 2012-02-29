From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH] thermal: add missing HAS_IOMEM dependency for SPEAr13x thermal sensor driver
Date: Wed, 29 Feb 2012 13:40:12 +0100
Message-ID: <1330519212-7046-1-git-send-email-heiko.carstens@de.ibm.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp14.uk.ibm.com ([195.75.94.110]:52817 "EHLO
	e06smtp14.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757306Ab2B2MkV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Feb 2012 07:40:21 -0500
Received: from /spool/local
	by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Wed, 29 Feb 2012 12:40:18 -0000
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com [9.149.37.213])
	by d06nrmr1507.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id q1TCeGkc2306234
	for <linux-next@vger.kernel.org>; Wed, 29 Feb 2012 12:40:16 GMT
Received: from d06av03.portsmouth.uk.ibm.com (localhost.localdomain [127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id q1TCeFNv023812
	for <linux-next@vger.kernel.org>; Wed, 29 Feb 2012 05:40:16 -0700
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, Vincenzo Frascino <vincenzo.frascino@st.com>, Viresh Kumar <viresh.kumar@st.com>

Fix this build error on s390:

drivers/thermal/spear_thermal.c: In function 'thermal_get_temp':
drivers/thermal/spear_thermal.c:49:2: error:
   implicit declaration of function 'readl' [-Werror=implicit-function-declaration]

Cc: Vincenzo Frascino <vincenzo.frascino@st.com>
Cc: Viresh Kumar <viresh.kumar@st.com>
Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---
 drivers/thermal/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
index 2633fe0..06101a7 100644
--- a/drivers/thermal/Kconfig
+++ b/drivers/thermal/Kconfig
@@ -21,7 +21,7 @@ config THERMAL_HWMON
 
 config SPEAR_THERMAL
 	bool "SPEAr thermal sensor driver"
-	depends on THERMAL
+	depends on THERMAL && HAS_IOMEM
 	help
 	  Enable this to plug the SPEAr thermal sensor driver into the Linux
 	  thermal framework
-- 
1.7.9
