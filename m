From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: [PATCH 2/3] leds: led-pca955x.c make pca955x_led_set static
Date: Thu, 17 Jul 2008 14:22:35 -0700
Message-ID: <1216329755.6029.30.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.173]:50666 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758631AbYGQVWh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Jul 2008 17:22:37 -0400
Received: by wf-out-1314.google.com with SMTP id 27so91449wfd.4
        for <linux-next@vger.kernel.org>; Thu, 17 Jul 2008 14:22:37 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Richard Purdie <rpurdie@rpsys.net>
Cc: linux-next <linux-next@vger.kernel.org>

leds-pca955x.c:229:6: warning: symbol 'pca955x_led_set' was not declared. Should it be static?

Signed-off-by: Harvey Harrison <harvey.harrison@gmail.com>
---
Appeared between next-20080716 and next-20080717

 drivers/leds/leds-pca955x.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 146c069..3dbc880 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -226,7 +226,7 @@ static void pca955x_led_work(struct work_struct *work)
 	pca955x_write_ls(pca955x->client, chip_ls, ls);
 }
 
-void pca955x_led_set(struct led_classdev *led_cdev, enum led_brightness value)
+static void pca955x_led_set(struct led_classdev *led_cdev, enum led_brightness value)
 {
 	struct pca955x_led *pca955x;
 
-- 
1.5.6.3.536.g61aad
