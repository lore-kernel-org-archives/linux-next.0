From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH -next] seeq: fix compile breakage on s390
Date: Thu, 22 Sep 2011 09:17:55 +0200
Message-ID: <1316675875-5423-1-git-send-email-heiko.carstens@de.ibm.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate3.uk.ibm.com ([194.196.100.163]:41993 "EHLO
	mtagate3.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751001Ab1IVHR7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 Sep 2011 03:17:59 -0400
Received: from d06nrmr1707.portsmouth.uk.ibm.com (d06nrmr1707.portsmouth.uk.ibm.com [9.149.39.225])
	by mtagate3.uk.ibm.com (8.13.1/8.13.1) with ESMTP id p8M7Hwwt011477
	for <linux-next@vger.kernel.org>; Thu, 22 Sep 2011 07:17:58 GMT
Received: from d06av07.portsmouth.uk.ibm.com (d06av07.portsmouth.uk.ibm.com [9.149.37.248])
	by d06nrmr1707.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id p8M7HvGD1945628
	for <linux-next@vger.kernel.org>; Thu, 22 Sep 2011 08:17:57 +0100
Received: from d06av07.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id p8M7HvvZ029743
	for <linux-next@vger.kernel.org>; Thu, 22 Sep 2011 01:17:57 -0600
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Cc: linux-next@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>

The SEEQ drivers should depend on HAS_IOMEM to prevent compile breakage
on !HAS_IOMEM architectures:

drivers/net/ethernet/seeq/seeq8005.c: In function 'seeq8005_probe1':
drivers/net/ethernet/seeq/seeq8005.c:179:2: error:
  implicit declaration of function 'inw' [-Werror=implicit-function-declaration]

Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---
 drivers/net/ethernet/seeq/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/net/ethernet/seeq/Kconfig b/drivers/net/ethernet/seeq/Kconfig
index 49b6d5b..29f1853 100644
--- a/drivers/net/ethernet/seeq/Kconfig
+++ b/drivers/net/ethernet/seeq/Kconfig
@@ -5,6 +5,7 @@
 config NET_VENDOR_SEEQ
 	bool "SEEQ devices"
 	default y
+	depends on HAS_IOMEM
 	depends on (ARM && ARCH_ACORN) || SGI_HAS_SEEQ || EXPERIMENTAL
 	---help---
 	  If you have a network (Ethernet) card belonging to this class, say Y
-- 
1.7.5.4
