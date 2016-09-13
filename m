From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the scsi tree
Date: Tue, 13 Sep 2016 14:15:46 +1000
Message-ID: <20160913141546.648845fb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Bryant G. Ly" <bryantly@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Michael Cyr <mikecyr@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

Hi James,

After merging the scsi tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c: In function 'ibmvscsis_rdma':
drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c:3190:20: warning: unused variable 'srp' [-Wunused-variable]
    struct srp_cmd *srp = (struct srp_cmd *)iue->sbuf->buf;
                    ^

Introduced by commit

  812902159d41 ("scsi: ibmvscsis: Code cleanup of print statements")

-- 
Cheers,
Stephen Rothwell
