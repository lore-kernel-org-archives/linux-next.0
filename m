From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree with Linus' tree
Date: Wed, 2 Sep 2009 12:17:13 +1000
Message-ID: <20090902121713.f709b1ce.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42770 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932098AbZIBCRP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Sep 2009 22:17:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Randy Dunlap <randy.dunlap@oracle.com>

Hi Mauro,

Today's linux-next merge of the v4l-dvb tree got a conflict in
drivers/media/video/gspca/Kconfig between commit
b6b85048c059e3f085095e48e12ed3f7a92c88d4 ("V4L/DVB (12502): gspca -
sn9c20x: Fix gscpa sn9c20x build errors") from Linus' tree and commit
7b5ab5558fbce09584d8795bc91eb64d8c685782 ("V4L/DVB (12452):
gspca/Kconfig: Fix bad identation for USB_GSPCA_SN9C20X_EVDEV") from the
v4l-dvb tree.

I fixed it up (see below) and will carry the fix for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/media/video/gspca/Kconfig
index e994dca,6ae1522..0000000
--- a/drivers/media/video/gspca/Kconfig
+++ b/drivers/media/video/gspca/Kconfig
@@@ -113,10 -122,10 +122,10 @@@ config USB_GSPCA_SN9C20
  	 module will be called gspca_sn9c20x.
  
  config USB_GSPCA_SN9C20X_EVDEV
-        bool "Enable evdev support"
+ 	bool "Enable evdev support"
 -	depends on USB_GSPCA_SN9C20X
 +	depends on USB_GSPCA_SN9C20X && INPUT
-        ---help---
- 	 Say Y here in order to enable evdev support for sn9c20x webcam button.
+ 	---help---
+ 	  Say Y here in order to enable evdev support for sn9c20x webcam button.
  
  config USB_GSPCA_SONIXB
  	tristate "SONIX Bayer USB Camera Driver"
