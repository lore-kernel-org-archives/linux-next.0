From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the scsi-mkp tree
Date: Wed, 17 May 2017 12:57:51 +1000
Message-ID: <20170517125751.7c381e10@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43179 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751368AbdEQC5y (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 May 2017 22:57:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, James Smart <jsmart2021@gmail.com>, Dick Kennedy <dick.kennedy@broadcom.com>, Hannes Reinecke <hare@suse.com>

Hi Martin,

After merging the scsi-mkp tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

ERROR: ".nvmet_fc_rcv_fcp_req" [drivers/scsi/lpfc/lpfc.ko] undefined!

Caused by commit

  a8cf5dfeb4d8 ("scsi: lpfc: Added recovery logic for running out of NVMET IO context resources")

CONFIG_NVME_TARGET_FC is not set for this build.

I have used the scsi-mkp tree from next-20170516 for today.

-- 
Cheers,
Stephen Rothwell
