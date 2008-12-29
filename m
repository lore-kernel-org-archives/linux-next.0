From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the boot-params tree
Date: Tue, 30 Dec 2008 07:52:01 +1030
Message-ID: <200812300752.02671.rusty@rustcorp.com.au>
References: <20081230011055.d2f6ced2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:35030 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752782AbYL2VWI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Dec 2008 16:22:08 -0500
In-Reply-To: <20081230011055.d2f6ced2.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>, "Pete Zaitcev (Red Hat, Inc.)" <zaitcev@redhat.com>

On Tuesday 30 December 2008 00:40:55 Stephen Rothwell wrote:
> Hi Rusty,
> 
> Today's linux-next merge of the boot-params tree got a conflict in
> drivers/usb/core/usb.c between commit
> 6e7b5429a08fe4f71c336710bd45acdce6cd3df7 ("USB: don't use
> __module_param_call") from the usb tree and commit
> 9634765245cd7aba71328c71813ca882d008632d ("USB: Don't use
> __module_param_call; use core_param") from the boot-params tree.
> 
> Two different versions of the same change?  I fixed it up (used the
> boot-params tree version) and can carry the fix as necessary.  It sounds
> like Greg should drop the patch from the usb tree (or pick up the version
> from the boot-params tree).

Yes; I sent Greg an email but it might have been lost in the flood.  Pete
acked.

I'd rather this version for simplicity in the other patches, but I can live
if not.  It's also a little clearer, IMHO.

Thanks,
Rusty.

>From 9634765245cd7aba71328c71813ca882d008632d Mon Sep 17 00:00:00 2001
From: Rusty Russell <rusty@rustcorp.com.au>
Date: Thu, 25 Dec 2008 22:06:14 +1030
Subject: [PATCH] USB: Don't use __module_param_call; use core_param.

Impact: cleanup

Found this when I changed args to __module_param_call.  We now have
core_param for exactly this, but Greg assures me "nousb" is used as a
module parameter, so we need the #ifdef MODULE.

Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
Cc: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Pete Zaitcev <zaitcev@redhat.com>

diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index be1fa07..74d9dcd 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -962,8 +962,12 @@ void usb_buffer_unmap_sg(const struct usb_device *dev, int is_in,
 }
 EXPORT_SYMBOL_GPL(usb_buffer_unmap_sg);
 
-/* format to disable USB on kernel command line is: nousb */
-__module_param_call("", nousb, param_set_bool, param_get_bool, &nousb, 0444);
+/* To disable USB, kernel command line is 'nousb' not 'usbcore.nousb' */
+#ifdef MODULE
+module_param(nousb, bool, 0444);
+#else
+core_param(nousb, nousb, bool, 0444);
+#endif
 
 /*
  * for external read access to <nousb>
