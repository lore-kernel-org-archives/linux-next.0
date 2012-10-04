From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 2/2] MAINTAINERS: Add maintainer entry for the USB webcam gadget
Date: Thu,  4 Oct 2012 02:32:42 +0200
Message-ID: <1349310762-14209-3-git-send-email-laurent.pinchart@ideasonboard.com>
References: <506B554A.70102@xenotime.net>
 <1349310762-14209-1-git-send-email-laurent.pinchart@ideasonboard.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([95.142.166.194]:47539 "EHLO
	perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933186Ab2JDAcH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Oct 2012 20:32:07 -0400
In-Reply-To: <1349310762-14209-1-git-send-email-laurent.pinchart@ideasonboard.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-usb@vger.kernel.org
Cc: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 MAINTAINERS |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d919e3d..b118b23 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7392,6 +7392,13 @@ S:	Maintained
 F:	Documentation/video4linux/w9968cf.txt
 F:	drivers/media/video/w996*
 
+USB WEBCAM GADGET
+M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	drivers/usb/gadget/*uvc*.c
+F:	drivers/usb/gadget/webcam.c
+
 USB WIRELESS RNDIS DRIVER (rndis_wlan)
 M:	Jussi Kivilinna <jussi.kivilinna@mbnet.fi>
 L:	linux-wireless@vger.kernel.org
-- 
1.7.8.6
