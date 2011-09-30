From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] drivers/usb: Add module.h to various dwc3 drivers
Date: Fri, 30 Sep 2011 18:08:59 -0400
Message-ID: <1317420539-28541-1-git-send-email-paul.gortmaker@windriver.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:43266 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755610Ab1I3WJK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 30 Sep 2011 18:09:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: gregkh@suse.de
Cc: linux-usb@vger.kernel.org, linux-next@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>

These files uses the full set of MODULE_ macros and so need to
include module.h directly.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 443e4fb..20d0503 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -51,6 +51,7 @@
 
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
+#include <linux/module.h>
 
 #include "core.h"
 #include "gadget.h"
diff --git a/drivers/usb/dwc3/dwc3-omap.c b/drivers/usb/dwc3/dwc3-omap.c
index 08fffe6..b4a654e 100644
--- a/drivers/usb/dwc3/dwc3-omap.c
+++ b/drivers/usb/dwc3/dwc3-omap.c
@@ -45,6 +45,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/ioport.h>
 #include <linux/io.h>
+#include <linux/module.h>
 
 #include "io.h"
 
-- 
1.7.6
