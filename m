From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the uwb tree
Date: Mon, 29 Dec 2008 23:30:54 +1100
Message-ID: <20081229233054.6e8d9a14.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50335 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750862AbYL2Ma5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 07:30:57 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Vrabel <david.vrabel@csr.com>
Cc: linux-next@vger.kernel.org, Harvey Harrison <harvey.harrison@gmail.com>, Greg KH <greg@kroah.com>

Hi David,

Today's linux-next merge of the uwb tree got a conflict in
drivers/usb/wusbcore/rh.c between commit
96f391057a3c29655b82b90d902f678d901c0eb1 ("USB: wusb: annotate
association types withe proper endianness") from the usb tree and commit
bce83697c5fe84a7a5d38c96fbbe43b4bc028c3e ("uwb: use dev_dbg() for debug
messages") from the uwb tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/usb/wusbcore/rh.c
index b1bb82d,95c6fa3..0000000
--- a/drivers/usb/wusbcore/rh.c
+++ b/drivers/usb/wusbcore/rh.c
@@@ -351,13 -326,11 +326,11 @@@ static int wusbhc_rh_clear_port_feat(st
  static int wusbhc_rh_get_port_status(struct wusbhc *wusbhc, u16 port_idx,
  				     u32 *_buf, u16 wLength)
  {
- 	int result = -EINVAL;
 -	u16 *buf = (u16 *) _buf;
 +	__le16 *buf = (__le16 *)_buf;
  
- 	d_fnstart(1, wusbhc->dev, "(wusbhc %p port_idx %u wLength %u)\n",
- 		  wusbhc, port_idx, wLength);
  	if (port_idx > wusbhc->ports_max)
- 		goto error;
+ 		return -EINVAL;
+ 
  	mutex_lock(&wusbhc->mutex);
  	buf[0] = cpu_to_le16(wusb_port_by_idx(wusbhc, port_idx)->status);
  	buf[1] = cpu_to_le16(wusb_port_by_idx(wusbhc, port_idx)->change);
