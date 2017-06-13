From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the target-updates tree with the
 scsi-mkp tree
Date: Tue, 13 Jun 2017 16:47:42 +1000
Message-ID: <20170613164742.7308e4dd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38519 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752307AbdFMGrp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Jun 2017 02:47:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Quinn Tran <quinn.tran@cavium.com>

Hi Nicholas,

Today's linux-next merge of the target-updates tree got a conflict in:

  drivers/scsi/qla2xxx/qla_target.c

between commit:

  f775bd14e44d ("scsi: qla2xxx: Convert 32-bit LUN usage to 64-bit")

from the scsi-mkp tree and commit:

  6b26726af699 ("qla2xxx: Convert QLA_TGT_ABTS to TARGET_SCF_LOOKUP_LUN_FROM_TAG")

from the target-updates tree.

I fixed it up (I basically used the latter verion of
__qlt_24xx_handle_abts()) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell
