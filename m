From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] usb/otg: fix twl4030-usb build
Date: Tue, 11 Aug 2009 11:31:31 -0700
Message-ID: <20090811113131.44db4177.randy.dunlap@oracle.com>
References: <20090811183434.28afaf80.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:33440 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753075AbZHKScs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 11 Aug 2009 14:32:48 -0400
In-Reply-To: <20090811183434.28afaf80.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Felipe Balbi <felipe.balbi@nokia.com>, gregkh@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

subsys_initcall_sync() is only defined for built-in code, not for
loadable modules, so this driver build fails when built as a module.
However, the _sync() forms of the initcalls are not implemented,
so this should not be used -- just use the non-sync form of it.

drivers/usb/otg/twl4030-usb.c:777: warning: data definition has no type or storage class
drivers/usb/otg/twl4030-usb.c:777: warning: type defaults to 'int' in declaration of 'subsys_initcall_sync'
drivers/usb/otg/twl4030-usb.c:777: warning: parameter names (without types) in function declaration

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Felipe Balbi <felipe.balbi@nokia.com>
---
 drivers/usb/otg/twl4030-usb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20090811.orig/drivers/usb/otg/twl4030-usb.c
+++ linux-next-20090811/drivers/usb/otg/twl4030-usb.c
@@ -774,7 +774,7 @@ static int __init twl4030_usb_init(void)
 {
 	return platform_driver_register(&twl4030_usb_driver);
 }
-subsys_initcall_sync(twl4030_usb_init);
+subsys_initcall(twl4030_usb_init);
 
 static void __exit twl4030_usb_exit(void)
 {



---
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
