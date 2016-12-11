From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs-miklos tree with the vfs tree
Date: Mon, 12 Dec 2016 10:38:17 +1100
Message-ID: <20161212103817.15e09cc0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39795 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753944AbcLKXiU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Dec 2016 18:38:20 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Miklos Szeredi <miklos@szeredi.hu>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, "Darrick J. Wong" <darrick.wong@oracle.com>

Hi Miklos,

Today's linux-next merge of the vfs-miklos tree got a conflict in:

  fs/read_write.c

between commit:

  a76b5b04375f ("fs: try to clone files first in vfs_copy_file_range")

from the vfs tree and commit:

  b2368d2bb4a5 ("vfs: check file types in vfs_copy_file_range()")

from the vfs-miklos tree.

I fixed it up (I used the vfs tree version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

Darrick, commit a76b5b04375f has no Signed-off-by from you as committer :-(

-- 
Cheers,
Stephen Rothwell
