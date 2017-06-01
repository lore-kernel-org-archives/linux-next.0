From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the target-bva tree with the
 target-updates tree
Date: Thu, 1 Jun 2017 14:10:55 +1000
Message-ID: <20170601141055.3b64fefc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43491 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751091AbdFAEK7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 1 Jun 2017 00:10:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bart Van Assche <bart.vanassche@gmail.com>, "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Bart,

Today's linux-next merge of the target-bva tree got a conflict in:

  drivers/target/target_core_transport.c

between commit:

  4ff83daa0200 ("target: Re-add check to reject control WRITEs with overflow data")

from the target-updates tree and commit:

  2c66660df665 ("target: Fix overflow/underflow handling of commands with a Data-Out buffer")

from the target-bva tree.

I fixed it up (I think (guidance appreciated), see below) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/target/target_core_transport.c
index 6025935036c9,6cd49fe578a7..000000000000
--- a/drivers/target/target_core_transport.c
+++ b/drivers/target/target_core_transport.c
@@@ -1164,37 -1164,7 +1164,21 @@@ target_cmd_size_check(struct se_cmd *cm
  			" %u does not match SCSI CDB Length: %u for SAM Opcode:"
  			" 0x%02x\n", cmd->se_tfo->get_fabric_name(),
  				cmd->data_length, size, cmd->t_task_cdb[0]);
 +
 +		if (cmd->data_direction == DMA_TO_DEVICE) {
- 			if (cmd->se_cmd_flags & SCF_SCSI_DATA_CDB) {
- 				pr_err_ratelimited("Rejecting underflow/overflow"
- 						   " for WRITE data CDB\n");
- 				return TCM_INVALID_CDB_FIELD;
- 			}
 +			/*
 +			 * Some fabric drivers like iscsi-target still expect to
 +			 * always reject overflow writes.  Reject this case until
 +			 * full fabric driver level support for overflow writes
 +			 * is introduced tree-wide.
 +			 */
 +			if (size > cmd->data_length) {
 +				pr_err_ratelimited("Rejecting overflow for"
 +						   " WRITE control CDB\n");
 +				return TCM_INVALID_CDB_FIELD;
 +			}
 +		}
  		/*
- 		 * Reject READ_* or WRITE_* with overflow/underflow for
- 		 * type SCF_SCSI_DATA_CDB.
- 		 */
- 		if (dev->dev_attrib.block_size != 512)  {
- 			pr_err("Failing OVERFLOW/UNDERFLOW for LBA op"
- 				" CDB on non 512-byte sector setup subsystem"
- 				" plugin: %s\n", dev->transport->name);
- 			/* Returns CHECK_CONDITION + INVALID_CDB_FIELD */
- 			return TCM_INVALID_CDB_FIELD;
- 		}
- 		/*
  		 * For the overflow case keep the existing fabric provided
  		 * ->data_length.  Otherwise for the underflow case, reset
  		 * ->data_length to the smaller SCSI expected data transfer
