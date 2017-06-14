From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the drm-intel-fixes
 tree
Date: Wed, 14 Jun 2017 10:50:41 +1000
Message-ID: <20170614105041.5fccf277@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34459 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753311AbdFNAun (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Jun 2017 20:50:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, Robert Foss <robert.foss@collabora.com>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/intel_display.c

between commit:

  9a775e0308b5 ("drm/i915: Fix scaling check for 90/270 degree plane rotation")

from the drm-intel-fixes tree and commit:

  c2c446ad2943 ("drm: Add DRM_MODE_ROTATE_ and DRM_MODE_REFLECT_ to UAPI")

from the drm tree.

I fixed it up (the former removed an instance of that was changed by the
latter) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
