From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: [PATCH] [media] gp8psk-fe: add missing MODULE_foo() macros
Date: Mon, 14 Nov 2016 11:14:37 -0200
Message-ID: <20161114111437.29317cdb@vento.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:50364 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750772AbcKNNOn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Nov 2016 08:14:43 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

This file was converted to a separate module at commit
7a0786c19d65 ("gp8psk: Fix DVB frontend attach"), because
the DVB attach routines require it to work. However,
I forgot to copy the MODULE_foo() macros from the original
module, causing this warning:
	WARNING: modpost: missing MODULE_LICENSE() in drivers/media/dvb-frontends/gp8psk-fe.o

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 7a0786c19d65 ("gp8psk: Fix DVB frontend attach")
Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>

diff --git a/drivers/media/dvb-frontends/gp8psk-fe.c b/drivers/media/dvb-frontends/gp8psk-fe.c
index be19afeed7a9..93f59bfea092 100644
--- a/drivers/media/dvb-frontends/gp8psk-fe.c
+++ b/drivers/media/dvb-frontends/gp8psk-fe.c
@@ -1,5 +1,5 @@
-/* DVB USB compliant Linux driver for the
- *  - GENPIX 8pks/qpsk/DCII USB2.0 DVB-S module
+/*
+ * Frontend driver for the GENPIX 8pks/qpsk/DCII USB2.0 DVB-S module
  *
  * Copyright (C) 2006,2007 Alan Nisota (alannisota@gmail.com)
  * Copyright (C) 2006,2007 Genpix Electronics (genpix@genpix-electronics.com)
@@ -8,11 +8,9 @@
  *
  * This module is based off the vp7045 and vp702x modules
  *
- *	This program is free software; you can redistribute it and/or modify it
- *	under the terms of the GNU General Public License as published by the Free
- *	Software Foundation, version 2.
- *
- * see Documentation/dvb/README.dvb-usb for more information
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the Free
+ * Software Foundation, version 2.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -395,3 +393,8 @@ static struct dvb_frontend_ops gp8psk_fe_ops = {
 	.dishnetwork_send_legacy_command = gp8psk_fe_send_legacy_dish_cmd,
 	.enable_high_lnb_voltage = gp8psk_fe_enable_high_lnb_voltage
 };
+
+MODULE_AUTHOR("Alan Nisota <alannisota@gamil.com>");
+MODULE_DESCRIPTION("Frontend Driver for Genpix DVB-S");
+MODULE_VERSION("1.1");
+MODULE_LICENSE("GPL");


Thanks,
Mauro
