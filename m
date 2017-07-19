From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Date: Wed, 19 Jul 2017 11:30:54 +1000
Message-ID: <20170719113004.457469b1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37267 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751560AbdGSBa4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 Jul 2017 21:30:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Navare, Manasi D" <manasi.d.navare@intel.com>, Jani Nikula <jani.nikula@intel.com>

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/i915_reg.h

between commit:

  c379b897ba1a ("drm/i915/cnl: Fix the CURSOR_COEFF_MASK used in DDI Vswing Programming")

from Linus' tree and commit:

  5a8dd2af31a7 ("drm/i915/cnl: Fix RMW on ddi vswing sequence.")
(which is also commit 33b92c1e1f27 in Linus' tree)

from the drm-misc tree.

I fixed it up (I just used the version from Linus' tree) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
