From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the btrfs-kdave tree with Linus' tree
Date: Mon, 24 Jul 2017 10:54:31 +1000
Message-ID: <20170724105431.675fb3a3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Sterba <dsterba@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@fb.com>
List-Id: linux-next.vger.kernel.org

Hi David,

Today's linux-next merge of the btrfs-kdave tree got a conflict in:

  fs/btrfs/scrub.c

between commit:

  4e4cbee93d56 ("block: switch bios to blk_status_t")

from Linus' tree and commit:

  26397a4ad1d5 ("btrfs: account that we're waiting for IO in scrub_submit_raid56_bio_wait")

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

diff --cc fs/btrfs/scrub.c
index 6f1e4c984b94,7bce7b43c48b..000000000000
--- a/fs/btrfs/scrub.c
+++ b/fs/btrfs/scrub.c
@@@ -1704,8 -1704,8 +1704,8 @@@ static int scrub_submit_raid56_bio_wait
  	if (ret)
  		return ret;
  
- 	wait_for_completion(&done.event);
+ 	wait_for_completion_io(&done.event);
 -	if (done.error)
 +	if (done.status)
  		return -EIO;
  
  	return 0;
