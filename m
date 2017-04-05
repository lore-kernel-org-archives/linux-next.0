From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Wed, 5 Apr 2017 10:30:17 +1000
Message-ID: <20170405103017.16b320b1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45337 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752934AbdDEAaU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 4 Apr 2017 20:30:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>, Thomas Hellstrom <thellstrom@vmware.com>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/vmwgfx/vmwgfx_fence.c

between commit:

  f7652afa8ead ("drm/vmwgfx: Type-check lookups of fence objects")

from Linus' tree and commit:

  8dfe162ac74f ("gpu: drm: drivers: Convert printk(KERN_<LEVEL> to pr_<level>")

from the drm tree.

I fixed it up (the former moved and updated the code updated by
the latter, so I just used the former) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
