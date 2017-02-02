From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the vfs tree
Date: Thu, 2 Feb 2017 13:44:07 +1100
Message-ID: <20170202134407.4403ad3a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38211 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750808AbdBBCoL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 1 Feb 2017 21:44:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  drivers/block/nbd.c

between commit:

  c9f2b6aeb922 ("[nbd] pass iov_iter to nbd_xmit()")

from the vfs tree and commit:

  09fc54ccc427 ("nbd: move request validity checking into nbd_send_cmd")
  aebf526b53ae ("block: fold cmd_type into the REQ_OP_ space")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/block/nbd.c
index 48132b0530fe,0be84a3cb6d7..000000000000
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@@ -265,17 -275,32 +262,32 @@@ static int nbd_send_cmd(struct nbd_devi
  	u32 type;
  	u32 tag = blk_mq_unique_tag(req);
  
 +	iov_iter_kvec(&from, WRITE | ITER_KVEC, &iov, 1, sizeof(request));
 +
- 	if (req_op(req) == REQ_OP_DISCARD)
+ 	switch (req_op(req)) {
+ 	case REQ_OP_DISCARD:
  		type = NBD_CMD_TRIM;
- 	else if (req_op(req) == REQ_OP_FLUSH)
+ 		break;
+ 	case REQ_OP_FLUSH:
  		type = NBD_CMD_FLUSH;
- 	else if (rq_data_dir(req) == WRITE)
+ 		break;
+ 	case REQ_OP_WRITE:
  		type = NBD_CMD_WRITE;
- 	else
+ 		break;
+ 	case REQ_OP_READ:
  		type = NBD_CMD_READ;
+ 		break;
+ 	default:
+ 		return -EIO;
+ 	}
+ 
+ 	if (rq_data_dir(req) == WRITE &&
+ 	    (nbd->flags & NBD_FLAG_READ_ONLY)) {
+ 		dev_err_ratelimited(disk_to_dev(nbd->disk),
+ 				    "Write on read-only\n");
+ 		return -EIO;
+ 	}
  
 -	memset(&request, 0, sizeof(request));
 -	request.magic = htonl(NBD_REQUEST_MAGIC);
  	request.type = htonl(type);
  	if (type != NBD_CMD_FLUSH) {
  		request.from = cpu_to_be64((u64)blk_rq_pos(req) << 9);
