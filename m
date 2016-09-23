From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Date: Fri, 23 Sep 2016 11:35:47 +1000
Message-ID: <20160923113547.1f5a1d09@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35017 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933640AbcIWBfu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Sep 2016 21:35:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>, Sean Paul <seanpaul@chromium.org>

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/drm_crtc.c

between commit:

  6f00975c6190 ("drm: Reject page_flip for !DRIVER_MODESET")

from Linus' tree and commit:

  43968d7b806d ("drm: Extract drm_plane.[hc]")

from the drm-misc tree.

I fixed it up (the latter incorporated the former, so I just used the
latter) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
