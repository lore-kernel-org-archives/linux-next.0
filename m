From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the btrfs tree
Date: Mon, 24 Aug 2015 14:15:35 +1000
Message-ID: <20150824141535.42e0c4e1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kent Overstreet <kent.overstreet@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  fs/btrfs/volumes.c

between commits:

  da2f0f74cf7d ("Btrfs: add support for blkio controllers")
  3a9508b0221d ("btrfs: fix compile when block cgroups are not enabled")

from the btrfs tree and commit:

  0e28997ec476 ("btrfs: remove bio splitting and merge_bvec_fn() calls")

from the block tree.

I fixed it up (I removed breakup_stripe_bio) and can carry the fix as
necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
