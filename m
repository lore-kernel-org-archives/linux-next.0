From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the mailbox tree
Date: Wed, 29 Mar 2017 16:17:47 +1100
Message-ID: <20170329161747.6618a97f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44933 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752691AbdC2FRv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Mar 2017 01:17:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Anup Patel <anup.patel@broadcom.com>

Hi Jassi,

After merging the mailbox tree, today's linux-next build (powerpc
allyesconfig) failed like this:

In file included from /home/sfr/next/next/include/linux/kvm_host.h:20:0,
                 from /home/sfr/next/next/arch/powerpc/kernel/asm-offsets.c:54:
/home/sfr/next/next/include/linux/msi.h:195:21: fatal error: asm/msi.h: No such file or directory

Caused by commit

  dbc049eee730 ("mailbox: Add driver for Broadcom FlexRM ring manager")

Not all architectures have the above include file.

I have added the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 29 Mar 2017 16:11:14 +1100
Subject: [PATCH] mailbox: do not compile test the Broadcom FlexRM Mailbox
 driver

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/mailbox/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 0b6f25e26c7c..ee1a3d9147ef 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -154,7 +154,7 @@ config BCM_PDC_MBOX
 
 config BCM_FLEXRM_MBOX
 	tristate "Broadcom FlexRM Mailbox"
-	depends on ARM64 || COMPILE_TEST
+	depends on ARM64
 	depends on HAS_DMA
 	select GENERIC_MSI_IRQ_DOMAIN
 	default ARCH_BCM_IPROC
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
