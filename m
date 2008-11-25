From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: linux-next: rr tree build failure
Date: Tue, 25 Nov 2008 13:36:26 +0100
Message-ID: <200811251336.26864.borntraeger@de.ibm.com>
References: <20081125174554.dbd84cde.sfr@canb.auug.org.au> <200811252217.37125.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate5.uk.ibm.com ([195.212.29.138]:55196 "EHLO
	mtagate5.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752078AbYKYMgn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Nov 2008 07:36:43 -0500
Received: from d06nrmr1407.portsmouth.uk.ibm.com (d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate5.uk.ibm.com (8.13.8/8.13.8) with ESMTP id mAPCagIV417516
	for <linux-next@vger.kernel.org>; Tue, 25 Nov 2008 12:36:42 GMT
Received: from d06av01.portsmouth.uk.ibm.com (d06av01.portsmouth.uk.ibm.com [9.149.37.212])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mAPCag052060454
	for <linux-next@vger.kernel.org>; Tue, 25 Nov 2008 12:36:42 GMT
Received: from d06av01.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av01.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mAPCafHu030922
	for <linux-next@vger.kernel.org>; Tue, 25 Nov 2008 12:36:41 GMT
In-Reply-To: <200811252217.37125.rusty@rustcorp.com.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>

Am Dienstag, 25. November 2008 schrieb Rusty Russell:
> > Also, the x86_64 allmodconfig build failed like this:
> >
> > ERROR: "hvc_resize" [drivers/char/virtio_console.ko] undefined!
> >
> > hvc_resize is currently not exported to modules.
> >
> > I have dropped the rr tree again.
> 
> OK, I've dropped Christian's patch for the moment until he fixes this.  I'm 
> travelling to Sydney for the day so I won't get a chance to fix this if it 
> breaks tomorrow :(

Ok. Sorry about that. allmodconfig on s390 and i386 select VIRTIO_CONSOLE as 
(y) and not as (m), therefore my tests did not trigger this problem. I will 
try to get an x86_64 box to test on in the future.

This version of the patch adds an EXPORT_SYMBOL_GPL. Feel free to add it 
whenever it fits your schedule. 

[PATCH 1/2]: virtio_console: support console resizing

From: Christian Borntraeger <borntraeger@de.ibm.com>

this patch uses the new hvc callback hvc_resize to set the window site 
which allows to change the tty size of hvc_console via a hvc_resize 
function.

I have added a new feature bit VIRTIO_CONSOLE_F_SIZE. The driver will 
change the window size on tty open and via the config_changed callback
of the transport. Currently lguest and kvm_s390 have not implemented this
callback, but the callback can be implemented at a later point in time.

Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
---
 drivers/char/hvc_console.c     |    1 +
 drivers/char/virtio_console.c  |   30 +++++++++++++++++++++++++++++-
 include/linux/virtio_console.h |   11 +++++++++++
 3 files changed, 41 insertions(+), 1 deletion(-)

Index: kvm/drivers/char/hvc_console.c
===================================================================
--- kvm.orig/drivers/char/hvc_console.c
+++ kvm/drivers/char/hvc_console.c
@@ -694,6 +694,7 @@ void hvc_resize(struct hvc_struct *hp, s
 		schedule_work(&hp->tty_resize);
 	}
 }
+EXPORT_SYMBOL_GPL(hvc_resize);
 
 /*
  * This kthread is either polling or interrupt driven.  This is determined by
Index: kvm/drivers/char/virtio_console.c
===================================================================
--- kvm.orig/drivers/char/virtio_console.c
+++ kvm/drivers/char/virtio_console.c
@@ -138,12 +138,33 @@ int __init virtio_cons_early_init(int (*
 }
 
 /*
+ * virtio console configuration. This supports:
+ * - console resize
+ */
+static void virtcons_apply_config(struct virtio_device *dev)
+{
+	struct winsize ws;
+
+	if (virtio_has_feature(dev, VIRTIO_CONSOLE_F_SIZE)) {
+		dev->config->get(dev,
+				 offsetof(struct virtio_console_config, cols),
+				 &ws.ws_col, sizeof(u16));
+		dev->config->get(dev,
+				 offsetof(struct virtio_console_config, rows),
+				 &ws.ws_row, sizeof(u16));
+		hvc_resize(hvc, ws);
+	}
+}
+
+/*
  * we support only one console, the hvc struct is a global var
- * There is no need to do anything
+ * We set the configuration at this point, since we now have a tty
  */
 static int notifier_add_vio(struct hvc_struct *hp, int data)
 {
 	hp->irq_requested = 1;
+	virtcons_apply_config(vdev);
+
 	return 0;
 }
 
@@ -234,11 +255,18 @@ static struct virtio_device_id id_table[
 	{ 0 },
 };
 
+static unsigned int features[] = {
+	VIRTIO_CONSOLE_F_SIZE,
+};
+
 static struct virtio_driver virtio_console = {
+	.feature_table = features,
+	.feature_table_size = ARRAY_SIZE(features),
 	.driver.name =	KBUILD_MODNAME,
 	.driver.owner =	THIS_MODULE,
 	.id_table =	id_table,
 	.probe =	virtcons_probe,
+	.config_changed = virtcons_apply_config,
 };
 
 static int __init init(void)
Index: kvm/include/linux/virtio_console.h
===================================================================
--- kvm.orig/include/linux/virtio_console.h
+++ kvm/include/linux/virtio_console.h
@@ -7,6 +7,17 @@
 /* The ID for virtio console */
 #define VIRTIO_ID_CONSOLE	3
 
+/* Feature bits */
+#define VIRTIO_CONSOLE_F_SIZE	0	/* Does host provide console size? */
+
+struct virtio_console_config {
+	/* colums of the screens */
+	__u16 cols;
+	/* rows of the screens */
+	__u16 rows;
+} __attribute__((packed));
+
+
 #ifdef __KERNEL__
 int __init virtio_cons_early_init(int (*put_chars)(u32, const char *, int));
 #endif /* __KERNEL__ */
