From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sunxi tree with the drm-misc tree
Date: Thu, 23 Jun 2016 12:59:14 +1000
Message-ID: <20160623125914.22b83979@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35121 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751018AbcFWC7Q (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Jun 2016 22:59:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>

Hi Maxime,

Today's linux-next merge of the sunxi tree got a conflict in:

  drivers/gpu/drm/sun4i/sun4i_drv.c

between commit:

  366e292df678 ("drm/sun4i: Remove open-coded drm_connector_register_all()")

from the drm-misc tree and commit:

  7aa2e2b731b3 ("drm/sun4i: Convert to connector register helpers")

from the sunxi tree.

I fixed it up (I just removed the drm_connector_register_all call as
in the former) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
