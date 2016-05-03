From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the drm-intel
 tree
Date: Tue, 3 May 2016 13:24:12 +1000
Message-ID: <20160503132412.30a61b5c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/intel_display.c

between commits:

  f7e5838bb37d ("drm/i915: Simplify reset_counter handling during atomic modesetting")

from the drm-intel tree and commit:

  81072bfd13f2 ("drm/i915: Rename async to nonblock.")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/intel_display.c
index ff60241b1f76,5d29b838d8d7..000000000000
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@@ -13462,9 -13414,12 +13462,9 @@@ static int intel_atomic_prepare_commit(
  		return ret;
  
  	ret = drm_atomic_helper_prepare_planes(dev, state);
 -	if (!ret && !nonblock && !i915_reset_in_progress(&dev_priv->gpu_error)) {
 -		u32 reset_counter;
 -
 -		reset_counter = atomic_read(&dev_priv->gpu_error.reset_counter);
 -		mutex_unlock(&dev->struct_mutex);
 +	mutex_unlock(&dev->struct_mutex);
  
- 	if (!ret && !async) {
++	if (!ret && !nonblock) {
  		for_each_plane_in_state(state, plane, plane_state, i) {
  			struct intel_plane_state *intel_plane_state =
  				to_intel_plane_state(plane_state);
