From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] platform/X86: fix dell-laptop function prototypes
Date: Tue, 01 Nov 2011 14:53:25 -0700
Message-ID: <4EB06A55.5080500@xenotime.net>
References: <20111101205323.c12f2f940f23febba8ab8989@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:60225 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753999Ab1KAVxz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Nov 2011 17:53:55 -0400
In-Reply-To: <20111101205323.c12f2f940f23febba8ab8989@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Matthew Garrett <mjg@redhat.com>

From: Randy Dunlap <rdunlap@xenotime.net>

Fix build warnings:
drivers/platform/x86/dell-laptop.c:592:13: warning: function declaration isn't a prototype
drivers/platform/x86/dell-laptop.c:599:13: warning: function declaration isn't a prototype

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc: Matthew Garrett <mjg@redhat.com>
---
 drivers/platform/x86/dell-laptop.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- next-2011-1101.orig/drivers/platform/x86/dell-laptop.c
+++ next-2011-1101/drivers/platform/x86/dell-laptop.c
@@ -589,14 +589,14 @@ static const struct backlight_ops dell_o
 	.update_status  = dell_send_intensity,
 };
 
-static void touchpad_led_on()
+static void touchpad_led_on(void)
 {
 	int command = 0x97;
 	char data = 1;
 	i8042_command(&data, command | 1 << 12);
 }
 
-static void touchpad_led_off()
+static void touchpad_led_off(void)
 {
 	int command = 0x97;
 	char data = 2;
