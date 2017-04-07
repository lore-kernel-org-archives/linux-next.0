From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the arm64 tree
Date: Fri, 7 Apr 2017 17:41:20 +1000
Message-ID: <20170407174120.0b0baadf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55195 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932159AbdDGHlX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 7 Apr 2017 03:41:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, AKASHI Takahiro <takahiro.akashi@linaro.org>, Laura Abbott <labbott@redhat.com>

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/arm64/include/asm/cacheflush.h

between commit:

  9b0aa14e3155 ("arm64: mm: add set_memory_valid()")

from the arm64 tree and patch:

  "treewide: move set_memory_* functions away from cacheflush.h"

from the akpm tree.

I fixed it up (see below - not ideal ...) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm64/include/asm/cacheflush.h
index 728f933cef8c,7db6962fc4b4..000000000000
--- a/arch/arm64/include/asm/cacheflush.h
+++ b/arch/arm64/include/asm/cacheflush.h
@@@ -150,10 -151,4 +151,6 @@@ static inline void flush_cache_vunmap(u
  {
  }
  
- int set_memory_ro(unsigned long addr, int numpages);
- int set_memory_rw(unsigned long addr, int numpages);
- int set_memory_x(unsigned long addr, int numpages);
- int set_memory_nx(unsigned long addr, int numpages);
 +int set_memory_valid(unsigned long addr, unsigned long size, int enable);
 +
  #endif
