From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the scsi tree
Date: Fri, 13 Nov 2015 12:35:36 +1100
Message-ID: <20151113123536.586e9163@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51602 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754346AbbKMBfi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Nov 2015 20:35:38 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sreekanth Reddy <sreekanth.reddy@avagotech.com>

Hi James,

After merging the scsi tree, today's linux-next build (powerpc
allyesconfig) failed like this:

In file included from drivers/scsi/mpt3sas/mpt3sas_scsih.c:59:0:
drivers/scsi/mpt3sas/mpt3sas_scsih.c: In function '_scsih_io_done':
drivers/scsi/mpt3sas/mpt3sas_base.h:1414:1: error: inlining failed in call to always_inline 'mpt3sas_scsi_direct_io_get': function body not available
 mpt3sas_scsi_direct_io_get(struct MPT3SAS_ADAPTER *ioc, u16 smid);
 ^
drivers/scsi/mpt3sas/mpt3sas_scsih.c:4448:6: error: called from here
  if (mpt3sas_scsi_direct_io_get(ioc, smid) &&
      ^
In file included from drivers/scsi/mpt3sas/mpt3sas_scsih.c:59:0:
drivers/scsi/mpt3sas/mpt3sas_base.h:1416:1: error: inlining failed in call to always_inline 'mpt3sas_scsi_direct_io_set': function body not available
 mpt3sas_scsi_direct_io_set(struct MPT3SAS_ADAPTER *ioc, u16 smid, u8 direct_io);
 ^
drivers/scsi/mpt3sas/mpt3sas_scsih.c:4454:3: error: called from here
   mpt3sas_scsi_direct_io_set(ioc, smid, 0);
   ^
In file included from drivers/scsi/mpt3sas/mpt3sas_scsih.c:5
9:0:
drivers/scsi/mpt3sas/mpt3sas_base.h:1416:1: error: inlining failed in call to always_inline 'mpt3sas_scsi_direct_io_set': function body not available
 mpt3sas_scsi_direct_io_set(struct MPT3SAS_ADAPTER *ioc, u16 smid, u8 direct_io);
 ^
drivers/scsi/mpt3sas/mpt3sas_scsih.c:4454:3: error: called from here
   mpt3sas_scsi_direct_io_set(ioc, smid, 0);
   ^

Presumably caused by commit

  c84b06a48c4d ("mpt3sas: Single driver module which supports both SAS 2.0 & SAS 3.0 HBAs")

I applied the following fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 13 Nov 2015 12:31:09 +1100
Subject: [PATCH] mpt3sas: fix inline markers on non inline function
 declarations

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/scsi/mpt3sas/mpt3sas_base.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/mpt3sas/mpt3sas_base.h b/drivers/scsi/mpt3sas/mpt3sas_base.h
index a17bea95b0c5..5ad271efbd45 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_base.h
+++ b/drivers/scsi/mpt3sas/mpt3sas_base.h
@@ -1410,9 +1410,9 @@ void mpt3sas_trigger_mpi(struct MPT3SAS_ADAPTER *ioc, u16 ioc_status,
 u8 mpt3sas_get_num_volumes(struct MPT3SAS_ADAPTER *ioc);
 void mpt3sas_init_warpdrive_properties(struct MPT3SAS_ADAPTER *ioc,
 	struct _raid_device *raid_device);
-inline u8
+u8
 mpt3sas_scsi_direct_io_get(struct MPT3SAS_ADAPTER *ioc, u16 smid);
-inline void
+void
 mpt3sas_scsi_direct_io_set(struct MPT3SAS_ADAPTER *ioc, u16 smid, u8 direct_io);
 void
 mpt3sas_setup_direct_io(struct MPT3SAS_ADAPTER *ioc, struct scsi_cmnd *scmd,
-- 
2.6.2

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
