From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the scsi-mkp tree
Date: Wed, 22 Feb 2017 13:41:19 +1100
Message-ID: <20170222134119.42f26068@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35649 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753960AbdBVClW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Feb 2017 21:41:22 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Smart <jsmart2021@gmail.com>, Dick Kennedy <dick.kennedy@broadcom.com>, Hannes Reinecke <hare@suse.com>

Hi Martin,

After merging the scsi-mkp tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

ERROR: ".nvme_fc_unregister_remoteport" [drivers/scsi/lpfc/lpfc.ko] undefined!
ERROR: ".nvme_fc_unregister_localport" [drivers/scsi/lpfc/lpfc.ko] undefined!
ERROR: ".nvmet_fc_rcv_ls_req" [drivers/scsi/lpfc/lpfc.ko] undefined!
ERROR: ".nvmet_fc_rcv_fcp_req" [drivers/scsi/lpfc/lpfc.ko] undefined!
ERROR: ".nvme_fc_register_localport" [drivers/scsi/lpfc/lpfc.ko] undefined!
ERROR: ".nvme_fc_register_remoteport" [drivers/scsi/lpfc/lpfc.ko] undefined!
ERROR: ".nvmet_fc_register_targetport" [drivers/scsi/lpfc/lpfc.ko] undefined!
ERROR: ".nvmet_fc_unregister_targetport" [drivers/scsi/lpfc/lpfc.ko] undefined!

Caused by commit

  462896e1808c ("scsi: lpfc: NVME Initiator: bind to nvme_fc api")

# CONFIG_NVME_FC is not set

Presumably a missing dependency.

I have used the scsi-mkp from next-20170221 for today.

-- 
Cheers,
Stephen Rothwell
