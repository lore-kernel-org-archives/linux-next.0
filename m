From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the target-updates tree with the scsi
 tree
Date: Wed, 28 Jun 2017 15:40:59 +1000
Message-ID: <20170628154059.21dbfda2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36131 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750945AbdF1FlC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Jun 2017 01:41:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Quinn Tran <quinn.tran@cavium.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Himanshu Madhani <himanshu.madhani@cavium.com>

Hi Nicholas,

Today's linux-next merge of the target-updates tree got a conflict in:

  drivers/scsi/qla2xxx/qla_target.c

between commits:

  f775bd14e44d ("scsi: qla2xxx: Convert 32-bit LUN usage to 64-bit")
  82de802ad46e ("scsi: qla2xxx: Preparation for Target MQ.")

from the scsi tree and commit:

  6b26726af699 ("qla2xxx: Convert QLA_TGT_ABTS to TARGET_SCF_LOOKUP_LUN_FROM_TAG")

from the target-updates tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/scsi/qla2xxx/qla_target.c
index 2a0173e5d10e,401e245477d4..000000000000
--- a/drivers/scsi/qla2xxx/qla_target.c
+++ b/drivers/scsi/qla2xxx/qla_target.c
@@@ -1874,36 -1847,13 +1874,15 @@@ static int __qlt_24xx_handle_abts(struc
  	struct abts_recv_from_24xx *abts, struct fc_port *sess)
  {
  	struct qla_hw_data *ha = vha->hw;
- 	struct se_session *se_sess = sess->se_sess;
  	struct qla_tgt_mgmt_cmd *mcmd;
 +	struct qla_tgt_cmd *cmd;
- 	struct se_cmd *se_cmd;
  	int rc;
- 	bool found_lun = false;
- 	unsigned long flags;
  
- 	spin_lock_irqsave(&se_sess->sess_cmd_lock, flags);
- 	list_for_each_entry(se_cmd, &se_sess->sess_cmd_list, se_cmd_list) {
- 		if (se_cmd->tag == abts->exchange_addr_to_abort) {
- 			found_lun = true;
- 			break;
- 		}
- 	}
- 	spin_unlock_irqrestore(&se_sess->sess_cmd_lock, flags);
- 
- 	/* cmd not in LIO lists, look in qla list */
- 	if (!found_lun) {
- 		if (abort_cmd_for_tag(vha, abts->exchange_addr_to_abort)) {
- 			/* send TASK_ABORT response immediately */
- 			qlt_24xx_send_abts_resp(ha->base_qpair, abts,
- 			    FCP_TMF_CMPL, false);
- 			return 0;
- 		} else {
- 			ql_dbg(ql_dbg_tgt_mgt, vha, 0xf081,
- 			    "unable to find cmd in driver or LIO for tag 0x%x\n",
- 			    abts->exchange_addr_to_abort);
- 			return -ENOENT;
- 		}
+ 	if (abort_cmd_for_tag(vha, abts->exchange_addr_to_abort)) {
+ 		/* send TASK_ABORT response immediately */
 -		qlt_24xx_send_abts_resp(vha, abts, FCP_TMF_CMPL, false);
++		qlt_24xx_send_abts_resp(ha->base_qpair, abts,
++		    FCP_TMF_CMPL, false);
+ 		return 0;
  	}
  
  	ql_dbg(ql_dbg_tgt_mgt, vha, 0xf00f,
