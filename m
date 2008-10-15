From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: scsi tree build failure
Date: Wed, 15 Oct 2008 17:49:16 +1100
Message-ID: <20081015174916.6cc04bdb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43879 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751024AbYJOGt0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 02:49:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>

[Resent to get past vger's filters]

Hi James,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/scsi/sd.c:579:27: error: macro "sd_dif_op" passed 4 arguments, but takes just 3
drivers/scsi/sd.c: In function 'sd_prep_fn':
drivers/scsi/sd.c:578: error: 'sd_dif_op' undeclared (first use in this function)

Caused by commit 9e06688e7d60149cc9ef78ff29515c20186bb418 ("[SCSI] sd:
Correctly handle all combinations of DIF and DIX").

I added the following patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 15 Oct 2008 16:54:59 +1100
Subject: [PATCH] scsi: sd_dif_op has four parameters

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/scsi/sd.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/scsi/sd.h b/drivers/scsi/sd.h
index a92b991..1347e00 100644
--- a/drivers/scsi/sd.h
+++ b/drivers/scsi/sd.h
@@ -106,7 +106,7 @@ extern void sd_dif_complete(struct scsi_cmnd *, unsigned int);
 
 #else /* CONFIG_BLK_DEV_INTEGRITY */
 
-#define sd_dif_op(a, b, c)			do { } while (0)
+#define sd_dif_op(a, b, c, d)			do { } while (0)
 #define sd_dif_config_host(a)			do { } while (0)
 #define sd_dif_prepare(a, b, c)			(0)
 #define sd_dif_complete(a, b)			(0)
-- 
1.5.6.5
