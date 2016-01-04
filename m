From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the drm tree
Date: Mon, 4 Jan 2016 18:45:54 +1100
Message-ID: <20160104184554.08661f70@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  drivers/gpu/drm/omapdrm/omap_gem.c

between commit:

  f4302747af02 ("drm: omapdrm: gem: Move global usergart variable to omap_drm_private")

from the drm tree and commit:

  0cf445f1b0c1 ("mm, dax, gpu: convert vm_insert_mixed to pfn_t")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/omapdrm/omap_gem.c
index 984462622291,ceba5459ceb7..000000000000
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@@ -496,8 -480,9 +498,9 @@@ static int fault_2d(struct drm_gem_obje
  			pfn, pfn << PAGE_SHIFT);
  
  	for (i = n; i > 0; i--) {
- 		vm_insert_mixed(vma, (unsigned long)vaddr, pfn);
+ 		vm_insert_mixed(vma, (unsigned long)vaddr,
+ 				__pfn_to_pfn_t(pfn, PFN_DEV));
 -		pfn += usergart[fmt].stride_pfn;
 +		pfn += priv->usergart[fmt].stride_pfn;
  		vaddr += PAGE_SIZE * m;
  	}
  
