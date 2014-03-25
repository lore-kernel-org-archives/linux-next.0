From: Michele Curti <michele.curti@gmail.com>
Subject: [PATCHv2] staging/winbond: fix a style error
Date: Tue, 25 Mar 2014 15:36:37 +0100
Message-ID: <20140325143637.GA1477@powerline.azcom-win.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ee0-f45.google.com ([74.125.83.45]:58766 "EHLO
	mail-ee0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752070AbaCYOgl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Mar 2014 10:36:41 -0400
Received: by mail-ee0-f45.google.com with SMTP id d17so530302eek.4
        for <linux-next@vger.kernel.org>; Tue, 25 Mar 2014 07:36:40 -0700 (PDT)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: pavel@ucw.cz, gregkh@linuxfoundation.org


Removed a few spaces that cause coding style error.

Signed-off-by: Michele Curti <michele.curti@gmail.com>

---
 drivers/staging/winbond/wb35tx_s.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/drivers/staging/winbond/wb35tx_s.h b/drivers/staging/winbond/wb35tx_s.h
index 715f87d..dc12008 100644
--- a/drivers/staging/winbond/wb35tx_s.h
+++ b/drivers/staging/winbond/wb35tx_s.h
@@ -12,7 +12,7 @@
 /* Internal variable for module */
 struct wb35_tx {
        /* For Tx buffer */
-       u8      TxBuffer[ MAX_USB_TX_BUFFER_NUMBER ][ MAX_USB_TX_BUFFER ];
+       u8      TxBuffer[MAX_USB_TX_BUFFER_NUMBER][MAX_USB_TX_BUFFER];

        /* For Interrupt pipe */
        u8      EP2_buf[MAX_INTERRUPT_LENGTH];
