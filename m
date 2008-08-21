From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] fb: metronome printk format warning
Date: Thu, 21 Aug 2008 13:38:36 -0700
Message-ID: <20080821133836.1c880abe.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:54646 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751705AbYHUUi2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Aug 2008 16:38:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: frame+buffer@ml.breakpoint.cc, linux-fbdev-devel@lists.sourceforge.net
Cc: jayakumar.lkml@gmail.com, linux-next@vger.kernel.org, akpm <akpm@linux-foundation.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk format warning:

linux-next-20080821/drivers/video/metronomefb.c:191: warning: format '%d' expects type 'int', but argument 4 has type 'size_t

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/video/metronomefb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20080821.orig/drivers/video/metronomefb.c
+++ linux-next-20080821/drivers/video/metronomefb.c
@@ -188,7 +188,7 @@ static int __devinit load_waveform(u8 *m
 		epd_frame_table[par->dt].wfm_size = user_wfm_size;
 
 	if (size != epd_frame_table[par->dt].wfm_size) {
-		dev_err(dev, "Error: unexpected size %d != %d\n", size,
+		dev_err(dev, "Error: unexpected size %zu != %d\n", size,
 					epd_frame_table[par->dt].wfm_size);
 		return -EINVAL;
 	}


---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
