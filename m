From: Yazen Ghannam <Yazen.Ghannam@amd.com>
Subject: [PATCH] EDAC: Document HW_EVENT_ERR_DEFERRED type
Date: Thu, 1 Dec 2016 14:24:53 -0600
Message-ID: <1480623893-76399-1-git-send-email-Yazen.Ghannam@amd.com>
References: <20161201195753.rrxgwvltptq4gegp@yaz-fedora.dyhomenet>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-by2nam03on0064.outbound.protection.outlook.com ([104.47.42.64]:17046
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750757AbcLAUZM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 1 Dec 2016 15:25:12 -0500
In-Reply-To: <20161201195753.rrxgwvltptq4gegp@yaz-fedora.dyhomenet>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Yazen Ghannam <Yazen.Ghannam@amd.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Borislav Petkov <bp@suse.de>

Add a description of the HW_EVENT_ERR_DEFERRED type that wasn't included
with commit d12a969ebbfc ("EDAC, amd64: Add Deferred Error type").

Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Borislav Petkov <bp@suse.de>
Signed-off-by: Yazen Ghannam <Yazen.Ghannam@amd.com>
---
 include/linux/edac.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/edac.h b/include/linux/edac.h
index cb56dcb..43cd51d 100644
--- a/include/linux/edac.h
+++ b/include/linux/edac.h
@@ -128,6 +128,12 @@ enum dev_type {
  *				fatal (maybe it is on an unused memory area,
  *				or the memory controller could recover from
  *				it for example, by re-trying the operation).
+ * @HW_EVENT_ERR_DEFERRED:	Deferred Error - Indicates an uncorrectable
+ *				error whose handling is not urgent. This could
+ *				be due to hardware data poisoning where the
+ *				system can continue operation until the poisoned
+ *				data is consumed. Preemptive measures may also
+ *				be taken, e.g. offlining pages, etc.
  * @HW_EVENT_ERR_FATAL:		Fatal Error - Uncorrected error that could not
  *				be recovered.
  */
-- 
2.7.4
