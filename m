From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Fri, 19 Sep 2008 12:57:00 +1000
Message-ID: <20080919125700.9dc9c056.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59927 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754180AbYISC5G (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Sep 2008 22:57:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/usb/serial/sierra.c between commit
4d7b9fc74ab5086b0ccc1f3dc28617c552263b7a ("USB Serial: Sierra: debug
message fix") from the usb tree and commit
6ae0d6ddae605af245c472aa574e2b4f834ce69c ("tty-usbserial-kref") from the
ttydev tree.

Just context modification.  I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/usb/serial/sierra.c
index 1a37286,7d9ab12..0000000
--- a/drivers/usb/serial/sierra.c
+++ b/drivers/usb/serial/sierra.c
@@@ -438,18 -435,17 +438,18 @@@ static void sierra_indat_callback(struc
  	port =  urb->context;
  
  	if (status) {
 -		dbg("%s: nonzero status: %d on endpoint %02x.",
 -		    __func__, status, endpoint);
 +		dev_dbg(&port->dev, "%s: nonzero status: %d on"
 +		    " endpoint %02x.", __func__, status, endpoint);
  	} else {
- 		tty = port->port.tty;
  		if (urb->actual_length) {
+ 		tty = tty_port_tty_get(&port->port);
  			tty_buffer_request_room(tty, urb->actual_length);
  			tty_insert_flip_string(tty, data, urb->actual_length);
  			tty_flip_buffer_push(tty);
- 		} else {
+ 			tty_kref_put(tty);
+ 		} else
 -			dbg("%s: empty read urb received", __func__);
 +			dev_dbg(&port->dev, "%s: empty read urb"
 +				" received", __func__);
- 		}
  
  		/* Resubmit urb so we continue receiving */
  		if (port->port.count && status != -ESHUTDOWN) {
@@@ -489,9 -483,9 +489,10 @@@ static void sierra_instat_callback(stru
  			unsigned char signals = *((unsigned char *)
  					urb->transfer_buffer +
  					sizeof(struct usb_ctrlrequest));
+ 			struct tty_struct *tty;
  
 -			dbg("%s: signal x%x", __func__, signals);
 +			dev_dbg(&port->dev, "%s: signal x%x", __func__,
 +				signals);
  
  			old_dcd_state = portdata->dcd_state;
  			portdata->cts_state = 1;
@@@ -499,16 -493,17 +500,18 @@@
  			portdata->dsr_state = ((signals & 0x02) ? 1 : 0);
  			portdata->ri_state = ((signals & 0x08) ? 1 : 0);
  
- 			if (port->port.tty && !C_CLOCAL(port->port.tty) &&
+ 			tty = tty_port_tty_get(&port->port);
+ 			if (tty && !C_CLOCAL(tty) &&
  					old_dcd_state && !portdata->dcd_state)
- 				tty_hangup(port->port.tty);
+ 				tty_hangup(tty);
+ 			tty_kref_put(tty);
  		} else {
 -			dbg("%s: type %x req %x", __func__,
 -				req_pkt->bRequestType, req_pkt->bRequest);
 +			dev_dbg(&port->dev, "%s: type %x req %x",
 +				__func__, req_pkt->bRequestType,
 +				req_pkt->bRequest);
  		}
  	} else
 -		dbg("%s: error %d", __func__, status);
 +		dev_dbg(&port->dev, "%s: error %d", __func__, status);
  
  	/* Resubmit urb so we continue receiving IRQ data */
  	if (status != -ESHUTDOWN) {
