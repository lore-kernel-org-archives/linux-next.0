From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi tree with the block tree
Date: Tue, 8 Nov 2016 16:48:04 +1100
Message-ID: <20161108164804.0aef27e8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51421 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752363AbcKHFsH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Nov 2016 00:48:07 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Gilad Broner <gbroner@codeaurora.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, Subhash Jadavani <subhashj@codeaurora.org>

Hi James,

Today's linux-next merge of the scsi tree got a conflict in:

  drivers/scsi/ufs/ufshcd.c

between commit:

  e806402130c9 ("block: split out request-only flags into a new namespace")

from the block tree and commit:

  2266d5678ad1 ("scsi: ufs: fix sense buffer size to 18 bytes")

from the scsi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/scsi/ufs/ufshcd.c
index cf549871c1ee,304adce3bdbe..000000000000
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@@ -5589,8 -5642,8 +5642,8 @@@ ufshcd_send_request_sense(struct ufs_hb
  	}
  
  	ret = scsi_execute_req_flags(sdp, cmd, DMA_FROM_DEVICE, buffer,
- 				SCSI_SENSE_BUFFERSIZE, NULL,
+ 				UFSHCD_REQ_SENSE_SIZE, NULL,
 -				msecs_to_jiffies(1000), 3, NULL, REQ_PM);
 +				msecs_to_jiffies(1000), 3, NULL, 0, RQF_PM);
  	if (ret)
  		pr_err("%s: failed with err %d\n", __func__, ret);
  
