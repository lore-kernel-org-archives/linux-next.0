From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the jc_docs tree
Date: Mon, 12 Dec 2016 11:57:53 +1100
Message-ID: <20161212115753.4fac28f4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46673 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753064AbcLLA5z (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Dec 2016 19:57:55 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, SeongJae Park <sj38.park@gmail.com>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  Documentation/driver-api/infrastructure.rst

between commits:

  3080b056b3d4 ("docs/driver-api: Apply changed source file names")
  868c97a846a7 ("dma-buf: Extract dma-buf.rst")

from the jc_docs tree and commit:

  8a5846bf5d47 ("doc/dma-buf: Fix up include directives")

from the drm tree.

I fixed it up (the text modified by the latter was also modified by
commit 3080b056b3d4, then 868c97a846a7 moved it all to another file) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
