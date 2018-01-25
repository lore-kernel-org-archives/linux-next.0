From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi-mkp tree with the scsi tree
Date: Fri, 26 Jan 2018 09:39:14 +1100
Message-ID: <20180126093914.4afaed4c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59377 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751219AbeAYWjW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 25 Jan 2018 17:39:22 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>, James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Darren Trapp <darren.trapp@cavium.com>, Himanshu Madhani <himanshu.madhani@cavium.com>

Hi Martin,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/qla2xxx/qla_init.c

between commit:

  07a21872cf2b ("scsi: qla2xxx: Fix queue ID for async abort with Multiqueue")

from the scsi tree and commit:

  b027a5ace443 ("scsi: qla2xxx: Fix queue ID for async abort with Multiqueue")

from the scsi-mkp tree.

Looks like you have updated your tree after James has merged it :-(

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.



-- 
Cheers,
Stephen Rothwell
