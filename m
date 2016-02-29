From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Mon, 29 Feb 2016 13:59:46 +1100
Message-ID: <20160229135946.3d183dd8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Mario Kleiner <mario.kleiner.de@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c

between commit:

  e1d09dc0ccc6 ("drm/amdgpu: Don't hang in amdgpu_flip_work_func on disabled crtc.")

from Linus' tree and commit:

  6bd9e877ce53 ("drm/amdgpu: Move MMIO flip out of spinlocked region")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 8297bc319369,2cb53c24dec0..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@@ -72,13 -70,16 +70,16 @@@ static void amdgpu_flip_work_func(struc
  
  	struct drm_crtc *crtc = &amdgpuCrtc->base;
  	unsigned long flags;
 -	unsigned i;
 -	int vpos, hpos, stat, min_udelay;
 +	unsigned i, repcnt = 4;
 +	int vpos, hpos, stat, min_udelay = 0;
  	struct drm_vblank_crtc *vblank = &crtc->dev->vblank[work->crtc_id];
  
- 	amdgpu_flip_wait_fence(adev, &work->excl);
+ 	if (amdgpu_flip_handle_fence(work, &work->excl))
+ 		return;
+ 
  	for (i = 0; i < work->shared_count; ++i)
- 		amdgpu_flip_wait_fence(adev, &work->shared[i]);
+ 		if (amdgpu_flip_handle_fence(work, &work->shared[i]))
+ 			return;
  
  	/* We borrow the event spin lock for protecting flip_status */
  	spin_lock_irqsave(&crtc->dev->event_lock, flags);
@@@ -123,19 -119,12 +124,19 @@@
  		spin_lock_irqsave(&crtc->dev->event_lock, flags);
  	};
  
 +	if (!repcnt)
 +		DRM_DEBUG_DRIVER("Delay problem on crtc %d: min_udelay %d, "
 +				 "framedur %d, linedur %d, stat %d, vpos %d, "
 +				 "hpos %d\n", work->crtc_id, min_udelay,
 +				 vblank->framedur_ns / 1000,
 +				 vblank->linedur_ns / 1000, stat, vpos, hpos);
 +
- 	/* do the flip (mmio) */
- 	adev->mode_info.funcs->page_flip(adev, work->crtc_id, work->base);
  	/* set the flip status */
  	amdgpuCrtc->pflip_status = AMDGPU_FLIP_SUBMITTED;
- 
  	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+ 
+ 	/* Do the flip (mmio) */
+ 	adev->mode_info.funcs->page_flip(adev, work->crtc_id, work->base);
  }
  
  /*
