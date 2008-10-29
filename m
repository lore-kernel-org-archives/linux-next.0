From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: v4l-dvb tree build failure
Date: Wed, 29 Oct 2008 13:20:11 +1100
Message-ID: <20081029132011.920a9b6f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51292 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752234AbYJ2CUR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Oct 2008 22:20:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, Andreas Oberritter <obi@linuxtv.org>

Hi Mauro,

Today's linux-next build (x86_64 allmodconfig) failed like this:
drivers/media/dvb/dvb-core/dvbdev.c: In function 'dvb_register_device':
drivers/media/dvb/dvb-core/dvbdev.c:254: error: implicit declaration of function 'nums2minor'

Caused by commit f3d9182030d9655d9ffff33dfceb45b4a127b6ec ("V4L/DVB
(9361): Dynamic DVB minor allocation") which clearly has not even been
built with CONFIG_DVB_DYNAMIC_MINORS=y.

I applied the following patch.

More care required, please.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 29 Oct 2008 13:16:19 +1100
Subject: [PATCH] v4l-dvb: fallout from DVB_DYNAMIC_MINORS addition

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/media/dvb/dvb-core/dvbdev.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/media/dvb/dvb-core/dvbdev.c b/drivers/media/dvb/dvb-core/dvbdev.c
index e363a3b..ebfd913 100644
--- a/drivers/media/dvb/dvb-core/dvbdev.c
+++ b/drivers/media/dvb/dvb-core/dvbdev.c
@@ -251,7 +251,7 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	mutex_unlock(&dvbdev_register_lock);
 
 	clsdev = device_create(dvb_class, adap->device,
-			       MKDEV(DVB_MAJOR, nums2minor(adap->num, type, id)),
+			       MKDEV(DVB_MAJOR, minor),
 			       NULL, "dvb%d.%s%d", adap->num, dnames[type], id);
 	if (IS_ERR(clsdev)) {
 		printk(KERN_ERR "%s: failed to create device dvb%d.%s%d (%ld)\n",
-- 
1.5.6.5
