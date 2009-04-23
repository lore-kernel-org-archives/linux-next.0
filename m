From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree with the usb.current
 tree
Date: Thu, 23 Apr 2009 14:49:46 +1000
Message-ID: <20090423144946.6fd91afc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48660 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750799AbZDWEtt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Apr 2009 00:49:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Elina Pasheva <epasheva@sierrawireless.com>, Greg KH <greg@kroah.com>

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/usb/serial/sierra.c between commit
72c9d57967ab2b6a32a215c6063c2943f0e48ab4 ("USB: serial: sierra driver bug
fix for composite interface") from the usb.current tree and commit
1156df675ae541b21dc343912413f201f87a3909 ("tty-usb-use-port") from the
ttydev tree.

Overlapping changes.  I fixed it up, I think (see below) and can carry
the fix as necessary.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/usb/serial/sierra.c
index 913225c,2617ea8..0000000
--- a/drivers/usb/serial/sierra.c
+++ b/drivers/usb/serial/sierra.c
@@@ -251,46 -251,28 +251,43 @@@ static int sierra_send_setup(struct usb
  
  	portdata = usb_get_serial_port_data(port);
  
- 	if (tty) {
- 		int val = 0;
- 		if (portdata->dtr_state)
- 			val |= 0x01;
- 		if (portdata->rts_state)
- 			val |= 0x02;
- 
- 		/* If composite device then properly report interface */
- 		if (serial->num_ports == 1) {
- 			interface = sierra_calc_interface(serial);
- 
- 			/* Control message is sent only to interfaces with
- 			 * interrupt_in endpoints
- 			 */
- 			if (port->interrupt_in_urb) {
- 				/* send control message */
- 				return usb_control_msg(serial->dev,
- 					usb_rcvctrlpipe(serial->dev, 0),
- 					0x22, 0x21, val, interface,
- 					NULL, 0, USB_CTRL_SET_TIMEOUT);
- 			}
- 		}
+ 	if (portdata->dtr_state)
+ 		val |= 0x01;
+ 	if (portdata->rts_state)
+ 		val |= 0x02;
  
- 		/* Otherwise the need to do non-composite mapping */
- 		else {
- 			if (port->bulk_out_endpointAddress == 2)
- 				interface = 0;
- 			else if (port->bulk_out_endpointAddress == 4)
- 				interface = 1;
- 			else if (port->bulk_out_endpointAddress == 5)
- 				interface = 2;
+ 	/* If composite device then properly report interface */
 -	if (serial->num_ports == 1)
++	if (serial->num_ports == 1) {
+ 		interface = sierra_calc_interface(serial);
  
++		/* Control message is sent only to interfaces with
++		 * interrupt_in endpoints
++		 */
++		if (port->interrupt_in_urb) {
++			/* send control message */
 +			return usb_control_msg(serial->dev,
 +				usb_rcvctrlpipe(serial->dev, 0),
 +				0x22, 0x21, val, interface,
 +				NULL, 0, USB_CTRL_SET_TIMEOUT);
- 
 +		}
 +	}
 +
+ 	/* Otherwise the need to do non-composite mapping */
+ 	else {
+ 		if (port->bulk_out_endpointAddress == 2)
+ 			interface = 0;
+ 		else if (port->bulk_out_endpointAddress == 4)
+ 			interface = 1;
+ 		else if (port->bulk_out_endpointAddress == 5)
+ 			interface = 2;
 -	}
 -	return usb_control_msg(serial->dev,
++
++		return usb_control_msg(serial->dev,
+ 			usb_rcvctrlpipe(serial->dev, 0),
+ 			0x22, 0x21, val, interface,
+ 			NULL, 0, USB_CTRL_SET_TIMEOUT);
++
++	}
++
  	return 0;
  }
  
