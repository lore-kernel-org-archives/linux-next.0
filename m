From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi-mkp tree with the block tree
Date: Wed, 26 Apr 2017 15:47:22 +1000
Message-ID: <20170426154722.757ba483@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33613 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1949938AbdDZFrZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 26 Apr 2017 01:47:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>, Christoph Hellwig <hch@lst.de>

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/sd.c

between commit:

  81d926e8b552 ("sd: split sd_setup_discard_cmnd")

from the block tree and commit:

  7529fbb0080d ("scsi: sd: Fix function descriptions")

from the scsi-mkp tree.

I fixed it up (I just used the former version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
