From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Date: Fri, 1 Sep 2017 14:48:00 +1000
Message-ID: <20170901144800.76a5576b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39851 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750707AbdIAEsC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 1 Sep 2017 00:48:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>, Bart Van Assche <bart.vanassche@wdc.com>

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  include/scsi/scsi_cmnd.h

between commit:

  70e42fd02c46 ("scsi: sd_zbc: Write unlock zone from sd_uninit_cmnd()")

from Linus' tree and commit:

  64104f703212 ("scsi: Call scsi_initialize_rq() for filesystem requests")

from the scsi-mkp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/scsi/scsi_cmnd.h
index 5f45f2349a75,a9f8f7e79d83..000000000000
--- a/include/scsi/scsi_cmnd.h
+++ b/include/scsi/scsi_cmnd.h
@@@ -57,7 -57,9 +57,10 @@@ struct scsi_pointer 
  /* for scmd->flags */
  #define SCMD_TAGGED		(1 << 0)
  #define SCMD_UNCHECKED_ISA_DMA	(1 << 1)
 +#define SCMD_ZONE_WRITE_LOCK	(1 << 2)
+ #define SCMD_INITIALIZED	(1 << 3)
+ /* flags preserved across unprep / reprep */
+ #define SCMD_PRESERVED_FLAGS	(SCMD_UNCHECKED_ISA_DMA | SCMD_INITIALIZED)
  
  struct scsi_cmnd {
  	struct scsi_request req;
