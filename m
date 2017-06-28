From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the target-updates tree with the
 scsi tree
Date: Wed, 28 Jun 2017 15:46:34 +1000
Message-ID: <20170628154634.6807e0b3@canb.auug.org.au>
References: <20170628154059.21dbfda2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43865 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750945AbdF1Fqh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Jun 2017 01:46:37 -0400
In-Reply-To: <20170628154059.21dbfda2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Quinn Tran <quinn.tran@cavium.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Himanshu Madhani <himanshu.madhani@cavium.com>

Hi all,

On Wed, 28 Jun 2017 15:40:59 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the target-updates tree got a conflict in:
> 
>   drivers/scsi/qla2xxx/qla_target.c
> 
> between commits:
> 
>   f775bd14e44d ("scsi: qla2xxx: Convert 32-bit LUN usage to 64-bit")
>   82de802ad46e ("scsi: qla2xxx: Preparation for Target MQ.")
> 
> from the scsi tree and commit:
> 
>   6b26726af699 ("qla2xxx: Convert QLA_TGT_ABTS to TARGET_SCF_LOOKUP_LUN_FROM_TAG")
> 
> from the target-updates tree.
> 
> I fixed it up (I think - see below) and can carry the fix as

OK, that was no right :-(

I have added the following fix patch as well (I suggest someone provide me with the correct fixup for tomorrow, please).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 28 Jun 2017 15:44:27 +1000
Subject: [PATCH] qla2xxx: fix up for bad merge fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/scsi/qla2xxx/qla_target.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/scsi/qla2xxx/qla_target.c b/drivers/scsi/qla2xxx/qla_target.c
index 9a054439560d..42a3f5be818c 100644
--- a/drivers/scsi/qla2xxx/qla_target.c
+++ b/drivers/scsi/qla2xxx/qla_target.c
@@ -1875,7 +1875,6 @@ static int __qlt_24xx_handle_abts(struct scsi_qla_host *vha,
 {
 	struct qla_hw_data *ha = vha->hw;
 	struct qla_tgt_mgmt_cmd *mcmd;
-	struct qla_tgt_cmd *cmd;
 	int rc;
 
 	if (abort_cmd_for_tag(vha, abts->exchange_addr_to_abort)) {
@@ -1898,14 +1897,13 @@ static int __qlt_24xx_handle_abts(struct scsi_qla_host *vha,
 	}
 	memset(mcmd, 0, sizeof(*mcmd));
 
-	cmd = container_of(se_cmd, struct qla_tgt_cmd, se_cmd);
 	mcmd->sess = sess;
 	memcpy(&mcmd->orig_iocb.abts, abts, sizeof(mcmd->orig_iocb.abts));
 	mcmd->reset_count = ha->base_qpair->chip_reset;
 	mcmd->tmr_func = QLA_TGT_ABTS;
 	mcmd->qpair = ha->base_qpair;
 
-	rc = ha->tgt.tgt_ops->handle_tmr(mcmd, cmd->unpacked_lun, mcmd->tmr_func,
+	rc = ha->tgt.tgt_ops->handle_tmr(mcmd, 0, mcmd->tmr_func,
 	    abts->exchange_addr_to_abort);
 	if (rc != 0) {
 		ql_dbg(ql_dbg_tgt_mgt, vha, 0xf052,
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
