From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the btrfs-kdave tree with the btrfs
 tree
Date: Tue, 22 Aug 2017 09:44:03 +1000
Message-ID: <20170822094403.11477046@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59995 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754433AbdHUXoG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Aug 2017 19:44:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Sterba <dsterba@suse.cz>, Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Anand Jain <anand.jain@oracle.com>, Nick Terrell <terrelln@fb.com>

Hi All,

(As expected) Today's linux-next merge of the btrfs-kdave tree got a
conflict in:

  fs/btrfs/compression.h

between commit:

  5c1aab1dd544 ("btrfs: Add zstd support")

from the btrfs tree and commit:

  dc2f29212a26 ("btrfs: remove unused BTRFS_COMPRESS_LAST")

from the btrfs-kdave tree.

I fixed it up (as suggested by Chris - see below) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but
any non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc fs/btrfs/compression.h
index 2269e00854d8,3b1b0ac15fdc..000000000000
--- a/fs/btrfs/compression.h
+++ b/fs/btrfs/compression.h
@@@ -99,9 -99,7 +99,8 @@@ enum btrfs_compression_type
        BTRFS_COMPRESS_NONE  = 0,
        BTRFS_COMPRESS_ZLIB  = 1,
        BTRFS_COMPRESS_LZO   = 2,
 -      BTRFS_COMPRESS_TYPES = 2,
 +      BTRFS_COMPRESS_ZSTD  = 3,
 +      BTRFS_COMPRESS_TYPES = 3,
-       BTRFS_COMPRESS_LAST  = 4,
  };

  struct btrfs_compress_op {
@@@ -129,6 -127,7 +128,8 @@@

  extern const struct btrfs_compress_op btrfs_zlib_compress;
  extern const struct btrfs_compress_op btrfs_lzo_compress;
 +extern const struct btrfs_compress_op btrfs_zstd_compress;

+ int btrfs_compress_heuristic(struct inode *inode, u64 start, u64 end);
+
  #endif
