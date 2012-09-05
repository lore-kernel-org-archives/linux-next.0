From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] extcon: extcon-arizona depends on INPUT
Date: Wed, 05 Sep 2012 13:18:53 -0700
Message-ID: <5047B3AD.4080307@xenotime.net>
References: <20120824172820.ee0f412d2944b08789414207@canb.auug.org.au> <5037B41C.6040703@xenotime.net> <503AB70E.2000407@samsung.com> <504693E4.8050808@xenotime.net> <20120905032802.GB5076@opensource.wolfsonmicro.com> <20120905191657.GA5842@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy7-pub.bluehost.com ([67.222.55.9]:38181 "HELO
	oproxy7-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754901Ab2IEUTQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 Sep 2012 16:19:16 -0400
In-Reply-To: <20120905191657.GA5842@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Chanwoo Choi <cw00.choi@samsung.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>

From: Randy Dunlap <rdunlap@xenotime.net>

extcon-arizona uses input_*() functions so it should depend
on INPUT.

ERROR: "input_event" [drivers/extcon/extcon-arizona.ko] undefined!
ERROR: "input_free_device" [drivers/extcon/extcon-arizona.ko] undefined!
ERROR: "input_register_device" [drivers/extcon/extcon-arizona.ko] undefined!
ERROR: "input_set_capability" [drivers/extcon/extcon-arizona.ko] undefined!
ERROR: "input_allocate_device" [drivers/extcon/extcon-arizona.ko] undefined!
ERROR: "input_unregister_device" [drivers/extcon/extcon-arizona.ko] undefined!

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 drivers/extcon/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20120824.orig/drivers/extcon/Kconfig
+++ linux-next-20120824/drivers/extcon/Kconfig
@@ -41,7 +41,7 @@ config EXTCON_MAX8997
 
 config EXTCON_ARIZONA
 	tristate "Wolfson Arizona EXTCON support"
-	depends on MFD_ARIZONA
+	depends on MFD_ARIZONA && INPUT
 	help
 	  Say Y here to enable support for external accessory detection
 	  with Wolfson Arizona devices. These are audio CODECs with
