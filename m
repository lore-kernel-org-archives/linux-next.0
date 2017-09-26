From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the scsi-mkp tree
Date: Tue, 26 Sep 2017 14:09:47 +1000
Message-ID: <20170926140947.0ee82f2d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36521 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754228AbdIZEJu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Sep 2017 00:09:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jason Yan <yanaijie@huawei.com>

Hi Martin,

After merging the scsi-mkp tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/scsi/hisi_sas/hisi_sas_main.c: In function 'hisi_sas_controller_reset':
drivers/scsi/hisi_sas/hisi_sas_main.c:1049:24: warning: unused variable 'sas_ha' [-Wunused-variable]
  struct sas_ha_struct *sas_ha = &hisi_hba->sha;
                        ^

Introduced by commit

  042ebd293b86 ("scsi: libsas: kill useless ha_event and do some cleanup")

-- 
Cheers,
Stephen Rothwell
