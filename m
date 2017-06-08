From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Date: Thu, 8 Jun 2017 13:07:40 +1000
Message-ID: <20170608130740.1bbc8db9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44481 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751444AbdFHDHm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Jun 2017 23:07:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chris Wilson <chris@chris-wilson.co.uk>, Jani Nikula <jani.nikula@intel.com>, Dave Airlie <airlied@linux.ie>

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/intel_engine_cs.c

between commit:

  d9533f19d840 ("drm/i915: Hold a wakeref for probing the ring registers")
(which is also commit a091d4ee931b in the drm-intel tree)

from the drm-intel-fixes tree and commit:

  aed2fc102ffa ("drm/i915: Check the ring is empty when declaring the engines are idle")

from the drm-intel tree.

I fixed it up (I just used the drm-intel tree version) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
