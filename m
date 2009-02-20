From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] mimio: depends on INPUT
Date: Fri, 20 Feb 2009 08:48:18 -0800
Message-ID: <499EDED2.2030102@oracle.com>
References: <20090220201224.3f32ae24.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:30079 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753116AbZBTQrj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Feb 2009 11:47:39 -0500
In-Reply-To: <20090220201224.3f32ae24.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@suse.de>, mwilder@cs.nmsu.edu

From: Randy Dunlap <randy.dunlap@oracle.com>

mimio driver uses input_* functions so it needs to depend on INPUT.

mimio.c:(.text+0x2526c9): undefined reference to `input_unregister_device'
mimio.c:(.text+0x2526da): undefined reference to `input_close_device'
mimio.c:(.text+0x252725): undefined reference to `input_free_device'
mimio.c:(.text+0x2528f1): undefined reference to `input_event'
mimio.c:(.text+0x252904): undefined reference to `input_event'
mimio.c:(.text+0x252921): undefined reference to `input_event'
mimio.c:(.text+0x252b3e): undefined reference to `input_event'
mimio.c:(.text+0x252b51): undefined reference to `input_event'
drivers/built-in.o:mimio.c:(.text+0x252bbd): more undefined references to `input_event' follow
mimio.c:(.text+0x252e42): undefined reference to `input_allocate_device'
mimio.c:(.text+0x2530ef): undefined reference to `input_register_device'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
cc: mwilder@cs.nmsu.edu
---
 drivers/staging/mimio/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20090220.orig/drivers/staging/mimio/Kconfig
+++ linux-next-20090220/drivers/staging/mimio/Kconfig
@@ -1,6 +1,6 @@
 config INPUT_MIMIO
 	tristate "Mimio Xi interactive whiteboard support"
-	depends on USB
+	depends on USB && INPUT
 	default N
 	help
 	  Say Y here if you want to use a Mimio Xi interactive
