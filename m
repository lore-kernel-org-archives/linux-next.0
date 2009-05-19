From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: staging: cpc-usb: wrong Makefile path
Date: Tue, 19 May 2009 21:09:53 +0400
Message-ID: <a4423d670905191009i450545f6le9c49e84c5ce94fd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f158.google.com ([209.85.220.158]:32798 "EHLO
	mail-fx0-f158.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752392AbZESRJx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 May 2009 13:09:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next <linux-next@vger.kernel.org>, Greg KH <gregkh@suse.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index 9492a6f..cc1aac2 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -40,4 +40,4 @@ obj-$(CONFIG_PLAN9AUTH)               += p9auth/
 obj-$(CONFIG_HECI)             += heci/
 obj-$(CONFIG_LINE6_USB)                += line6/
 obj-$(CONFIG_USB_SERIAL_QUATECH_ESU100)        += serqt_usb/
-obj-$(CONFIG_USB_CPC)          += cpc_usb/
+obj-$(CONFIG_USB_CPC)          += cpc-usb/
