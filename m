From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Date: Tue, 31 May 2016 11:06:30 +1000
Message-ID: <20160531110630.3e15f9c3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53264 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1161729AbcEaBGc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 May 2016 21:06:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, Matt Roper <matthew.d.roper@intel.com>

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/intel_display.c

between commit:

  9bd18728a3f2 ("drm/i915: Ignore stale wm register values on resume on ilk-bdw (v2)")

from Linus' tree and commit:

  e3d5457c7caa ("drm/i915: Ignore stale wm register values on resume on ilk-bdw (v2)")

from the drm-intel tree.

I fixed it up (I used teh drm-intel tree version) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but
any non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
