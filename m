From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] i7core_edac: fix memory leak of i7core_dev
Date: Fri,  8 Jan 2010 05:27:30 +0300
Message-ID: <1262917650-1901-1-git-send-email-a.beregalov@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f225.google.com ([209.85.220.225]:32779 "EHLO
	mail-fx0-f225.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751728Ab0AHC1g (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Jan 2010 21:27:36 -0500
Received: by fxm25 with SMTP id 25so12287974fxm.21
        for <linux-next@vger.kernel.org>; Thu, 07 Jan 2010 18:27:35 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, mchehab@redhat.com
Cc: Alexander Beregalov <a.beregalov@gmail.com>

Free already allocated i7core_dev.

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---
 drivers/edac/i7core_edac.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/edac/i7core_edac.c b/drivers/edac/i7core_edac.c
index e944b63..4de5a18 100644
--- a/drivers/edac/i7core_edac.c
+++ b/drivers/edac/i7core_edac.c
@@ -1215,8 +1215,10 @@ int i7core_get_onedevice(struct pci_dev **prev, int devno,
 			return -ENOMEM;
 		i7core_dev->pdev = kzalloc(sizeof(*i7core_dev->pdev) * n_devs,
 					   GFP_KERNEL);
-		if (!i7core_dev->pdev)
+		if (!i7core_dev->pdev) {
+			kfree(i7core_dev);
 			return -ENOMEM;
+		}
 		i7core_dev->socket = socket;
 		i7core_dev->n_devs = n_devs;
 		list_add_tail(&i7core_dev->list, &i7core_edac_list);
-- 
1.6.6
