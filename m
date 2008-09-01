From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree
Date: Mon, 1 Sep 2008 13:14:58 +1000
Message-ID: <20080901131458.24ac7832.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34074 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750927AbYIADPG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 31 Aug 2008 23:15:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>, Hans Verkuil <hverkuil@xs4all.nl>

Hi Mauro,

Today's linux-next merge of the v4l-dvb tree got a conflict in
drivers/media/radio/dsbr100.c between commit
59d1f04f76c8386d468f74c18fe5c008752c9340 ("USB: remove warn() macro from
usb.h") from the usb tree and commit
63057954eb49549963c4c5079381492575cab33a ("V4L/DVB (8778): radio: fix
incorrect video_register_device result check") from the v4l-dvb tree.

Just a context clash.  I fixed it up (see below) and can carry the fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/media/radio/dsbr100.c
index d8e3857,0f06e6f..0000000
--- a/drivers/media/radio/dsbr100.c
+++ b/drivers/media/radio/dsbr100.c
@@@ -413,9 -412,9 +414,10 @@@ static int usb_dsbr100_open(struct inod
  	radio->muted = 1;
  
  	if (dsbr100_start(radio)<0) {
 -		warn("Radio did not start up properly");
 +		dev_warn(&radio->usbdev->dev,
 +			 "Radio did not start up properly\n");
  		radio->users = 0;
+ 		unlock_kernel();
  		return -EIO;
  	}
  	dsbr100_setfreq(radio, radio->curfreq);
@@@ -496,8 -496,8 +499,8 @@@ static int usb_dsbr100_probe(struct usb
  	radio->usbdev = interface_to_usbdev(intf);
  	radio->curfreq = FREQ_MIN*FREQ_MUL;
  	video_set_drvdata(radio->videodev, radio);
- 	if (video_register_device(radio->videodev, VFL_TYPE_RADIO,radio_nr)) {
+ 	if (video_register_device(radio->videodev, VFL_TYPE_RADIO, radio_nr) < 0) {
 -		warn("Could not register video device");
 +		dev_warn(&intf->dev, "Could not register video device\n");
  		video_device_release(radio->videodev);
  		kfree(radio->transfer_buffer);
  		kfree(radio);
