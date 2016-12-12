From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the vfs tree
Date: Mon, 12 Dec 2016 12:31:40 +1100
Message-ID: <20161212123140.2408fefb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44407 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753229AbcLLBbn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Dec 2016 20:31:43 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ming Lei <tom.leiming@gmail.com>, Christoph Hellwig <hch@lst.de>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  fs/logfs/dev_bdev.c

between commit:

  6b4fbde3b979 ("logfs: remove from tree")

from the vfs tree and commitis:

  3a83f4677539 ("block: bio: pass bvec table to bio_init()")
  739a9975468c ("fs: logfs: convert to bio_add_page() in sync_request()")
  d4f98a89f9cd ("fs: logfs: use bio_add_page() in __bdev_writeseg()")
  c12484367865 ("fs: logfs: use bio_add_page() in do_erase()")
  05aea81b4bc9 ("fs: logfs: remove unnecesary check")

from the block tree.

I fixed it up (I removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

Al: that vfs tree commit has a bad email address for Christoph in it :-(

-- 
Cheers,
Stephen Rothwell
