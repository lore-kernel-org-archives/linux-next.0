From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] sound: fix usb build error when PM is not enabled
Date: Mon, 22 Mar 2010 08:55:35 -0700
Message-ID: <4BA792F7.8010801@oracle.com>
References: <20100322171937.d753bdba.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:40133 "EHLO
	rcsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752203Ab0CVP6G (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 22 Mar 2010 11:58:06 -0400
In-Reply-To: <20100322171937.d753bdba.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix build errors when CONFIG_PM is not enabled:

sound/usb/card.c:629: error: 'usb_audio_suspend' undeclared here (not in a function)
sound/usb/card.c:630: error: 'usb_audio_resume' undeclared here (not in a function)

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 sound/usb/card.c |    3 +++
 1 file changed, 3 insertions(+)

--- linux-next-20100322.orig/sound/usb/card.c
+++ linux-next-20100322/sound/usb/card.c
@@ -606,6 +606,9 @@ static int usb_audio_resume(struct usb_i
 
 	return 0;
 }
+#else
+#define usb_audio_suspend	NULL
+#define usb_audio_resume	NULL
 #endif		/* CONFIG_PM */
 
 static struct usb_device_id usb_audio_ids [] = {
