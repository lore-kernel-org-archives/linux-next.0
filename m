From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the libata tree with the block tree
Date: Tue, 8 Nov 2016 16:58:54 +1100
Message-ID: <20161108165854.0872cd8b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36481 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750781AbcKHF64 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Nov 2016 00:58:56 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Adam Manzanares <adam.manzanares@hgst.com>, Christoph Hellwig <hch@lst.de>

Hi Tejun,

Today's linux-next merge of the libata tree got a conflict in:

  block/blk-core.c

between commits:

  e806402130c9 ("block: split out request-only flags into a new namespace")
  ef295ecf090d ("block: better op and flags encoding")

from the block tree and commit:

  5dc8b362a237 ("block: Add iocontext priority to request")

from the libata tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

--- a/block/blk-core.c
+++ b/block/blk-core.c
@@@ -1152,11 -1153,11 +1152,12 @@@ static struct request *__get_request(st

        blk_rq_init(q, rq);
        blk_rq_set_rl(rq, rl);
+       blk_rq_set_prio(rq, ioc);
 -      req_set_op_attrs(rq, op, op_flags | REQ_ALLOCED);
 +      rq->cmd_flags = op;
 +      rq->rq_flags = rq_flags;

        /* init elvpriv */
 -      if (op_flags & REQ_ELVPRIV) {
 +      if (rq_flags & RQF_ELVPRIV) {
                if (unlikely(et->icq_cache && !icq)) {
                        if (ioc)
                                icq = ioc_create_icq(ioc, q, gfp_mask);
