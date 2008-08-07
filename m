From: Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH] USB: fix compiler warning fix
Date: Thu, 7 Aug 2008 13:04:51 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.0808071303580.2598-100000@iolanthe.rowland.org>
References: <20080807105600.76386f62.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:54983 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755813AbYHGREw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Aug 2008 13:04:52 -0400
In-Reply-To: <20080807105600.76386f62.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: USB list <linux-usb@vger.kernel.org>, linux-next@vger.kernel.org

This patch (as1123b) fixes a compiler warning: do_unbind_rebind() is
defined but not used if CONFIG_PM=n.

Problem originally found and initial patch submitted by Alexander
Beregalov <a.beregalov@gmail.com>.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---

This is what Stephen has already been using, I believe.


Index: usb-2.6/drivers/usb/core/driver.c
===================================================================
--- usb-2.6.orig/drivers/usb/core/driver.c
+++ usb-2.6/drivers/usb/core/driver.c
@@ -774,8 +774,6 @@ void usb_deregister(struct usb_driver *d
 }
 EXPORT_SYMBOL_GPL(usb_deregister);
 
-#ifdef CONFIG_PM
-
 /* Forced unbinding of a USB interface driver, either because
  * it doesn't support pre_reset/post_reset/reset_resume or
  * because it doesn't support suspend/resume.
@@ -822,6 +820,8 @@ void usb_rebind_intf(struct usb_interfac
 		dev_warn(&intf->dev, "rebind failed: %d\n", rc);
 }
 
+#ifdef CONFIG_PM
+
 #define DO_UNBIND	0
 #define DO_REBIND	1
 
