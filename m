From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm tree
Date: Thu, 17 Mar 2016 15:41:21 +1100
Message-ID: <20160317154121.1b47aff1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35914 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751893AbcCQElY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Mar 2016 00:41:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>

Hi Dave,

After merging the drm tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c: In function 'amdgpu_gem_userptr_ioctl':
drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:321:2: error: implicit declaration of function 'release_pages' [-Werror=implicit-function-declaration]
  release_pages(bo->tbo.ttm->pages, bo->tbo.ttm->num_pages, false);
  ^
drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c: In function 'amdgpu_cs_parser_bos':
drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:410:5: error: implicit declaration of function 'release_pages' [-Werror=implicit-function-declaration]
     release_pages(e->user_pages,
     ^

Caused by commit

  2f568dbd6b94 ("drm/amdgpu: move get_user_pages out of amdgpu_ttm_tt_pin_userptr v6")

Presumably a forgotten include file.

I added this fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 17 Mar 2016 15:30:49 +1100
Subject: [PATCH] drm/amdgpu: release_pages requires linux/pagemap.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 4f5ef4149e87..9392e50a7ba4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -25,6 +25,7 @@
  *    Jerome Glisse <glisse@freedesktop.org>
  */
 #include <linux/list_sort.h>
+#include <linux/pagemap.h>
 #include <drm/drmP.h>
 #include <drm/amdgpu_drm.h>
 #include "amdgpu.h"
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 1ecdf6c01368..0f2391ec1ed9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -26,6 +26,7 @@
  *          Jerome Glisse
  */
 #include <linux/ktime.h>
+#include <linux/pagemap.h>
 #include <drm/drmP.h>
 #include <drm/amdgpu_drm.h>
 #include "amdgpu.h"
-- 
2.7.0

-- 
Cheers,
Stephen Rothwell
