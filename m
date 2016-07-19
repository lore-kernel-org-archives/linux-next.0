From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the v4l-dvb tree
Date: Tue, 19 Jul 2016 11:21:37 +1000
Message-ID: <20160719112137.20ab1cf8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53545 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752412AbcGSBVj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jul 2016 21:21:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  Documentation/index.rst

between commits:

  d26a5d4350fd ("[media] doc-rst: Convert media API to rst")
  651af5e464ec ("[media] add DVB documentation to Sphinx")

from the v4l-dvb tree and commit:

  cb597fcea5c2 ("Documentation/gpu: add new gpu.rst converted from DocBook gpu.tmpl")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc Documentation/index.rst
index 31273cc2e0bc,dacc77b43c29..000000000000
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@@ -13,11 -13,7 +13,12 @@@ Contents
  .. toctree::
     :maxdepth: 2
  
+    gpu/index
 +   kernel-documentation
 +   media/media_uapi
 +   media/media_drivers
 +   media/dvb-drivers/index
 +   media/v4l-drivers/index
  
  Indices and tables
  ==================
