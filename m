From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the nvdimm tree
Date: Mon, 24 Apr 2017 16:11:30 +1000
Message-ID: <20170424161130.762d71a8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56611 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1046455AbdDXGLc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 24 Apr 2017 02:11:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Dan,

After merging the nvdimm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/nvdimm/x86.c: In function 'pmem_from_user':
drivers/nvdimm/x86.c:115:11: error: implicit declaration of function '__copy_from_user_nocache' [-Werror=implicit-function-declaration]
  int rc = __copy_from_user_nocache(dst, src, size);
           ^

Caused by commit

  6e704ff67315 ("uio, libnvdimm, pmem: implement cache bypass for all copy_from_iter() operations")

interacting with commit

  3f763453e6f2 ("kill __copy_from_user_nocache()")

from the vfs tree.

I have no idea why Al removed that function, so I just applied the
following fix patch for now:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 24 Apr 2017 16:03:09 +1000
Subject: [PATCH] uio, libnvdimm, pmem: implement cache bypass for all
 copy_from_iter() operations fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/nvdimm/x86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvdimm/x86.c b/drivers/nvdimm/x86.c
index bc145d760d43..4c15cc103713 100644
--- a/drivers/nvdimm/x86.c
+++ b/drivers/nvdimm/x86.c
@@ -112,7 +112,7 @@ EXPORT_SYMBOL_GPL(arch_memcpy_to_pmem);
 static int pmem_from_user(void *dst, const void __user *src, unsigned size)
 {
 	unsigned long flushed, dest = (unsigned long) dest;
-	int rc = __copy_from_user_nocache(dst, src, size);
+	int rc = __copy_from_user(dst, src, size);
 
 	/*
 	 * On x86_64 __copy_from_user_nocache() uses non-temporal stores
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
