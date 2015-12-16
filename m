From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Date: Wed, 16 Dec 2015 11:38:07 +1100
Message-ID: <20151216113807.71dda644@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50480 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754434AbbLPAiL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Dec 2015 19:38:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Hellstrom <thellstrom@vmware.com>, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Thierry Reding <treding@nvidia.com>, Boris Brezillon <boris.brezillon@free-electrons.com>

Hi all,

Today's linux-next merge of the drm-misc tree got conflicts in:

  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c

between commit:

  8fbf9d92a7bc ("drm/vmwgfx: Implement the cursor_set2 callback v2")

from Linus' tree and commit:

  d7955fcff889 ("drm/vmwgfx: Constify function pointer structs")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index 78693a0a598c,2def684e61a4..000000000000
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@@ -294,8 -294,8 +294,8 @@@ static int vmw_ldu_crtc_set_config(stru
  	return vmw_ldu_commit_list(dev_priv);
  }
  
- static struct drm_crtc_funcs vmw_legacy_crtc_funcs = {
+ static const struct drm_crtc_funcs vmw_legacy_crtc_funcs = {
 -	.cursor_set = vmw_du_crtc_cursor_set,
 +	.cursor_set2 = vmw_du_crtc_cursor_set2,
  	.cursor_move = vmw_du_crtc_cursor_move,
  	.gamma_set = vmw_du_crtc_gamma_set,
  	.destroy = vmw_ldu_crtc_destroy,
diff --cc drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index 7ba5a00b3b68,ecac70af032a..000000000000
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@@ -530,8 -530,8 +530,8 @@@ out_no_fence
  	return ret;
  }
  
- static struct drm_crtc_funcs vmw_screen_object_crtc_funcs = {
+ static const struct drm_crtc_funcs vmw_screen_object_crtc_funcs = {
 -	.cursor_set = vmw_du_crtc_cursor_set,
 +	.cursor_set2 = vmw_du_crtc_cursor_set2,
  	.cursor_move = vmw_du_crtc_cursor_move,
  	.gamma_set = vmw_du_crtc_gamma_set,
  	.destroy = vmw_sou_crtc_destroy,
diff --cc drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 58c38e7723d8,87fc00af8d28..000000000000
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@@ -1040,8 -1040,8 +1040,8 @@@ out_finish
  /*
   *  Screen Target CRTC dispatch table
   */
- static struct drm_crtc_funcs vmw_stdu_crtc_funcs = {
+ static const struct drm_crtc_funcs vmw_stdu_crtc_funcs = {
 -	.cursor_set = vmw_du_crtc_cursor_set,
 +	.cursor_set2 = vmw_du_crtc_cursor_set2,
  	.cursor_move = vmw_du_crtc_cursor_move,
  	.gamma_set = vmw_du_crtc_gamma_set,
  	.destroy = vmw_stdu_crtc_destroy,
