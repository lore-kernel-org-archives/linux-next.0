From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the btrfs-kdave tree with Linus' tree
Date: Tue, 18 Jul 2017 10:18:02 +1000
Message-ID: <20170718101802.720dab22@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Sterba <dsterba@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Chris Mason <clm@fb.com>
List-Id: linux-next.vger.kernel.org

Hi David,

Today's linux-next merge of the btrfs-kdave tree got a conflict in:

  fs/btrfs/extent_io.c

between commit:

  e6959b9350c6 ("btrfs: add support for passing in write hints for buffered writes")

from Linus' tree and commit:

  41a3f2a7c062 ("btrfs: merge REQ_OP and REQ_ flags to one parameter in submit_extent_page")

from the btrfs-kdave tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

You should probably consider rebasing your for-next branch onto (at
least v4.13-rc1) (or merging v4.13-rc1) to save these sort of
(unnecessary) conflicts being ongoing during development and the next
merge window.

-- 
Cheers,
Stephen Rothwell

diff --cc fs/btrfs/extent_io.c
index 0aff9b278c19,ead9e731e01b..000000000000
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@@ -2803,8 -2801,7 +2805,8 @@@ static int submit_extent_page(unsigned 
  	bio_add_page(bio, page, page_size, offset);
  	bio->bi_end_io = end_io_func;
  	bio->bi_private = tree;
 +	bio->bi_write_hint = page->mapping->host->i_write_hint;
- 	bio_set_op_attrs(bio, op, op_flags);
+ 	bio->bi_opf = opf;
  	if (wbc) {
  		wbc_init_bio(wbc, bio);
  		wbc_account_io(wbc, page, page_size);
