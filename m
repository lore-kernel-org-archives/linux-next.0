From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drm-misc tree
Date: Wed, 23 Sep 2015 13:20:41 +1000
Message-ID: <20150923132041.60714a8d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55532 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760017AbbIWDUo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Sep 2015 23:20:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, David Herrmann <dh.herrmann@gmail.com>

Hi all,

After merging the drm-misc tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/gpu/drm/drm_crtc.c: In function 'drm_fb_release':
drivers/gpu/drm/drm_crtc.c:3494:21: warning: unused variable 'dev' [-Wunused-variable]
  struct drm_device *dev = priv->minor->dev;
                     ^

Introduced by commit

  3d2e74c94432 ("drm/core: Preserve the fb id on close.")

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
