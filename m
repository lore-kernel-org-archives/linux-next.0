From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the drm-intel
 tree
Date: Tue, 29 Sep 2015 11:26:21 +1000
Message-ID: <20150929112621.520b7003@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34527 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754161AbbI2B0X (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Sep 2015 21:26:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/intel_audio.c

between commit:

  b8abe859c9d6 ("drm/i915: Always call the adjusted mode 'adjusted_mode'")

from the drm-intel tree and commit:

  9e5a3b529e84 ("drm: Remove the 'mode' argument from drm_select_eld()")

from the drm-misc tree.

I fixed it up (I used the drm-misc tree version) and can carry the fix
as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
