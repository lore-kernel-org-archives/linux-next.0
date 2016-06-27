From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the jc_docs tree with the drm tree
Date: Mon, 27 Jun 2016 13:31:24 +1000
Message-ID: <20160627133124.4e3e8dfd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
List-Id: linux-next.vger.kernel.org

Hi Jonathan,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/index.rst

between commit:

  cb597fcea5c2 ("Documentation/gpu: add new gpu.rst converted from DocBook gpu.tmpl")

from the drm tree and commit:

  17defc282fe6 ("Documentation: add meta-documentation for Sphinx and kernel-doc")

from the jc_docs tree.

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
index dacc77b43c29,f92854f01773..000000000000
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@@ -13,8 -13,8 +13,10 @@@ Contents
  .. toctree::
     :maxdepth: 2
  
+    kernel-documentation
+ 
 +   gpu/index
 +
  Indices and tables
  ==================
  
