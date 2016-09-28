From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the drm tree
Date: Wed, 28 Sep 2016 12:11:11 +1000
Message-ID: <20160928121111.3c6e9dd9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34223 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756240AbcI1CLO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Sep 2016 22:11:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Airlie <airlied@linux.ie>, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Baoyou Xie <baoyou.xie@linaro.org>, Sean Paul <seanpaul@chromium.org>, Vincent Abriou <vincent.abriou@st.com>

Hi all,

Today's linux-next merge of the drm-misc tree got conflicts in:

  drivers/gpu/drm/sti/sti_dvo.c
  drivers/gpu/drm/sti/sti_hqvdp.c
  drivers/gpu/drm/sti/sti_mixer.c

between commits:

  bdfd36ef8e64 ("drm/sti: Fix sparse warnings")
  b4bba92dfbe2 ("drm/sti: remove stih415-416 platform support")

from the drm tree and commit:

  bd233af436ba ("drm/sti: mark symbols static where possible")

from the drm-misc tree.

I fixed it up (I just used the drm-misc tree versions and removed the
comflicting function in the sti_mixer.c case) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
