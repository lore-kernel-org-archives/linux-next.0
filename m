From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] musb: fix build when !CONFIG_PM
Date: Fri, 17 Apr 2009 15:19:14 +0400
Message-ID: <20090417111914.GA31310@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wa-out-1112.google.com ([209.85.146.177]:39103 "EHLO
	wa-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756705AbZDQLT1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Apr 2009 07:19:27 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: gregkh@suse.de, linux-next@vger.kernel.org, linux-usb@vger.kernel.org

Fix this build error when CONFIG_PM is not set:
drivers/usb/musb/musb_core.c:2232: error: 'musb_resume_early' undeclared here

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 drivers/usb/musb/musb_core.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index bc0eb1c..554a414 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2217,7 +2217,7 @@ static int musb_resume_early(struct platform_device *pdev)
 
 #else
 #define	musb_suspend	NULL
-#define	musb_resume	NULL
+#define	musb_resume_early	NULL
 #endif
 
 static struct platform_driver musb_driver = {
