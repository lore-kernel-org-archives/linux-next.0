From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Date: Wed, 30 Sep 2015 11:32:13 +1000
Message-ID: <20150930113213.71a9aecb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56032 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752265AbbI3BcO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Sep 2015 21:32:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michel Thierry <michel.thierry@intel.com>, Jani Nikula <jani.nikula@intel.com>, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/intel_lrc.c

between commit:

  dfc53c5e73f8 ("drm/i915: Consider HW CSB write pointer before resetting the sw read pointer")

from the drm-intel-fixes tree and commit:

  83843d84fcd3 ("drm/i915: Parametrize LRC registers")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/i915/intel_lrc.c
index 7412caedcf7f,256167b2e2ab..000000000000
--- a/drivers/gpu/drm/i915/intel_lrc.c
+++ b/drivers/gpu/drm/i915/intel_lrc.c
@@@ -492,10 -519,8 +519,8 @@@ void intel_lrc_irq_handler(struct intel
  
  	while (read_pointer < write_pointer) {
  		read_pointer++;
- 		status = I915_READ(RING_CONTEXT_STATUS_BUF(ring) +
- 				(read_pointer % GEN8_CSB_ENTRIES) * 8);
- 		status_id = I915_READ(RING_CONTEXT_STATUS_BUF(ring) +
- 				(read_pointer % GEN8_CSB_ENTRIES) * 8 + 4);
 -		status = I915_READ(RING_CONTEXT_STATUS_BUF_LO(ring, read_pointer % 6));
 -		status_id = I915_READ(RING_CONTEXT_STATUS_BUF_HI(ring, read_pointer % 6));
++		status = I915_READ(RING_CONTEXT_STATUS_BUF_LO(ring, read_pointer % GEN8_CSB_ENTRIES));
++		status_id = I915_READ(RING_CONTEXT_STATUS_BUF_HI(ring, read_pointer % GEN8_CSB_ENTRIES));
  
  		if (status & GEN8_CTX_STATUS_IDLE_ACTIVE)
  			continue;
@@@ -1424,8 -1477,10 +1479,11 @@@ static int gen8_init_common_ring(struc
  {
  	struct drm_device *dev = ring->dev;
  	struct drm_i915_private *dev_priv = dev->dev_private;
 +	u8 next_context_status_buffer_hw;
  
+ 	lrc_setup_hardware_status_page(ring,
+ 				ring->default_context->engine[ring->id].state);
+ 
  	I915_WRITE_IMR(ring, ~(ring->irq_enable_mask | ring->irq_keep_mask));
  	I915_WRITE(RING_HWSTAM(ring->mmio_base), 0xffffffff);
  
