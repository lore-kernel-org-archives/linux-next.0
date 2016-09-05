From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 5 Sep 2016 19:19:17 +1000
Message-ID: <20160905191917.4ca6dd56@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38379 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751648AbcIEJTU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Sep 2016 05:19:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>

Hi Andrew,

After merging the akpm tree, today's linux-next build (powerpc
pseries_le_defconfig) failed like this:

powerpc-linux-ld: arch/powerpc/purgatory/purgatory.o: compiled for a big endian system and target is little endian  
powerpc-linux-ld: failed to merge target specific data of file arch/powerpc/purgatory/purgatory.o
powerpc-linux-ld: arch/powerpc/purgatory/printf.o: compiled for a big endian system and target is little endian
powerpc-linux-ld: failed to merge target specific data of file arch/powerpc/purgatory/printf.o

and so on ...

Presumably caused by commit

  b26db279958b ("powerpc: add purgatory for kexec_file_load implementation")

I added this patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 5 Sep 2016 19:12:42 +1000
Subject: [PATCH] disable KEXEC_FILE on powerpc for now

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 41300c3a1bfe..86ea07d7ead2 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -467,6 +467,7 @@ config KEXEC_FILE
 	depends on PPC64
 	depends on CRYPTO=y
 	depends on CRYPTO_SHA256=y
+	depends on BROKEN
 	help
 	  This is a new version of the kexec system call. This call is
 	  file based and takes in file descriptors as system call arguments
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
