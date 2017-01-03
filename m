From: Galo Navarro <anglorvaroa@gmail.com>
Subject: [PATCH] staging: rtl8188eu: fix incorrect ERROR tags from logs
Date: Tue, 3 Jan 2017 23:12:09 +0100
Message-ID: <20170103221147.GA28676@lear>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wj0-f194.google.com ([209.85.210.194]:36454 "EHLO
        mail-wj0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757209AbdACWNC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Jan 2017 17:13:02 -0500
Received: by mail-wj0-f194.google.com with SMTP id j10so73561875wjb.3
        for <linux-next@vger.kernel.org>; Tue, 03 Jan 2017 14:13:02 -0800 (PST)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>

Several lifecycle events in the rtl8188eu driver are logged using the
DBG_88E_LEVEL macro from rtw_debug.h, which is tagged as ERROR
regardless of the actual level.  Below are dmesg excerpts after loading
and unloading the module, the messages are misleading as there was no
error.

    [517434.916239] usbcore: registered new interface driver r8188eu
    [517435.680653] R8188EU: ERROR indicate disassoc
    [517437.122606] R8188EU: ERROR assoc success
    [517797.735611] usbcore: deregistering interface driver r8188eu
    [517797.736069] R8188EU: ERROR indicate disassoc

Remove the ERROR prefix from the logs.  After the patch, logs are:

    [517949.873976] usbcore: registered new interface driver r8188eu
    [517950.592845] R8188EU: indicate disassoc
    [517951.993973] R8188EU: assoc success
    [521778.784448] usbcore: deregistering interface driver r8188eu
    [521778.784838] R8188EU: indicate disassoc

Signed-off-by: Galo Navarro <anglorvaroa@gmail.com>
---
 drivers/staging/rtl8188eu/include/rtw_debug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/include/rtw_debug.h b/drivers/staging/rtl8188eu/include/rtw_debug.h
index 95590a1..9cc4b8c 100644
--- a/drivers/staging/rtl8188eu/include/rtw_debug.h
+++ b/drivers/staging/rtl8188eu/include/rtw_debug.h
@@ -70,7 +70,7 @@ extern u32 GlobalDebugLevel;
 #define DBG_88E_LEVEL(_level, fmt, arg...)				\
 	do {								\
 		if (_level <= GlobalDebugLevel)				\
-			pr_info(DRIVER_PREFIX"ERROR " fmt, ##arg);	\
+			pr_info(DRIVER_PREFIX fmt, ##arg);	\
 	} while (0)
 
 #define DBG_88E(...)							\
-- 
2.1.4
