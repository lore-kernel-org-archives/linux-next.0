From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: driver-core build failure
Date: Thu, 17 Jul 2008 10:32:07 +1000
Message-ID: <20080717103207.ccced1ca.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42185 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750803AbYGQAcL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 20:32:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, James Bottomley <James.Bottomley@HansenPartnership.com>

Hi Greg,

I have been carrying the patch below and applying it after the scsi tree
merge for some time now.  Now that the scsi tree has been merged into
Linus' tree, can you add this to the driver-core tree, please?
Preferably merged with the patch that changes the class_find_device API.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 66bcc1fea773190ed16597c1b57b9a8601ba1a23 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 6 Jun 2008 14:26:18 +1000
Subject: [PATCH] scsi: fix fallout from the class_find_device API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/scsi/scsi_transport_iscsi.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/scsi_transport_iscsi.c b/drivers/scsi/scsi_transport_iscsi.c
index 7794651..5ce9151 100644
--- a/drivers/scsi/scsi_transport_iscsi.c
+++ b/drivers/scsi/scsi_transport_iscsi.c
@@ -170,7 +170,7 @@ iscsi_create_endpoint(int dd_size)
 	int err;
 
 	for (id = 1; id < ISCSI_MAX_EPID; id++) {
-		dev = class_find_device(&iscsi_endpoint_class, &id,
+		dev = class_find_device(&iscsi_endpoint_class, NULL, &id,
 					iscsi_match_epid);
 		if (!dev)
 			break;
@@ -221,7 +221,7 @@ struct iscsi_endpoint *iscsi_lookup_endpoint(u64 handle)
 {
 	struct device *dev;
 
-	dev = class_find_device(&iscsi_endpoint_class, &handle,
+	dev = class_find_device(&iscsi_endpoint_class, NULL, &handle,
 				iscsi_match_epid);
 	if (!dev)
 		return NULL;
-- 
1.5.5.3
