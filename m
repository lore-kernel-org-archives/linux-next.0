From: Michele CURTI <michele.curti@gmail.com>
Subject: [PATCH] staging/winbond: fix a style error
Date: Tue, 25 Mar 2014 07:29:52 +0100
Message-ID: <20140325062952.GA1026@ativ>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ee0-f52.google.com ([74.125.83.52]:44717 "EHLO
	mail-ee0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750830AbaCYG34 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Mar 2014 02:29:56 -0400
Received: by mail-ee0-f52.google.com with SMTP id e49so18334eek.11
        for <linux-next@vger.kernel.org>; Mon, 24 Mar 2014 23:29:55 -0700 (PDT)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: pavel@ucw.cz, gregkh@linuxfoundation.org

Removed a few spaces.


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

Signed-off-by: Michele Curti <michele.curti@gmail.com>


Regards,
Michele
