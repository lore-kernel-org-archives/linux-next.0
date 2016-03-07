From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the drm tree
Date: Mon, 7 Mar 2016 19:14:13 +1100
Message-ID: <20160307191413.1a2e499a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@suse.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  drivers/gpu/drm/omapdrm/omap_gem.c

between commit:

  cdb0381d2f19 ("drm/omap: gem: Clean up GEM objects memory flags")
(and others following)

from the drm tree and commit:

  c45472f906f4 ("dma-mapping: rename dma_*_writecombine() to dma_*_wc()")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/omapdrm/omap_gem.c
index cc36a8dc9bd4,359b0d7e8ef7..000000000000
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@@ -1305,23 -1324,22 +1305,23 @@@ void omap_gem_free_object(struct drm_ge
  	 */
  	WARN_ON(omap_obj->paddr_cnt > 0);
  
 -	/* don't free externally allocated backing memory */
 -	if (!(omap_obj->flags & OMAP_BO_EXT_MEM)) {
 -		if (omap_obj->pages)
 +	if (omap_obj->pages) {
 +		if (omap_obj->flags & OMAP_BO_MEM_DMABUF)
 +			kfree(omap_obj->pages);
 +		else
  			omap_gem_detach_pages(obj);
 +	}
  
 -		if (!is_shmem(obj)) {
 -			dma_free_wc(dev->dev, obj->size, omap_obj->vaddr,
 -				    omap_obj->paddr);
 -		} else if (omap_obj->vaddr) {
 -			vunmap(omap_obj->vaddr);
 -		}
 +	if (omap_obj->flags & OMAP_BO_MEM_DMA_API) {
- 		dma_free_writecombine(dev->dev, obj->size,
++		dma_free_wc(dev->dev, obj->size,
 +				omap_obj->vaddr, omap_obj->paddr);
 +	} else if (omap_obj->vaddr) {
 +		vunmap(omap_obj->vaddr);
 +	} else if (obj->import_attach) {
 +		drm_prime_gem_destroy(obj, omap_obj->sgt);
  	}
  
 -	/* don't free externally allocated syncobj */
 -	if (!(omap_obj->flags & OMAP_BO_EXT_SYNC))
 -		kfree(omap_obj->sync);
 +	kfree(omap_obj->sync);
  
  	drm_gem_object_release(obj);
  
@@@ -1410,25 -1428,10 +1410,25 @@@ struct drm_gem_object *omap_gem_new(str
  		mapping_set_gfp_mask(mapping, GFP_USER | __GFP_DMA32);
  	}
  
 +	/* Allocate memory if needed. */
 +	if (flags & OMAP_BO_MEM_DMA_API) {
- 		omap_obj->vaddr = dma_alloc_writecombine(dev->dev, size,
++		omap_obj->vaddr = dma_alloc_wc(dev->dev, size,
 +							 &omap_obj->paddr,
 +							 GFP_KERNEL);
 +		if (!omap_obj->vaddr)
 +			goto err_release;
 +	}
 +
 +	spin_lock(&priv->list_lock);
 +	list_add(&omap_obj->mm_list, &priv->obj_list);
 +	spin_unlock(&priv->list_lock);
 +
  	return obj;
  
 -fail:
 -	omap_gem_free_object(obj);
 +err_release:
 +	drm_gem_object_release(obj);
 +err_free:
 +	kfree(omap_obj);
  	return NULL;
  }
  
