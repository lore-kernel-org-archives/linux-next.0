From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: tm6000 compilation breakage on linux-next
Date: Mon, 03 May 2010 13:33:40 -0300
Message-ID: <4BDEFAE4.1060700@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:62929 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932934Ab0ECQdx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 3 May 2010 12:33:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, greg KH <greg@kroah.com>, Randy Dunlap <randy.dunlap@oracle.com>

Hi Stephen,

Randy reported a breakage while compiling drivers/staging/tm6000, due to
this change:
    commit 1c1b78bee1a94f98deeb9c24b21c4812e191646c
    Author: Greg Kroah-Hartman <gregkh@suse.de>
    Date:   Thu Apr 29 15:46:07 2010 -0700

    USB: remove unused usb_buffer_alloc and usb_buffer_free macros
    
    Now that all callers are converted over, remove the compatibility
    functions and all is good.
    
    Cc: Daniel Mack <daniel@caiaq.de>
    Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

A fix patch is as simple as:
	s/usb_buffer_alloc/usb_alloc_coherent/
	s/usb_buffer_free/usb_free_coherent/

The problem is that, if I apply such patch on my tree, it will break compilation
with upstream. So, the better is if you could handle it until the next merge window.
After Greg's merge, I'll apply it on my tree, and submit tm6000 driver to staging.

Would this be ok for you, or do you have a better approach for such
kind of conflicts?


-- 
Fix compilation breakage with tm6000
    
Randy Dunlap <randy.dunlap@oracle.com>  reported a breakage while compiling
drivers/staging/tm6000, due to this change:
    commit 1c1b78bee1a94f98deeb9c24b21c4812e191646c
    Author: Greg Kroah-Hartman <gregkh@suse.de>
    Date:   Thu Apr 29 15:46:07 2010 -0700

    USB: remove unused usb_buffer_alloc and usb_buffer_free macros

    Now that all callers are converted over, remove the compatibility
    functions and all is good.

    Cc: Daniel Mack <daniel@caiaq.de>
    Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
    
As the function got renamed, the rename should also be applied at
tm6000 on linux-next.
    
Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>

diff --git a/drivers/staging/tm6000/tm6000-video.c b/drivers/staging/tm6000/tm6000-video.c
index 9554472..da1dc07 100644
--- a/drivers/staging/tm6000/tm6000-video.c
+++ b/drivers/staging/tm6000/tm6000-video.c
@@ -585,7 +585,7 @@ static void tm6000_uninit_isoc(struct tm6000_core *dev)
 			usb_kill_urb(urb);
 			usb_unlink_urb(urb);
 			if (dev->isoc_ctl.transfer_buffer[i]) {
-				usb_buffer_free(dev->udev,
+				usb_free_coherent(dev->udev,
 						urb->transfer_buffer_length,
 						dev->isoc_ctl.transfer_buffer[i],
 						urb->transfer_dma);
@@ -672,7 +672,7 @@ static int tm6000_prepare_isoc(struct tm6000_core *dev, unsigned int framesize)
 		}
 		dev->isoc_ctl.urb[i] = urb;
 
-		dev->isoc_ctl.transfer_buffer[i] = usb_buffer_alloc(dev->udev,
+		dev->isoc_ctl.transfer_buffer[i] = usb_alloc_coherent(dev->udev,
 			sb_size, GFP_KERNEL, &urb->transfer_dma);
 		if (!dev->isoc_ctl.transfer_buffer[i]) {
 			tm6000_err ("unable to allocate %i bytes for transfer"



Cheers,
Mauro
