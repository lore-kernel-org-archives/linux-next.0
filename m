From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree with the  ttydevtree
Date: Wed, 29 Apr 2009 16:22:28 +1000
Message-ID: <20090429162228.752887ac.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50515 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755521AbZD2GWb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Apr 2009 02:22:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Elina Pasheva <epasheva@sierrawireless.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in
drivers/usb/serial/sierra.c between commit
e675a5b8305a4d244273c34698ba411ddcc0f42a ("tty-usb-use-port") from the
ttydev tree and commit 7b8163621c22ea34636314da663b9cdea50342be ("USB:
serial: sierra driver debug info visibility improvement") from the usb
tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/usb/serial/sierra.c
index 1319b89,4d02b83..0000000
--- a/drivers/usb/serial/sierra.c
+++ b/drivers/usb/serial/sierra.c
@@@ -245,9 -246,8 +245,9 @@@ static int sierra_send_setup(struct usb
  	struct usb_serial *serial = port->serial;
  	struct sierra_port_private *portdata;
  	__u16 interface = 0;
 +	int val = 0;
  
- 	dev_dbg(&port->dev, "%s", __func__);
+ 	dev_dbg(&port->dev, "%s\n", __func__);
  
  	portdata = usb_get_serial_port_data(port);
  
@@@ -279,9 -297,9 +279,9 @@@
  static void sierra_set_termios(struct tty_struct *tty,
  		struct usb_serial_port *port, struct ktermios *old_termios)
  {
- 	dev_dbg(&port->dev, "%s", __func__);
+ 	dev_dbg(&port->dev, "%s\n", __func__);
  	tty_termios_copy_hw(tty->termios, old_termios);
 -	sierra_send_setup(tty, port);
 +	sierra_send_setup(port);
  }
  
  static int sierra_tiocmget(struct tty_struct *tty, struct file *file)
@@@ -604,21 -626,9 +604,21 @@@ static void sierra_dtr_rts(struct usb_s
  	if (serial->dev) {
  		mutex_lock(&serial->disc_mutex);
  		if (!serial->disconnected)
 -			sierra_send_setup(tty, port);
 +			sierra_send_setup(port);
  		mutex_unlock(&serial->disc_mutex);
 +	}
 +}
 +
 +static void sierra_close(struct usb_serial_port *port)
 +{
 +	int i;
 +	struct usb_serial *serial = port->serial;
 +	struct sierra_port_private *portdata;
  
- 	dev_dbg(&port->dev, "%s", __func__);
++	dev_dbg(&port->dev, "%s\n", __func__);
 +	portdata = usb_get_serial_port_data(port);
 +
 +	if (serial->dev) {
  		/* Stop reading/writing urbs */
  		for (i = 0; i < N_IN_URB; i++)
  			usb_kill_urb(portdata->in_urbs[i]);
