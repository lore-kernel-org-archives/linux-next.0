From: "Richard A. Holden III" <aciddeath@gmail.com>
Subject: [PATCH] Remove unused variables from the cirrusfb driver
Date: Thu, 20 Nov 2008 11:03:22 -0700
Message-ID: <1227204203-32112-2-git-send-email-aciddeath@gmail.com>
References: <1227204203-32112-1-git-send-email-aciddeath@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.233]:11249 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755349AbYKTRBb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 20 Nov 2008 12:01:31 -0500
Received: by rv-out-0506.google.com with SMTP id k40so541083rvb.1
        for <linux-next@vger.kernel.org>; Thu, 20 Nov 2008 09:01:31 -0800 (PST)
In-Reply-To: <1227204203-32112-1-git-send-email-aciddeath@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Remove i and s vars from cirrusfb_setup as they are not used
anywhere in that function. This fixes 2 unused vars build warnings.

Signed-off-by: Richard A. Holden III <aciddeath@gmail.com>
---
 drivers/video/cirrusfb.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/video/cirrusfb.c b/drivers/video/cirrusfb.c
index 8a87602..a2aa6dd 100644
--- a/drivers/video/cirrusfb.c
+++ b/drivers/video/cirrusfb.c
@@ -2462,8 +2462,7 @@ static int __init cirrusfb_init(void)
 
 #ifndef MODULE
 static int __init cirrusfb_setup(char *options) {
-	char *this_opt, s[32];
-	int i;
+	char *this_opt;
 
 	DPRINTK("ENTER\n");
 
-- 
1.5.6.4
