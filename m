From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH -next] qdio: add missing export.h include
Date: Thu, 22 Sep 2011 09:21:48 +0200
Message-ID: <1316676108-5729-1-git-send-email-heiko.carstens@de.ibm.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate2.uk.ibm.com ([194.196.100.162]:51882 "EHLO
	mtagate2.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751523Ab1IVHVv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 Sep 2011 03:21:51 -0400
Received: from d06nrmr1307.portsmouth.uk.ibm.com (d06nrmr1307.portsmouth.uk.ibm.com [9.149.38.129])
	by mtagate2.uk.ibm.com (8.13.1/8.13.1) with ESMTP id p8M7LojE028373
	for <linux-next@vger.kernel.org>; Thu, 22 Sep 2011 07:21:50 GMT
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com [9.149.37.216])
	by d06nrmr1307.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id p8M7LnkX2445334
	for <linux-next@vger.kernel.org>; Thu, 22 Sep 2011 08:21:50 +0100
Received: from d06av04.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id p8MELwMw024665
	for <linux-next@vger.kernel.org>; Thu, 22 Sep 2011 08:21:58 -0600
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, Frank Blaschka <blaschka@linux.vnet.ibm.com>, Jan Glauber <jang@linux.vnet.ibm.com>

Fix compile breakage caused by splitting module.h:

drivers/s390/cio/qdio_setup.c:31:1:
 warning: data definition has no type or storage class [enabled by default]
drivers/s390/cio/qdio_setup.c:31:1:
 warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]

Cc: Frank Blaschka <blaschka@linux.vnet.ibm.com>
Cc: Jan Glauber <jang@linux.vnet.ibm.com>
Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---
 drivers/s390/cio/qdio_setup.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/s390/cio/qdio_setup.c b/drivers/s390/cio/qdio_setup.c
index d9a46a4..25f4988 100644
--- a/drivers/s390/cio/qdio_setup.c
+++ b/drivers/s390/cio/qdio_setup.c
@@ -7,6 +7,7 @@
  * Author(s): Jan Glauber <jang@linux.vnet.ibm.com>
  */
 #include <linux/kernel.h>
+#include <linux/export.h>
 #include <linux/slab.h>
 #include <asm/qdio.h>
 
-- 
1.7.5.4
