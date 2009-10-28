From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] tpm: fix header for modular build
Date: Wed, 28 Oct 2009 10:49:26 -0700
Message-ID: <20091028104926.385d350f.randy.dunlap@oracle.com>
References: <20091028190643.627f10aa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:18217 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755343AbZJ1R4M (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Oct 2009 13:56:12 -0400
In-Reply-To: <20091028190643.627f10aa.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, tpmdd-devel@lists.sourceforge.net
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix build for TCG_TPM=m.  Header file doesn't handle this
and incorrectly builds stubs.

drivers/char/tpm/tpm.c:720: error: redefinition of 'tpm_pcr_read'
include/linux/tpm.h:35: error:previous definition of 'tpm_pcr_read' was here
drivers/char/tpm/tpm.c:752: error: redefinition of 'tpm_pcr_extend'
include/linux/tpm.h:38: error:previous definition of 'tpm_pcr_extend' was here

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 include/linux/tpm.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20091028.orig/include/linux/tpm.h
+++ linux-next-20091028/include/linux/tpm.h
@@ -27,7 +27,7 @@
  */
 #define	TPM_ANY_NUM 0xFFFF
 
-#if defined(CONFIG_TCG_TPM)
+#if defined(CONFIG_TCG_TPM) || defined(CONFIG_TCG_TPM_MODULE)
 
 extern int tpm_pcr_read(u32 chip_num, int pcr_idx, u8 *res_buf);
 extern int tpm_pcr_extend(u32 chip_num, int pcr_idx, const u8 *hash);
