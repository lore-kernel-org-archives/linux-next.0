From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure
Date: Fri, 17 Oct 2008 19:21:09 +1100
Message-ID: <20081017192109.1707f9b6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55696 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751966AbYJQI1P (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Oct 2008 04:27:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Ming Lei <tom.leiming@gmail.com>

Hi Greg,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/usb/host/ehci-dbg.c: In function 'fill_buffer':
drivers/usb/host/ehci-dbg.c:839: error: implicit declaration of function 'vmalloc'
drivers/usb/host/ehci-dbg.c:839: warning: cast to pointer from integer of different size
drivers/usb/host/ehci-dbg.c: In function 'debug_close':
drivers/usb/host/ehci-dbg.c:887: error: implicit declaration of function 'vfree'

Caused by commit b28e0eaa4a48bdc742978d6dd3688ef1db71928c ("USB:
ehci-dbg: increase debug buffer size for periodic file") from the usb
tree.

I added the following patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 17 Oct 2008 19:19:03 +1100
Subject: [PATCH] usb: vmalloc needs include of vmalloc.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/usb/host/ehci-dbg.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/host/ehci-dbg.c b/drivers/usb/host/ehci-dbg.c
index 0cb53ca..7119036 100644
--- a/drivers/usb/host/ehci-dbg.c
+++ b/drivers/usb/host/ehci-dbg.c
@@ -18,6 +18,8 @@
 
 /* this file is part of ehci-hcd.c */
 
+#include <linux/vmalloc.h>
+
 #define ehci_dbg(ehci, fmt, args...) \
 	dev_dbg (ehci_to_hcd(ehci)->self.controller , fmt , ## args )
 #define ehci_err(ehci, fmt, args...) \
-- 
1.5.6.5
