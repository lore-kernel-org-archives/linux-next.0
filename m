From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi tree with the tip tree
Date: Fri, 20 Jan 2017 14:23:43 +1100
Message-ID: <20170120142343.3d2e72af@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>
List-Id: linux-next.vger.kernel.org

Hi James,

Today's linux-next merge of the scsi tree got a conflict in:

  drivers/scsi/mpt3sas/mpt3sas_scsih.c

between commit:

  e963b7088dac ("scsi: mpt3sas: Fix hang on ata passthru commands")

from the tip tree and commit:

  ffb584565894 ("scsi: mpt3sas: fix hang on ata passthrough commands")

from the scsi tree.

I fixed it up (slightly different versions of the same patch - I used
the latter version) and can carry the fix as necessary. This is now
fixed as far as linux-next is concerned, but any non trivial conflicts
should be mentioned to your upstream maintainer when your tree is
submitted for merging.  You may also want to consider cooperating with
the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell
