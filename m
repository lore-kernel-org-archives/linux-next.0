From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH -next] pps gpio client: add missing dependency
Date: Thu, 22 Sep 2011 09:16:35 +0200
Message-ID: <1316675795-5327-1-git-send-email-heiko.carstens@de.ibm.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate3.uk.ibm.com ([194.196.100.163]:41331 "EHLO
	mtagate3.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751001Ab1IVHQk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 Sep 2011 03:16:40 -0400
Received: from d06nrmr1307.portsmouth.uk.ibm.com (d06nrmr1307.portsmouth.uk.ibm.com [9.149.38.129])
	by mtagate3.uk.ibm.com (8.13.1/8.13.1) with ESMTP id p8M7Gbc6010665
	for <linux-next@vger.kernel.org>; Thu, 22 Sep 2011 07:16:37 GMT
Received: from d06av08.portsmouth.uk.ibm.com (d06av08.portsmouth.uk.ibm.com [9.149.37.249])
	by d06nrmr1307.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id p8M7Gb0d618610
	for <linux-next@vger.kernel.org>; Thu, 22 Sep 2011 08:16:37 +0100
Received: from d06av08.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av08.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id p8M7GaUC010509
	for <linux-next@vger.kernel.org>; Thu, 22 Sep 2011 08:16:37 +0100
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, James Nuss <jamesnuss@nanometrics.ca>

Add "depends on GENERIC_HARDIRQS" to avoid compile breakage on s390:

drivers/built-in.o: In function `pps_gpio_remove':
linux-next/drivers/pps/clients/pps-gpio.c:189: undefined reference to `free_irq'

Cc: James Nuss <jamesnuss@nanometrics.ca>
Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---
 drivers/pps/clients/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/pps/clients/Kconfig b/drivers/pps/clients/Kconfig
index c2e0f1e..445197d 100644
--- a/drivers/pps/clients/Kconfig
+++ b/drivers/pps/clients/Kconfig
@@ -31,7 +31,7 @@ config PPS_CLIENT_PARPORT
 
 config PPS_CLIENT_GPIO
 	tristate "PPS client using GPIO"
-	depends on PPS
+	depends on PPS && GENERIC_HARDIRQS
 	help
 	  If you say yes here you get support for a PPS source using
 	  GPIO. To be useful you must also register a platform device
-- 
1.7.5.4
