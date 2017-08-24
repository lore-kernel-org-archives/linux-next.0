From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the scsi-mkp tree
Date: Thu, 24 Aug 2017 15:57:56 +1000
Message-ID: <20170824155756.2ff7ba58@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Martin,

After merging the scsi-mkp tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

drivers/scsi/lpfc/lpfc_nvmet.c:1457:1: warning: 'lpfc_nvmet_replenish_context' defined but not used [-Wunused-function]
 lpfc_nvmet_replenish_context(struct lpfc_hba *phba,
 ^

Introduced by commit

  9a38e4f1c82f ("scsi: lpfc: Fix MRQ > 1 context list handling")

-- 
Cheers,
Stephen Rothwell
