From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm tree
Date: Tue, 24 Jan 2017 12:25:15 +1100
Message-ID: <20170124122515.07a3fcc8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60553 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751113AbdAXBZS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Jan 2017 20:25:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vincent Abriou <vincent.abriou@st.com>, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>

Hi Dave,

After merging the drm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpu/drm/sti/sti_plane.c: In function 'sti_plane_update_fps':
drivers/gpu/drm/sti/sti_plane.c:76:33: error: 'struct drm_framebuffer' has no member named 'pixel_format'
     (char *)&plane->drm_plane.fb->pixel_format,
                                 ^

Caused by commit

  a69e466b0666 ("drm/sti: update fps debugfs entries")

Interacting with commit

  438b74a5497c ("drm: Nuke fb->pixel_format")

This should have been fixed up in commit

  d64a1661c8f7 ("Merge tag 'sti-drm-next-2017-01-06' of https://github.com/vinceab/linux into drm-next")

I have used the drm tree from next-20170123 for today.

-- 
Cheers,
Stephen Rothwell
