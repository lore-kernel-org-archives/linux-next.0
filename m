From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Fri, 24 Nov 2017 10:37:11 +1100
Message-ID: <20171124103711.49f73d70@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48687 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752615AbdKWXhN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Nov 2017 18:37:13 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>, Frank Rowand <frank.rowand@sony.com>, Rob Herring <robh@kernel.org>

Hi all,

FIXME: Add owner of second tree to To:
       Add author(s)/SOB of conflicting commits.

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c

between commits:

  0290c4ca2536 ("of: overlay: rename identifiers to more reflect what they do")
  24789c5ce5a3 ("of: overlay: detect cases where device tree may become corrupt")
  f948d6d8b792 ("of: overlay: avoid race condition between applying multiple overlays")

from Linus' tree and commit:

  739acd85ffdb ("drm/tilcdc: Remove obsolete "ti,tilcdc,slave" dts binding support")

from the drm tree.

I fixed it up (the latter removed the file, so I did that) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
