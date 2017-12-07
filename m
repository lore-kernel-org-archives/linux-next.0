From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the scsi-mkp tree
Date: Thu, 7 Dec 2017 14:57:28 +1100
Message-ID: <20171207145728.57cd9ac4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39999 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752498AbdLGD5b (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 Dec 2017 22:57:31 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bart.vanassche@wdc.com>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>

Hi Martin,

After merging the scsi-mkp tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "init_rcu_head" [drivers/scsi/scsi_mod.ko] undefined!
ERROR: "destroy_rcu_head" [drivers/scsi/scsi_mod.ko] undefined!

Caused by commit

  ac90420f17c9 ("scsi: core: Ensure that the SCSI error handler gets woken up")

I have used the scsi-mkp tree from next-20171206 for today.

-- 
Cheers,
Stephen Rothwell
