From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drm-intel-fixes tree
Date: Thu, 8 Jun 2017 10:20:31 +1000
Message-ID: <20170608102031.456ce4d3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34977 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751049AbdFHAUe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Jun 2017 20:20:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chris Wilson <chris@chris-wilson.co.uk>, Jani Nikula <jani.nikula@intel.com>

Hi all,

After merging the drm-misc-fixes tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/gpu/drm/i915/intel_engine_cs.c: In function 'intel_engine_is_idle':
drivers/gpu/drm/i915/intel_engine_cs.c:1103:27: warning: unused variable 'dev_priv' [-Wunused-variable]
  struct drm_i915_private *dev_priv = engine->i915;
                           ^

Introduced by commit

  d9533f19d840 ("drm/i915: Hold a wakeref for probing the ring registers")

-- 
Cheers,
Stephen Rothwell
