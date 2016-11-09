From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi-mkp tree with the block tree
Date: Wed, 9 Nov 2016 13:54:14 +1100
Message-ID: <20161109135414.283a9ac5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

Hi Martin,

Today's linux-next merge of the scsi-mkp tree got conflicts in:

  drivers/scsi/ufs/ufshcd.c

between commit:

  e806402130c9 ("block: split out request-only flags into a new namespace")

from the block tree and commit:

  dcea0bfbc4cb ("scsi: ufs: fix sense buffer size to 18 bytes")

from the scsi-mkp tree.

This latter commit also exists as commit 2266d5678ad1 in the scsi tree,
but unfortunately, the scsi-mkp tree was rebased overnight, so now the
two patches are not the same commit :-(  A significant path of what was
rebased overnight has already been merged into the scsi tree ... so
please tidy up your tree WRT the scsi tree.  This conflict would not
exist if the rebase had not been done.

I fixed it up (it is also fixed in the scsi tree merge and so just
taking that version of the resolution works) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
