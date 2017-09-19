From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Date: Tue, 19 Sep 2017 11:42:40 +1000
Message-ID: <20170919114240.6eab3f52@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44307 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750733AbdISBmn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Sep 2017 21:42:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Mauro Carvalho Chehab <mchehab@s-opensource.com>

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/media/v4l2-core/videobuf2-dma-contig.c

between commit:

  5b6f9abe5a49 ("media: vb2: add bidirectional flag in vb2_queue")

from Linus' tree and commit:

  c4860ad60564 ("lib/scatterlist: Fix offset type in sg_alloc_table_from_pages")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/media/v4l2-core/videobuf2-dma-contig.c
index 9f389f36566d,2405077fdc71..000000000000
--- a/drivers/media/v4l2-core/videobuf2-dma-contig.c
+++ b/drivers/media/v4l2-core/videobuf2-dma-contig.c
@@@ -507,9 -507,8 +507,9 @@@ static void *vb2_dc_get_userptr(struct 
  	buf->dev = dev;
  	buf->dma_dir = dma_dir;
  
- 	offset = vaddr & ~PAGE_MASK;
+ 	offset = lower_32_bits(offset_in_page(vaddr));
 -	vec = vb2_create_framevec(vaddr, size, dma_dir == DMA_FROM_DEVICE);
 +	vec = vb2_create_framevec(vaddr, size, dma_dir == DMA_FROM_DEVICE ||
 +					       dma_dir == DMA_BIDIRECTIONAL);
  	if (IS_ERR(vec)) {
  		ret = PTR_ERR(vec);
  		goto fail_buf;
