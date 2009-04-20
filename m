From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH 2/2] pktcdvd.h should include mempool.h
Date: Mon, 20 Apr 2009 12:17:24 +0400
Message-ID: <1240215444-8137-1-git-send-email-a.beregalov@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.168]:7902 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750755AbZDTIRb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Apr 2009 04:17:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, axboe@kernel.dk
Cc: Alexander Beregalov <a.beregalov@gmail.com>

From: Alexander Beregalov <a.beregalov@gmail.com> 

Fix this build error:
In file included from fs/compat_ioctl.c:104:
include/linux/pktcdvd.h:285: error: expected specifier-qualifier-list before 'mempool_t'

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---
 include/linux/pktcdvd.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/linux/pktcdvd.h b/include/linux/pktcdvd.h
index 04b4d73..d745f5b 100644
--- a/include/linux/pktcdvd.h
+++ b/include/linux/pktcdvd.h
@@ -113,6 +113,7 @@ struct pkt_ctrl_command {
 #include <linux/cdrom.h>
 #include <linux/kobject.h>
 #include <linux/sysfs.h>
+#include <linux/mempool.h>
 
 /* default bio write queue congestion marks */
 #define PKT_WRITE_CONGESTION_ON    10000
-- 
1.6.2.3
