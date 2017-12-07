From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the drm-intel-fixes
 tree
Date: Fri, 8 Dec 2017 09:15:22 +1100
Message-ID: <20171208091522.5b757a90@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39567 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750919AbdLGWPY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 7 Dec 2017 17:15:24 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>

Hi all,

Commit

  365ad5df9caa ("drm/i915/gvt: Export intel_gvt_render_mmio_to_ring_id()")

is missing a Signed-off-by from its committer.

-- 
Cheers,
Stephen Rothwell
