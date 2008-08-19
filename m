From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Tue, 19 Aug 2008 17:43:10 +1000
Message-ID: <20080819174310.1eec34dc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42510 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752271AbYHSHnR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 Aug 2008 03:43:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/usb/serial/safe_serial.c between commit
8aac48f4f2460b00468fd5f1101addf3df04e94c ("USB: remove info() macro from
usb.h") from the usb tree and commit
5e6c4a742d494b0b049d7f01ce00da5b351d2cb8 ("tty-usbserial-kref") from the
ttydev tree.

These changes modify each others context.  I fixed it up (see below) and
can carry the fix.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/usb/serial/safe_serial.c
index e1f10a1,72903ac..0000000
--- a/drivers/usb/serial/safe_serial.c
+++ b/drivers/usb/serial/safe_serial.c
@@@ -248,11 -250,11 +250,11 @@@ static void safe_read_bulk_callback(str
  		if (!fcs) {
  			int actual_length = data[length - 2] >> 2;
  			if (actual_length <= (length - 2)) {
 -				info("%s - actual: %d", __func__,
 -							actual_length);
 +				dev_info(&urb->dev->dev, "%s - actual: %d\n",
 +					 __func__, actual_length);
- 				tty_insert_flip_string(port->port.tty,
+ 				tty_insert_flip_string(tty,
  							data, actual_length);
- 				tty_flip_buffer_push(port->port.tty);
+ 				tty_flip_buffer_push(tty);
  			} else {
  				err("%s - inconsistent lengths %d:%d",
  					__func__, actual_length, length);
