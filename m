From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the s390 tree
Date: Tue, 2 Dec 2008 09:39:20 +1100
Message-ID: <20081202093920.7f700183.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33046 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752529AbYLAWjp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Dec 2008 17:39:45 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, Swen Schillig <swen@vnet.ibm.com>, James Bottomley <James.Bottomley@HansenPartnership.com>, Christof Schmitt <christof.schmitt@de.ibm.com>

Hi Martin,

Today's linux-next merge of the s390 tree got a conflict in
drivers/s390/scsi/zfcp_erp.c between commit
fca55b6fb587e42c7761ee30bd1a6c313a9270c9 ("[SCSI] zfcp: fix deadlock
between wq triggered port scan and ERP") from the scsi-rc-fixes tree and
commit c70beccd971850d07d0dc5afcd5e1c6580c7e1e5 ("[S390] zfcp: Report
microcode level through service level interface") from the s390 tree.

I fixed it up (by taking both changes - see below) and can carry the
fix.  Someone should check that it is correct.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/s390/scsi/zfcp_erp.c
index c557ba3,e63eebf..0000000
--- a/drivers/s390/scsi/zfcp_erp.c
+++ b/drivers/s390/scsi/zfcp_erp.c
@@@ -1281,10 -1283,11 +1284,13 @@@ static void zfcp_erp_action_cleanup(str
  		break;
  
  	case ZFCP_ERP_ACTION_REOPEN_ADAPTER:
- 		if (result != ZFCP_ERP_SUCCEEDED)
+ 		if (result != ZFCP_ERP_SUCCEEDED) {
+ 			unregister_service_level(&adapter->service_level);
  			zfcp_erp_rports_del(adapter);
- 		else
 -		} else
++		} else {
+ 			register_service_level(&adapter->service_level);
 +			schedule_work(&adapter->scan_work);
++		}
  		zfcp_adapter_put(adapter);
  		break;
  	}
