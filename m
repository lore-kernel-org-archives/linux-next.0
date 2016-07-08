From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Fri, 8 Jul 2016 13:07:50 +1000
Message-ID: <20160708130750.1ef2ffc9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bob Liu <bob.liu@oracle.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Mike Christie <mchristi@redhat.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  drivers/block/xen-blkfront.c

between commit:

  7b427a59538a ("xen-blkfront: save uncompleted reqs in blkfront_resume()")

from Linus' tree and commit:

  c2df40dfb8c0 ("drivers: use req op accessor")
  3a5e02ced11e ("block, drivers: add REQ_OP_FLUSH operation")
  288dab8a35a0 ("block: add a separate operation type for secure erase")

from the block tree.

I fixed it up (I *think* - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/block/xen-blkfront.c
index fcc5b4e0aef2,10711292da2c..000000000000
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@@ -2093,38 -2143,6 +2089,43 @@@ static int blkfront_resume(struct xenbu
  
  	dev_dbg(&dev->dev, "blkfront_resume: %s\n", dev->nodename);
  
 +	bio_list_init(&info->bio_list);
 +	INIT_LIST_HEAD(&info->requests);
 +	for (i = 0; i < info->nr_rings; i++) {
 +		struct blkfront_ring_info *rinfo = &info->rinfo[i];
 +		struct bio_list merge_bio;
 +		struct blk_shadow *shadow = rinfo->shadow;
 +
 +		for (j = 0; j < BLK_RING_SIZE(info); j++) {
 +			/* Not in use? */
 +			if (!shadow[j].request)
 +				continue;
 +
 +			/*
 +			 * Get the bios in the request so we can re-queue them.
 +			 */
- 			if (shadow[j].request->cmd_flags &
- 					(REQ_FLUSH | REQ_FUA | REQ_DISCARD | REQ_SECURE)) {
++			if (req_op(shadow[j].request) == REQ_OP_FLUSH ||
++			    req_op(shadow[j].request) == REQ_OP_DISCARD ||
++			    req_op(shadow[j].request) == REQ_OP_SECURE_ERASE ||
++			    shadow[j].request->cmd_flags & REQ_FUA)) {
 +				/*
 +				 * Flush operations don't contain bios, so
 +				 * we need to requeue the whole request
++				 *
++				 * XXX: but this doesn't make any sense for a
++				 * write with the FUA flag set..
 +				 */
 +				list_add(&shadow[j].request->queuelist, &info->requests);
 +				continue;
 +			}
 +			merge_bio.head = shadow[j].request->bio;
 +			merge_bio.tail = shadow[j].request->biotail;
 +			bio_list_merge(&info->bio_list, &merge_bio);
 +			shadow[j].request->bio = NULL;
 +			blk_mq_end_request(shadow[j].request, 0);
 +		}
 +	}
 +
  	blkif_free(info, info->connected == BLKIF_STATE_CONNECTED);
  
  	err = negotiate_mq(info);
