From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 20 Sep 2016 16:44:14 +1000
Message-ID: <20160920164414.4062bb0b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44352 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751119AbcITGoX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Sep 2016 02:44:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

powerpc-linux-gcc: error: unrecognized command line option '-m'
scripts/Makefile.build:290: recipe for target 'arch/powerpc/purgatory/printf.o' failed

and a few more like that.

Caused by commit

  8635b1186486 ("powerpc: add purgatory for kexec_file_load implementation")

I have disabled KEXEC_FILE on powerpc again for now.

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
