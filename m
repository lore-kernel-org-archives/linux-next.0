From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for September 4 (PATCH: SND_USB)
Date: Thu, 4 Sep 2008 20:28:13 -0700
Message-ID: <20080904202813.4a6d9ca2.randy.dunlap@oracle.com>
References: <20080904193606.573f2cb3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:25794 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752598AbYIED2d (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Sep 2008 23:28:33 -0400
In-Reply-To: <20080904193606.573f2cb3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, tiwai@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

CONFIG_SND_USB_US122L uses snd_hwdep_new(), so SND_HWDEP needs
to be enabled (selected).

ERROR: "snd_hwdep_new" [sound/usb/usx2y/snd-usb-us122l.ko] undefined!

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 sound/usb/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20080904.orig/sound/usb/Kconfig
+++ linux-next-20080904/sound/usb/Kconfig
@@ -70,6 +70,7 @@ config SND_USB_CAIAQ_INPUT
 config SND_USB_US122L
 	tristate "Tascam US-122L USB driver"
 	depends on X86 && EXPERIMENTAL
+	select SND_HWDEP
 	select SND_RAWMIDI
 	help
 	  Say Y here to include support for Tascam US-122L USB Audio/MIDI
