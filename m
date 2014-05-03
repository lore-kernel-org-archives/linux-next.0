From: Michele CURTI <michele.curti@gmail.com>
Subject: [PATCHv3] staging/winbond: fix a style error
Date: Sat, 3 May 2014 14:36:52 +0200
Message-ID: <20140503123652.GA20840@ativ>
References: <20140325143637.GA1477@powerline.azcom-win.it>
 <20140425210618.GA24727@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ee0-f48.google.com ([74.125.83.48]:33445 "EHLO
	mail-ee0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751012AbaECMg4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 3 May 2014 08:36:56 -0400
Received: by mail-ee0-f48.google.com with SMTP id e49so2717170eek.21
        for <linux-next@vger.kernel.org>; Sat, 03 May 2014 05:36:55 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20140425210618.GA24727@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: pavel@ucw.cz, linux-next@vger.kernel.org


Removed a few spaces to fix style errors

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
-	u8	TxBuffer[ MAX_USB_TX_BUFFER_NUMBER ][ MAX_USB_TX_BUFFER ];
+	u8	TxBuffer[MAX_USB_TX_BUFFER_NUMBER][MAX_USB_TX_BUFFER];
 
 	/* For Interrupt pipe */
 	u8	EP2_buf[MAX_INTERRUPT_LENGTH];
-- 
1.9.2


On Fri, Apr 25, 2014 at 02:06:18PM -0700, Greg KH wrote:
> On Tue, Mar 25, 2014 at 03:36:37PM +0100, Michele Curti wrote:
> > 
> > Removed a few spaces that cause coding style error.
> > 
> > Signed-off-by: Michele Curti <michele.curti@gmail.com>
> > Acked-by: Pavel Machek <pavel@ucw.cz>
> > 
> > ---
> >  drivers/staging/winbond/wb35tx_s.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > diff --git a/drivers/staging/winbond/wb35tx_s.h b/drivers/staging/winbond/wb35tx_s.h
> > index 715f87d..dc12008 100644
> > --- a/drivers/staging/winbond/wb35tx_s.h
> > +++ b/drivers/staging/winbond/wb35tx_s.h
> > @@ -12,7 +12,7 @@
> >  /* Internal variable for module */
> >  struct wb35_tx {
> >         /* For Tx buffer */
> > -       u8      TxBuffer[ MAX_USB_TX_BUFFER_NUMBER ][ MAX_USB_TX_BUFFER ];
> > +       u8      TxBuffer[MAX_USB_TX_BUFFER_NUMBER][MAX_USB_TX_BUFFER];
> > 
> >         /* For Interrupt pipe */
> >         u8      EP2_buf[MAX_INTERRUPT_LENGTH];
> 
> The patch is whitespace damaged and can not be applied :(

Sorry,
Michele
