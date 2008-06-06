From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: scsi/driver-core build failure
Date: Fri, 6 Jun 2008 14:29:56 +1000
Message-ID: <20080606142956.991a1b74.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35872 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750785AbYFFEaE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Jun 2008 00:30:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Greg KH <greg@kroah.com>

Hi James,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/scsi/scsi_transport_iscsi.c: In function 'iscsi_create_endpoint':
drivers/scsi/scsi_transport_iscsi.c:174: warning: passing argument 2 of 'class_find_device' from incompatible pointer type
drivers/scsi/scsi_transport_iscsi.c:174: error: too few arguments to function 'class_find_device'
drivers/scsi/scsi_transport_iscsi.c: In function 'iscsi_lookup_endpoint':
drivers/scsi/scsi_transport_iscsi.c:225: warning: passing argument 2 of 'class_find_device' from incompatible pointer type
drivers/scsi/scsi_transport_iscsi.c:225: error: too few arguments to function 'class_find_device'

Caused by commit daa142252d5d2bc942b8687a3d7a11f38f8471e7 ("Driver Core:
add ability for class_find_device to start in middle of list") from the
driver-core tree adding a parameter to class_find_device while commit
f750906f13a16deb52a04d6d020ea08b26afc5d2 ("[SCSI] iscsi class: add
endpoint class") added a new call.

I have fixed it up by adding the following patch which I will have to
carry at least for a while.

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

