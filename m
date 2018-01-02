From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree with the vfs tree
Date: Tue, 2 Jan 2018 11:09:46 +1100
Message-ID: <20180102110946.5867a449@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51577 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751822AbeABAJs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 1 Jan 2018 19:09:48 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Satendra Singh Thakur <satendra.t@samsung.com>, Junghak Sung <jh1009.sung@samsung.com>, Geunyoung Kim <nenggun.kim@samsung.com>

Hi Mauro,

Today's linux-next merge of the v4l-dvb tree got a conflict in:

  drivers/media/dvb-core/dmxdev.c

between commit:

  c23e0cb81e40 ("media: annotate ->poll() instances")

from the vfs tree and commits:

  57868acc369a ("media: videobuf2: Add new uAPI for DVB streaming I/O")
  4021053ed52d ("media: dvb-core: make DVB mmap API optional")
  fada1935590f ("media: move dvb kAPI headers to include/media")

from the v4l-dvb tree.

I fixed it up (see below, and also the merge fix patch) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 2 Jan 2018 11:04:56 +1100
Subject: [PATCH] media: videobuf2: fix up for "media: annotate ->poll()
 instances"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/media/dvb-core/dvb_vb2.c |  4 ++--
 include/media/dvb_vb2.h          | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
index 889abf9becd8..763145d74e83 100644
--- a/drivers/media/dvb-core/dvb_vb2.c
+++ b/drivers/media/dvb-core/dvb_vb2.c
@@ -421,8 +421,8 @@ int dvb_vb2_mmap(struct dvb_vb2_ctx *ctx, struct vm_area_struct *vma)
 	return 0;
 }
 
-unsigned int dvb_vb2_poll(struct dvb_vb2_ctx *ctx, struct file *file,
-			  poll_table *wait)
+__poll_t dvb_vb2_poll(struct dvb_vb2_ctx *ctx, struct file *file,
+		      poll_table *wait)
 {
 	dprintk(3, "[%s]\n", ctx->name);
 	return vb2_core_poll(&ctx->vb_q, file, wait);
diff --git a/include/media/dvb_vb2.h b/include/media/dvb_vb2.h
index 5431e5a7e140..49b46e5bdcf0 100644
--- a/include/media/dvb_vb2.h
+++ b/include/media/dvb_vb2.h
@@ -116,9 +116,9 @@ static inline int dvb_vb2_release(struct dvb_vb2_ctx *ctx)
 #define dvb_vb2_is_streaming(ctx) (0)
 #define dvb_vb2_fill_buffer(ctx, file, wait) (0)
 
-static inline unsigned int dvb_vb2_poll(struct dvb_vb2_ctx *ctx,
-					struct file *file,
-					poll_table *wait)
+static inline __poll_t dvb_vb2_poll(struct dvb_vb2_ctx *ctx,
+				    struct file *file,
+				    poll_table *wait)
 {
 	return 0;
 }
@@ -169,8 +169,8 @@ int dvb_vb2_fill_buffer(struct dvb_vb2_ctx *ctx,
  *
  * Implements poll syscall() logic.
  */
-unsigned int dvb_vb2_poll(struct dvb_vb2_ctx *ctx, struct file *file,
-			  poll_table *wait);
+__poll_t dvb_vb2_poll(struct dvb_vb2_ctx *ctx, struct file *file,
+		      poll_table *wait);
 #endif
 
 /**
-- 
2.15.0

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/media/dvb-core/dmxdev.c
index 3fe0eb740a6d,5eada88414d1..000000000000
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@@ -1164,7 -1321,12 +1321,12 @@@ static __poll_t dvb_dvr_poll(struct fil
  {
  	struct dvb_device *dvbdev = file->private_data;
  	struct dmxdev *dmxdev = dvbdev->priv;
 -	unsigned int mask = 0;
 +	__poll_t mask = 0;
+ #ifndef DVB_MMAP
+ 	bool need_ringbuffer = false;
+ #else
+ 	const bool need_ringbuffer = true;
+ #endif
  
  	dprintk("%s\n", __func__);
  
