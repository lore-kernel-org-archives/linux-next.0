From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the btrfs-kdave tree with Linus' tree
Date: Tue, 5 Apr 2016 10:32:49 +1000
Message-ID: <20160405103249.520fc204@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Sterba <dsterba@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Liu Bo <bo.li.liu@oracle.com>
List-Id: linux-next.vger.kernel.org

Hi David,

Today's linux-next merge of the btrfs-kdave tree got a conflict in:

  fs/btrfs/extent_io.c

between commit:

  09cbfeaf1a5a ("mm, fs: get rid of PAGE_CACHE_* and page_cache_{get,release} macros")

from Linus' tree and commit:

  a7424783a24d ("Btrfs: make mapping->writeback_index point to the last written page")

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

diff --cc fs/btrfs/extent_io.c
index d247fc0eea19,46a5c12906ae..000000000000
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@@ -3946,8 -3945,10 +3943,10 @@@ static int extent_write_cache_pages(str
  		index = mapping->writeback_index; /* Start from prev offset */
  		end = -1;
  	} else {
 -		index = wbc->range_start >> PAGE_CACHE_SHIFT;
 -		end = wbc->range_end >> PAGE_CACHE_SHIFT;
 +		index = wbc->range_start >> PAGE_SHIFT;
 +		end = wbc->range_end >> PAGE_SHIFT;
+ 		if (wbc->range_start == 0 && wbc->range_end == LLONG_MAX)
+ 			range_whole = 1;
  		scanned = 1;
  	}
  	if (wbc->sync_mode == WB_SYNC_ALL)
