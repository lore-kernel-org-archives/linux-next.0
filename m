From: Alberto Panizzo <maramaopercheseimorto@gmail.com>
Subject: [PATCH] backlight: l4f00242t03: Fix module licence absence.
Date: Tue, 19 Jan 2010 09:30:50 +0100
Message-ID: <1263889850.3121.12.camel@realization>
References: <20100119150836.bb975e4b.sfr@canb.auug.org.au>
	 <1263889757.3121.10.camel@realization>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f219.google.com ([209.85.219.219]:59769 "EHLO
	mail-ew0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754315Ab0ASIax (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Jan 2010 03:30:53 -0500
In-Reply-To: <1263889757.3121.10.camel@realization>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org



Signed-off-by: Alberto Panizzo <maramaopercheseimorto@gmail.com>
---
 drivers/video/backlight/l4f00242t03.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/video/backlight/l4f00242t03.c b/drivers/video/backlight/l4f00242t03.c
index 42d061e..74abd69 100644
--- a/drivers/video/backlight/l4f00242t03.c
+++ b/drivers/video/backlight/l4f00242t03.c
@@ -254,3 +254,4 @@ module_exit(l4f00242t03_exit);
 
 MODULE_AUTHOR("Alberto Panizzo <maramaopercheseimorto@gmail.com>");
 MODULE_DESCRIPTION("EPSON L4F00242T03 LCD");
+MODULE_LICENSE("GPL v2");
-- 
1.6.3.3
