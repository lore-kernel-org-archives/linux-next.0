From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with the drm tree
Date: Wed, 7 Sep 2016 13:59:26 +1000
Message-ID: <20160907135926.17a52554@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36737 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755693AbcIGD73 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Sep 2016 23:59:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>, Dave Gordon <david.s.gordon@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  include/drm/drmP.h

between commit:

  c4e68a583202 ("drm: Introduce DRM_DEV_* log messages")

from the drm tree and commit:

  30b0da8d556e ("drm: extra printk() wrapper macros")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

I just did a minimal fixup, and more work consolidating these changes
could probably be done.

-- 
Cheers,
Stephen Rothwell

diff --cc include/drm/drmP.h
index 94eb138753a9,734e4fb11f52..000000000000
--- a/include/drm/drmP.h
+++ b/include/drm/drmP.h
@@@ -194,26 -205,8 +214,23 @@@ void drm_printk(const char *level, unsi
  				      DEFAULT_RATELIMIT_BURST);		\
  									\
  	if (__ratelimit(&_rs))						\
 -		drm_err(fmt, ##__VA_ARGS__);				\
 +		DRM_DEV_ERROR(dev, fmt, ##__VA_ARGS__);			\
 +})
 +#define DRM_ERROR_RATELIMITED(fmt, ...)					\
 +	DRM_DEV_ERROR_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
 +
 +#define DRM_DEV_INFO(dev, fmt, ...)					\
 +	drm_dev_printk(dev, KERN_INFO, DRM_UT_NONE, __func__, "", fmt,	\
 +		       ##__VA_ARGS__)
- #define DRM_INFO(fmt, ...)						\
- 	drm_printk(KERN_INFO, DRM_UT_NONE, __func__, "", fmt, ##__VA_ARGS__)
 +
 +#define DRM_DEV_INFO_ONCE(dev, fmt, ...)				\
 +({									\
 +	static bool __print_once __read_mostly;				\
 +	if (!__print_once) {						\
 +		__print_once = true;					\
 +		DRM_DEV_INFO(dev, fmt, ##__VA_ARGS__);			\
 +	}								\
  })
- #define DRM_INFO_ONCE(fmt, ...) DRM_DEV_INFO_ONCE(NULL, fmt, ##__VA_ARGS__)
  
  /**
   * Debug output.
