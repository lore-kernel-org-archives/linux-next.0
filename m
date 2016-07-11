From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the jc_docs tree
Date: Mon, 11 Jul 2016 12:32:35 +1000
Message-ID: <20160711123235.39cf9e31@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43284 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757287AbcGKCch (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 10 Jul 2016 22:32:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  Documentation/index.rst

between commit:

  17defc282fe6 ("Documentation: add meta-documentation for Sphinx and kernel-doc")

from the jc_docs tree and commit:

  cb597fcea5c2 ("Documentation/gpu: add new gpu.rst converted from DocBook gpu.tmpl")

from the drm tree.

I fixed it up (see below - I just put them in alphabetical order ...)
and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc Documentation/index.rst
index ad07716c73f4,dacc77b43c29..000000000000
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@@ -13,8 -13,7 +13,9 @@@ Contents
  .. toctree::
     :maxdepth: 2
  
+    gpu/index
 +   kernel-documentation
 +   media/media_uapi
  
  Indices and tables
  ==================
