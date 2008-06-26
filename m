From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build failure
Date: Thu, 26 Jun 2008 16:50:25 +1000
Message-ID: <20080626165025.0f00ccd1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43436 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752705AbYFZGu3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Jun 2008 02:50:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>

Hi Rusty,

Today's linux-next build (x86_64 allmodconfig) failed like this:

ERROR: "hvc_alloc" [drivers/char/virtio_console.ko] undefined!
ERROR: "hvc_kick" [drivers/char/virtio_console.ko] undefined!
ERROR: "hvc_poll" [drivers/char/virtio_console.ko] undefined!
ERROR: "hvc_instantiate" [drivers/char/virtio_console.ko] undefined!

I applied the patch below.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 9b76babc511342dcd6b691caaf3af3840b60ee7d Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 26 Jun 2008 16:46:25 +1000
Subject: [PATCH] virtio: virtio console can be a module

So it needs these symbols exported.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/char/hvc_console.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/char/hvc_console.c b/drivers/char/hvc_console.c
index bf82a44..32f830a 100644
--- a/drivers/char/hvc_console.c
+++ b/drivers/char/hvc_console.c
@@ -281,6 +281,7 @@ int hvc_instantiate(uint32_t vtermno, int index, struct hv_ops *ops)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(hvc_instantiate);
 
 /* Wake the sleeping khvcd */
 void hvc_kick(void)
@@ -288,6 +289,7 @@ void hvc_kick(void)
 	hvc_kicked = 1;
 	wake_up_process(hvc_task);
 }
+EXPORT_SYMBOL_GPL(hvc_kick);
 
 static void hvc_unthrottle(struct tty_struct *tty)
 {
@@ -630,6 +632,7 @@ int hvc_poll(struct hvc_struct *hp)
 
 	return poll_mask;
 }
+EXPORT_SYMBOL_GPL(hvc_poll);
 
 /*
  * This kthread is either polling or interrupt driven.  This is determined by
@@ -740,6 +743,7 @@ struct hvc_struct __devinit *hvc_alloc(uint32_t vtermno, int data,
 
 	return hp;
 }
+EXPORT_SYMBOL_GPL(hvc_alloc);
 
 int __devexit hvc_remove(struct hvc_struct *hp)
 {
-- 
1.5.6
