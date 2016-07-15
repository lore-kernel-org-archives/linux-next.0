From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the ext4 tree
Date: Fri, 15 Jul 2016 14:33:27 +1000
Message-ID: <20160715143327.219961ef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60897 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751876AbcGOEda (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Jul 2016 00:33:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>, Mike Christie <mchristi@redhat.com>

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  fs/ext4/crypto.c

between commit:

  a7550b30ab70 ("ext4 crypto: migrate into vfs's crypto engine")

from the ext4 tree and commits:

  4e49ea4a3d27 ("block/fs/drivers: remove rw argument from submit_bio")
  60a40096a3b2 ("ext4: use bio op helprs in ext4 crypto code")

from the block tree.

I fixed it up (the ext4 tree removed the file, so I did that) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.



-- 
Cheers,
Stephen Rothwell
