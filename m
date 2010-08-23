From: "Luck, Tony" <tony.luck@intel.com>
Subject: [PATCH] Fix section mismatch: ata_sff_exit
Date: Mon, 23 Aug 2010 13:18:02 -0700
Message-ID: <4c72d77a17302aa2a9@agluck-desktop.sc.intel.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:62678 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752220Ab0HWUSC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Aug 2010 16:18:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, Jeff Garzik <jgarzik@redhat.com>

This build error showed up in linux-next tag next-20100820 for ia64:

WARNING: vmlinux.o(.init.text+0x4a952): Section mismatch in reference from the function ata_init() to the function .exit.text:ata_sff_exit()
The function __init ata_init() references
a function __exit ata_sff_exit().
This is often seen when error handling in the init function
uses functionality in the exit path.
The fix is often to remove the __exit annotation of
ata_sff_exit() so it may be used outside an exit section.

Sure enough, dropping the __exit fixes the problem.

Signed-off-by: Tony Luck <tony.luck@intel.com>

---

Tejun: I didn't pin down which commit broke this ... but you seem
to have a number of recent commits here.

diff --git a/drivers/ata/libata-sff.c b/drivers/ata/libata-sff.c
index 57ea9c7..36b8855 100644
--- a/drivers/ata/libata-sff.c
+++ b/drivers/ata/libata-sff.c
@@ -3326,7 +3326,7 @@ int __init ata_sff_init(void)
 	return 0;
 }
 
-void __exit ata_sff_exit(void)
+void ata_sff_exit(void)
 {
 	destroy_workqueue(ata_sff_wq);
 }
