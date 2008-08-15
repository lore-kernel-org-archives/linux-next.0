From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  driver-core tree build failure
Date: Fri, 15 Aug 2008 18:25:36 +1000
Message-ID: <20080815182536.133fcad6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35645 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753306AbYHOIZk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Aug 2008 04:25:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org

Hi Greg,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/usb/gadget/f_ecm.c:737: error: __ksymtab_ecm_bind causes a section type conflict

You really shouldn't EXPORT static functions.  I applied the patch below.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --git a/drivers/usb/gadget/f_ecm.c b/drivers/usb/gadget/f_ecm.c
index ff85c9d..6d0a88c 100644
--- a/drivers/usb/gadget/f_ecm.c
+++ b/drivers/usb/gadget/f_ecm.c
@@ -599,7 +599,7 @@ static void ecm_close(struct gether *geth)
 
 /* ethernet function driver setup/binding */
 
-static int __init
+int __init
 ecm_bind(struct usb_configuration *c, struct usb_function *f)
 {
 	struct usb_composite_dev *cdev = c->cdev;
