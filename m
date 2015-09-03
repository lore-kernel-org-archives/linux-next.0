From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-misc tree
Date: Thu, 3 Sep 2015 10:49:19 +1000
Message-ID: <20150903104919.6419ad18@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45074 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755865AbbICAtV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Sep 2015 20:49:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Daniel Stone <daniels@collabora.com>

Hi all,

After merging the drm-misc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c: In function 'mdp5_plane_cleanup_fb':
drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c:272:26: error: 'fb' redeclared as different kind of symbol
  struct drm_framebuffer *fb = old_state->fb;
                          ^
drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c:267:27: note: previous definition of 'fb' was here
   struct drm_framebuffer *fb,
                           ^
drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c: At top level:
drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c:383:3: warning: initialization from incompatible pointer type
   .cleanup_fb = mdp5_plane_cleanup_fb,
   ^
drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c:383:3: warning: (near initialization for 'mdp5_plane_helper_funcs.cleanup_fb')

Caused by commit

  a317290af0db ("drm/atomic: Make prepare_fb/cleanup_fb only take state, v3")

Well, that was clearly never build tested :-(

I have used the drm-misc tree from next-20150902 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
