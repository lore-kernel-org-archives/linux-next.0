From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Thu, 21 Aug 2008 18:03:08 +1000
Message-ID: <20080821180308.141bccb7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43524 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754592AbYHUIDO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Aug 2008 04:03:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

Hi Alan,

Today's linux-next merge of the ttydev tree got trivial conflicts in
drivers/usb/serial/aircable.c and drivers/usb/serial/keyspan_pda.c
between commit 7b4dc5ed3acb8410fd078a6876d01c206af803ed ("USB: remove use
of err() in drivers/usb/serial") from the usb tree and commit
9c3656d0341bc2763b3f4abc9484776ff28c1c12 ("tty-usbserial-kref") from the
ttydev tree.

Just overlapping context of changes. I fixed it up (see below).  I assume
that the err -> dev_err changes could be added to your tree, Alan.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/usb/serial/aircable.c
index 27ea680,67dc982..0000000
--- a/drivers/usb/serial/aircable.c
+++ b/drivers/usb/serial/aircable.c
@@@ -287,9 -287,8 +287,9 @@@ static void aircable_read(struct work_s
  
  	tty_prepare_flip_string(tty, &data, count);
  	if (!data) {
 -		err("%s- kzalloc(%d) failed.", __func__, count);
 +		dev_err(&port->dev, "%s- kzalloc(%d) failed.\n",
 +			__func__, count);
- 		return;
+ 		goto out;
  	}
  
  	serial_buf_get(priv->rx_buf, data, count);
diff --cc drivers/usb/serial/keyspan_pda.c
index 507f8bd,d799883..0000000
--- a/drivers/usb/serial/keyspan_pda.c
+++ b/drivers/usb/serial/keyspan_pda.c
@@@ -261,9 -262,10 +262,11 @@@ static void keyspan_pda_rx_interrupt(st
  exit:
  	retval = usb_submit_urb(urb, GFP_ATOMIC);
  	if (retval)
 -		err("%s - usb_submit_urb failed with result %d",
 -		     __func__, retval);
 +		dev_err(&port->dev,
 +			"%s - usb_submit_urb failed with result %d\n",
 +			__func__, retval);
+ out:
+ 	tty_kref_put(tty);		     
  }
  
  
