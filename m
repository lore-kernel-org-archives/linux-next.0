From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the btrfs-kdave tree with Linus' tree
Date: Wed, 7 Feb 2018 10:49:23 +1100
Message-ID: <20180207104904.11f95dea@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34135 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753346AbeBFXtZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Feb 2018 18:49:25 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nikolay Borisov <nborisov@suse.com>, Jeff Layton <jlayton@redhat.com>

Hi David,

Today's linux-next merge of the btrfs-kdave tree got a conflict in:

  fs/btrfs/tree-log.c

between commit:

  c7f88c4e78f5 ("btrfs: convert to new i_version API")

from Linus' tree and commit:

  8bd2a9b19fd7 ("btrfs: Remove custom crc32c init code")

from the btrfs-kdave tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc fs/btrfs/tree-log.c
index afadaadab18e,df8e76d01dbe..000000000000
--- a/fs/btrfs/tree-log.c
+++ b/fs/btrfs/tree-log.c
@@@ -20,7 -20,7 +20,8 @@@
  #include <linux/slab.h>
  #include <linux/blkdev.h>
  #include <linux/list_sort.h>
 +#include <linux/iversion.h>
+ #include "ctree.h"
  #include "tree-log.h"
  #include "disk-io.h"
  #include "locking.h"
