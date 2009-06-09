From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree with the scsi tree
Date: Tue, 9 Jun 2009 19:04:15 +1000
Message-ID: <20090609190415.3bfba32d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43167 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752356AbZFIJEQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2009 05:04:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Brian King <brking@linux.vnet.ibm.com>, James Bottomley <James.Bottomley@HansenPartnership.com>

Hi Greg,

Today's linux-next merge of the driver-core tree got a conflict in
drivers/scsi/ibmvscsi/ibmvscsi.c between commit
126c5cc37e682e7c5ae96754994b1cb50c2d0cb5 ("[SCSI] ibmvscsi: Add support
for capabilities MAD") from the scsi tree and commit
1e87031283511c775454ecd57f16a1a2de30aafa ("ibmvscsi: gadget: at91_udc:
remove driver_data direct access of struct device") from the driver-core
tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/scsi/ibmvscsi/ibmvscsi.c
index 11d2602,ae5ed2b..0000000
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@@ -1968,8 -1740,7 +1968,8 @@@ static int ibmvscsi_probe(struct vio_de
  
  static int ibmvscsi_remove(struct vio_dev *vdev)
  {
- 	struct ibmvscsi_host_data *hostdata = vdev->dev.driver_data;
+ 	struct ibmvscsi_host_data *hostdata = dev_get_drvdata(&vdev->dev);
 +	unmap_persist_bufs(hostdata);
  	release_event_pool(&hostdata->pool, hostdata);
  	ibmvscsi_ops->release_crq_queue(&hostdata->queue, hostdata,
  					max_events);
