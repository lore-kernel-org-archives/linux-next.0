From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Date: Fri, 22 Sep 2017 12:24:49 +1000
Message-ID: <20170922122449.0ada9f8d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45449 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751726AbdIVCYw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Sep 2017 22:24:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/intel_display.c

between commit:

  fd70075f82b7 ("drm/i915: Trim struct_mutex usage for kms")

from Linus' tree and commits:

  21a01abbe32a ("drm/atomic: Fix freeing connector/plane state too early by tracking commits, v3.")
  669c9215afea ("drm/atomic: Make async plane update checks work as intended, v2.")

from the drm-misc tree.

I fixed it up (I basically used the latter version of the changes to
intel_legacy_cursor_update()) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell
