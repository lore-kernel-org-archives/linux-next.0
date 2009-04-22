From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the wireless tree with the v4l-dvb tree
Date: Wed, 22 Apr 2009 11:23:40 +1000
Message-ID: <20090422112340.c011ded7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49062 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753797AbZDVBXr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Apr 2009 21:23:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, Uri Shkolnik <uris@siano-ms.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, Bing Zhao <bzhao@marvell.com>, Kiran Divekar <dkiran@marvell.com>

Hi John,

Today's linux-next merge of the wireless tree got a conflict in
include/linux/mmc/sdio_ids.h between commit
0e15bf43186b0761ff91ffe226a6a61306aa5d97 ("V4L/DVB (11239): sdio: add
cards ids for sms (Siano Mobile Silicon) MDTV receivers") from the
v4l-dvb tree and commit 45f107f456bb79583abc767cdbcf5fbc96231510
("libertas: add support for Marvell SD8688 chip") from the wireless tree.

Juts overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/linux/mmc/sdio_ids.h
index 3d7533d,c7211ab..0000000
--- a/include/linux/mmc/sdio_ids.h
+++ b/include/linux/mmc/sdio_ids.h
@@@ -24,14 -24,8 +24,16 @@@
   */
  
  #define SDIO_VENDOR_ID_MARVELL			0x02df
 +#define SDIO_VENDOR_ID_SIANO			0x039a
 +
  #define SDIO_DEVICE_ID_MARVELL_LIBERTAS		0x9103
+ #define SDIO_DEVICE_ID_MARVELL_8688WLAN		0x9104
+ #define SDIO_DEVICE_ID_MARVELL_8688BT		0x9105
 +#define SDIO_DEVICE_ID_SIANO_STELLAR 		0x5347
 +#define SDIO_DEVICE_ID_SIANO_NOVA_A0		0x1100
 +#define SDIO_DEVICE_ID_SIANO_NOVA_B0		0x0201
 +#define SDIO_DEVICE_ID_SIANO_NICE		0x0202
 +#define SDIO_DEVICE_ID_SIANO_VEGA_A0		0x0300
 +#define SDIO_DEVICE_ID_SIANO_VENICE		0x0301
  
  #endif
