From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] ar9170: fix build when !CONFIG_PM
Date: Mon,  4 May 2009 20:46:25 +0400
Message-ID: <1241455585-436-1-git-send-email-a.beregalov@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f224.google.com ([209.85.219.224]:34194 "EHLO
	mail-ew0-f224.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752436AbZEDQq3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 May 2009 12:46:29 -0400
Received: by ewy24 with SMTP id 24so4110267ewy.37
        for <linux-next@vger.kernel.org>; Mon, 04 May 2009 09:46:29 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, hunkeey@web.de, johannes@sipsolutions.net, linville@tuxdriver.com
Cc: Alexander Beregalov <a.beregalov@gmail.com>

Fix this build error when CONFIG_PM is not set:
drivers/net/wireless/ath/ar9170/usb.c: In function 'ar9170_usb_probe':
drivers/net/wireless/ath/ar9170/usb.c:692:
	error: 'struct usb_device' has no member named 'reset_resume'

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---
 drivers/net/wireless/ath/ar9170/usb.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/net/wireless/ath/ar9170/usb.c b/drivers/net/wireless/ath/ar9170/usb.c
index d7b562d..d7c13c0 100644
--- a/drivers/net/wireless/ath/ar9170/usb.c
+++ b/drivers/net/wireless/ath/ar9170/usb.c
@@ -689,7 +689,9 @@ static int ar9170_usb_probe(struct usb_interface *intf,
 	aru->common.exec_cmd = ar9170_usb_exec_cmd;
 	aru->common.callback_cmd = ar9170_usb_callback_cmd;
 
+#ifdef CONFIG_PM
 	udev->reset_resume = 1;
+#endif
 	err = ar9170_usb_reset(aru);
 	if (err)
 		goto err_freehw;
-- 
1.6.2.3
