From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm tree
Date: Thu, 8 Apr 2010 13:12:51 +1000
Message-ID: <20100408131251.b69e2fa2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39720 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751908Ab0DHDMy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 7 Apr 2010 23:12:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pauli Nieminen <suokkos@gmail.com>, Jerome Glisse <jglisse@redhat.com>

Hi Dave,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/gpu/drm/ttm/ttm_page_alloc.c: In function 'ttm_page_pool_free':
drivers/gpu/drm/ttm/ttm_page_alloc.c:311: error: implicit declaration of function 'kmalloc'
drivers/gpu/drm/ttm/ttm_page_alloc.c:312: warning: assignment makes pointer from integer without a cast
drivers/gpu/drm/ttm/ttm_page_alloc.c:375: error: implicit declaration of function 'kfree'
drivers/gpu/drm/ttm/ttm_page_alloc.c: In function 'ttm_alloc_new_pages':
drivers/gpu/drm/ttm/ttm_page_alloc.c:483: warning: assignment makes pointer from integer without a cast

Caused by commit 1403b1a38e8b19a4cc17e2c158e278628943a436 ("drm/ttm: add
pool wc/uc page allocator V3") interacting with the removal of slab.h
from percpu.h.

I applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 8 Apr 2010 13:05:05 +1000
Subject: [PATCH] drm/ttm: using kmalloc/kfree requires including slab.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/ttm/ttm_page_alloc.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc.c b/drivers/gpu/drm/ttm/ttm_page_alloc.c
index 6ca9b27..d6c40bd 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc.c
@@ -36,6 +36,7 @@
 #include <linux/mm_types.h>
 #include <linux/module.h>
 #include <linux/mm.h>
+#include <linux/slab.h>
 
 #include <asm/atomic.h>
 #include <asm/agp.h>
-- 
1.7.0.4

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
