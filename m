From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree with the usb.current
 tree
Date: Tue, 28 Jul 2009 14:01:10 +1000
Message-ID: <20090728140110.7cfe7c22.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56396 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750710AbZG1EBN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Jul 2009 00:01:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver Neukum <oliver@neukum.org>, Greg KH <greg@kroah.com>

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/usb/serial/usb-serial.c between commit
a00b8d98aca97bfb6fa983f41dae25b424058592 ("USB: fix usage count in usb
serial generic open regarding autoresume") from the usb.current tree and
commit 73fed8403623653560cc2f35c9b62891adaf6b4b
("tty-usb-error-unlock-fix") from the ttydev tree.

Just context changes.  I have fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/usb/serial/usb-serial.c
index 06579a8,99188c9..0000000
--- a/drivers/usb/serial/usb-serial.c
+++ b/drivers/usb/serial/usb-serial.c
@@@ -220,8 -224,8 +222,8 @@@ static int serial_open (struct tty_stru
  	tty_port_tty_set(&port->port, tty);
  
  	/* If the console is attached, the device is already open */
 -	if (port->port.count == 1 && !port->console) {
 +	if (!port->port.count && !port->console) {
- 
+ 		first = 1;
  		/* lock this module before we call it
  		 * this may fail, which means we must bail out,
  		 * safe because we are called with BKL held */
@@@ -246,8 -248,7 +248,9 @@@
  		if (retval)
  			goto bailout_interface_put;
  		mutex_unlock(&serial->disc_mutex);
+ 		set_bit(ASYNCB_INITIALIZED, &port->port.flags);
 +	} else {
 +		++port->port.count;
  	}
  	mutex_unlock(&port->mutex);
  	/* Now do the correct tty layer semantics */
