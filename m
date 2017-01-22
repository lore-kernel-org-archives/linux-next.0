From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with Linus' tree
Date: Mon, 23 Jan 2017 10:36:14 +1100
Message-ID: <20170123103614.790e6a6b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46141 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750703AbdAVXgR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 22 Jan 2017 18:36:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Josef Bacik <jbacik@fb.com>, Jens Axboe <axboe@fb.com>

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  drivers/block/nbd.c

between commit:

  d61b7f972dab ("nbd: only set MSG_MORE when we have more to send")

from Linus' tree and commit:

  c9f2b6aeb922 ("[nbd] pass iov_iter to nbd_xmit()")

from the vfs tree.

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
index 9fd06eeb1a17,3c2dbe412c02..000000000000
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@@ -271,8 -256,10 +256,10 @@@ static int sock_xmit(struct nbd_device 
  static int nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd, int index)
  {
  	struct request *req = blk_mq_rq_from_pdu(cmd);
 -	int result, flags;
 +	int result;
- 	struct nbd_request request;
+ 	struct nbd_request request = {.magic = htonl(NBD_REQUEST_MAGIC)};
+ 	struct kvec iov = {.iov_base = &request, .iov_len = sizeof(request)};
+ 	struct iov_iter from;
  	unsigned long size = blk_rq_bytes(req);
  	struct bio *bio;
  	u32 type;
@@@ -318,11 -306,14 +305,13 @@@
  
  		bio_for_each_segment(bvec, bio, iter) {
  			bool is_last = !next && bio_iter_last(bvec, iter);
 +			int flags = is_last ? 0 : MSG_MORE;
  
 -			if (is_last)
 -				flags = MSG_MORE;
  			dev_dbg(nbd_to_dev(nbd), "request %p: sending %d bytes data\n",
  				cmd, bvec.bv_len);
- 			result = sock_send_bvec(nbd, index, &bvec, flags);
+ 			iov_iter_bvec(&from, ITER_BVEC | WRITE,
+ 				      &bvec, 1, bvec.bv_len);
+ 			result = sock_xmit(nbd, index, 1, &from, flags);
  			if (result <= 0) {
  				dev_err(disk_to_dev(nbd->disk),
  					"Send data failed (result %d)\n",
