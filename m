From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH -next] zfcp: add missing module.h include
Date: Thu, 22 Sep 2011 09:20:45 +0200
Message-ID: <1316676045-5634-1-git-send-email-heiko.carstens@de.ibm.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate1.uk.ibm.com ([194.196.100.161]:50404 "EHLO
	mtagate1.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751501Ab1IVHUt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 Sep 2011 03:20:49 -0400
Received: from d06nrmr1307.portsmouth.uk.ibm.com (d06nrmr1307.portsmouth.uk.ibm.com [9.149.38.129])
	by mtagate1.uk.ibm.com (8.13.1/8.13.1) with ESMTP id p8M7KlKU026020
	for <linux-next@vger.kernel.org>; Thu, 22 Sep 2011 07:20:47 GMT
Received: from d06av06.portsmouth.uk.ibm.com (d06av06.portsmouth.uk.ibm.com [9.149.37.217])
	by d06nrmr1307.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id p8M7KlCC2375830
	for <linux-next@vger.kernel.org>; Thu, 22 Sep 2011 08:20:47 +0100
Received: from d06av06.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av06.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id p8MEKlBo031580
	for <linux-next@vger.kernel.org>; Thu, 22 Sep 2011 08:20:47 -0600
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, Steffen Maier <maier@linux.vnet.ibm.com>

Fix compile breakage caused by splitting module.h:

drivers/s390/scsi/zfcp_qdio.c:20:30: error: expected ')' before string constant

Cc: Steffen Maier <maier@linux.vnet.ibm.com>
Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---
 drivers/s390/scsi/zfcp_qdio.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/s390/scsi/zfcp_qdio.c b/drivers/s390/scsi/zfcp_qdio.c
index df9e69f..99bed1e 100644
--- a/drivers/s390/scsi/zfcp_qdio.c
+++ b/drivers/s390/scsi/zfcp_qdio.c
@@ -9,6 +9,7 @@
 #define KMSG_COMPONENT "zfcp"
 #define pr_fmt(fmt) KMSG_COMPONENT ": " fmt
 
+#include <linux/module.h>
 #include <linux/slab.h>
 #include "zfcp_ext.h"
 #include "zfcp_qdio.h"
-- 
1.7.5.4
