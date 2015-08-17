From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-exynos tree
Date: Mon, 17 Aug 2015 13:51:30 +1000
Message-ID: <20150817135130.162b3a40@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57238 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750881AbbHQDvf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 16 Aug 2015 23:51:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Inki,

After merging the drm-exynos tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpu/drm/exynos/exynos_mixer.c: In function 'vp_video_buffer':
drivers/gpu/drm/exynos/exynos_mixer.c:395:15: error: 'struct exynos_drm_plane' has no member named 'pixel_format'
  switch (plane->pixel_format) {
               ^
In file included from drivers/gpu/drm/exynos/exynos_mixer.c:17:0:
drivers/gpu/drm/exynos/exynos_mixer.c:404:10: error: 'struct exynos_drm_plane' has no member named 'pixel_format'
     plane->pixel_format);
          ^
include/drm/drmP.h:164:17: note: in definition of macro 'DRM_ERROR'
  drm_err(fmt, ##__VA_ARGS__)
                 ^
drivers/gpu/drm/exynos/exynos_mixer.c:411:11: error: 'struct exynos_drm_plane' has no member named 'scan_flag'
  if (plane->scan_flag & DRM_MODE_FLAG_INTERLACE) {
           ^
drivers/gpu/drm/exynos/exynos_mixer.c:417:39: error: 'struct exynos_drm_plane' has no member named 'pitch'
    luma_addr[1] = luma_addr[0] + plane->pitch;
                                       ^
drivers/gpu/drm/exynos/exynos_mixer.c:418:43: error: 'struct exynos_drm_plane' has no member named 'pitch'
    chroma_addr[1] = chroma_addr[0] + plane->pitch;
                                           ^
In file included from drivers/gpu/drm/exynos/exynos_mixer.c:20:0:
drivers/gpu/drm/exynos/exynos_mixer.c:439:53: error: 'struct exynos_drm_plane' has no member named 'pitch'
  vp_reg_write(res, VP_IMG_SIZE_Y, VP_IMG_HSIZE(plane->pitch) |
                                                     ^
drivers/gpu/drm/exynos/regs-vp.h:59:5: note: in definition of macro 'VP_MASK_VAL'
  (((val) << (low_bit)) & VP_MASK(high_bit, low_bit))
     ^
drivers/gpu/drm/exynos/exynos_mixer.c:439:35: note: in expansion of macro 'VP_IMG_HSIZE'
  vp_reg_write(res, VP_IMG_SIZE_Y, VP_IMG_HSIZE(plane->pitch) |
                                   ^
drivers/gpu/drm/exynos/exynos_mixer.c:440:21: error: 'struct exynos_drm_plane' has no member named 'fb_height'
   VP_IMG_VSIZE(plane->fb_height));
                     ^
drivers/gpu/drm/exynos/regs-vp.h:59:5: note: in definition of macro 'VP_MASK_VAL'
  (((val) << (low_bit)) & VP_MASK(high_bit, low_bit))
     ^
drivers/gpu/drm/exynos/exynos_mixer.c:440:3: note: in expansion of macro 'VP_IMG_VSIZE'
   VP_IMG_VSIZE(plane->fb_height));
   ^
drivers/gpu/drm/exynos/exynos_mixer.c:442:53: error: 'struct exynos_drm_plane' has no member named 'pitch'
  vp_reg_write(res, VP_IMG_SIZE_C, VP_IMG_HSIZE(plane->pitch) |
                                                     ^
drivers/gpu/drm/exynos/regs-vp.h:59:5: note: in definition of macro 'VP_MASK_VAL'
  (((val) << (low_bit)) & VP_MASK(high_bit, low_bit))
     ^
drivers/gpu/drm/exynos/exynos_mixer.c:442:35: note: in expansion of macro 'VP_IMG_HSIZE'
  vp_reg_write(res, VP_IMG_SIZE_C, VP_IMG_HSIZE(plane->pitch) |
                                   ^
drivers/gpu/drm/exynos/exynos_mixer.c:443:21: error: 'struct exynos_drm_plane' has no member named 'fb_height'
   VP_IMG_VSIZE(plane->fb_height / 2));
                     ^
drivers/gpu/drm/exynos/regs-vp.h:59:5: note: in definition of macro 'VP_MASK_VAL'
  (((val) << (low_bit)) & VP_MASK(high_bit, low_bit))
     ^
drivers/gpu/drm/exynos/exynos_mixer.c:443:3: note: in expansion of macro 'VP_IMG_VSIZE'
   VP_IMG_VSIZE(plane->fb_height / 2));
   ^
drivers/gpu/drm/exynos/exynos_mixer.c:445:39: error: 'struct exynos_drm_plane' has no member named 'src_width'
  vp_reg_write(res, VP_SRC_WIDTH, plane->src_width);
                                       ^
drivers/gpu/drm/exynos/exynos_mixer.c:446:40: error: 'struct exynos_drm_plane' has no member named 'src_height'
  vp_reg_write(res, VP_SRC_HEIGHT, plane->src_height);
                                        ^
drivers/gpu/drm/exynos/exynos_mixer.c:451:39: error: 'struct exynos_drm_plane' has no member named 'crtc_width'
  vp_reg_write(res, VP_DST_WIDTH, plane->crtc_width);
                                       ^
drivers/gpu/drm/exynos/exynos_mixer.c:454:41: error: 'struct exynos_drm_plane' has no member named 'crtc_height'
   vp_reg_write(res, VP_DST_HEIGHT, plane->crtc_height / 2);
                                         ^
drivers/gpu/drm/exynos/exynos_mixer.c:457:41: error: 'struct exynos_drm_plane' has no member named 'crtc_height'
   vp_reg_write(res, VP_DST_HEIGHT, plane->crtc_height);
                                         ^
drivers/gpu/drm/exynos/exynos_mixer.c:472:27: error: 'struct exynos_drm_plane' has no member named 'mode_height'
  mixer_cfg_scan(ctx, plane->mode_height);
                           ^
drivers/gpu/drm/exynos/exynos_mixer.c:473:30: error: 'struct exynos_drm_plane' has no member named 'mode_height'
  mixer_cfg_rgb_fmt(ctx, plane->mode_height);
                              ^
drivers/gpu/drm/exynos/exynos_mixer.c: In function 'mixer_setup_scale':
drivers/gpu/drm/exynos/exynos_mixer.c:494:11: error: 'const struct exynos_drm_plane' has no member named 'crtc_width

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
