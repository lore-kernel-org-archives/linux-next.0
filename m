From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the target-updates tree with the scsi
 tree
Date: Mon, 3 Jul 2017 16:02:29 +1000
Message-ID: <20170703160229.46cb7216@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43659 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750793AbdGCGCc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 3 Jul 2017 02:02:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Quinn Tran <quinn.tran@cavium.com>, Himanshu Madhani <himanshu.madhani@cavium.com>, "Martin K. Petersen" <martin.petersen@oracle.com>

Hi Nicholas,

Today's linux-next merge of the target-updates tree got a conflict in:

  drivers/scsi/qla2xxx/tcm_qla2xxx.c

between commit:

  60a9eadb19f3 ("scsi: qla2xxx: Move target stat counters from vha to qpair.")

from the scsi tree and commit:

  bc1bb269ef7b ("qla2xxx: Fix incorrect tcm_qla2xxx_free_cmd use during TMR ABORT")

from the target-updates tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/scsi/qla2xxx/tcm_qla2xxx.c
index c4b414833b86,8c1bf9b14bb2..000000000000
--- a/drivers/scsi/qla2xxx/tcm_qla2xxx.c
+++ b/drivers/scsi/qla2xxx/tcm_qla2xxx.c
@@@ -508,18 -508,7 +507,7 @@@ static void tcm_qla2xxx_handle_data_wor
  	 */
  	cmd->cmd_in_wq = 0;
  
- 	spin_lock_irqsave(&cmd->cmd_lock, flags);
- 	cmd->data_work = 1;
- 	if (cmd->aborted) {
- 		cmd->data_work_free = 1;
- 		spin_unlock_irqrestore(&cmd->cmd_lock, flags);
- 
- 		tcm_qla2xxx_free_cmd(cmd);
- 		return;
- 	}
- 	spin_unlock_irqrestore(&cmd->cmd_lock, flags);
- 
 -	cmd->vha->tgt_counters.qla_core_ret_ctio++;
 +	cmd->qpair->tgt_counters.qla_core_ret_ctio++;
  	if (!cmd->write_data_transferred) {
  		/*
  		 * Check if se_cmd has already been aborted via LUN_RESET, and
