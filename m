From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-tegra tree with the drm tree
Date: Fri, 16 Jun 2017 11:12:02 +1000
Message-ID: <20170616111202.7b9076aa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34545 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751578AbdFPBMF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Jun 2017 21:12:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tom Cooksey <tom.cooksey@arm.com>, Eric Anholt <eric@anholt.net>

Hi Thierry,

Today's linux-next merge of the drm-tegra tree got a conflict in:

  Documentation/gpu/index.rst

between commit:

  bed41005e617 ("drm/pl111: Initial drm/kms driver for pl111")

from the drm tree and commit:

  fa6d095eb23a ("drm/tegra: Add driver documentation")

from the drm-tegra tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc Documentation/gpu/index.rst
index 037a39ac1807,feae37fa7ca3..000000000000
--- a/Documentation/gpu/index.rst
+++ b/Documentation/gpu/index.rst
@@@ -12,7 -12,7 +12,8 @@@ Linux GPU Driver Developer's Guid
     drm-uapi
     i915
     meson
 +   pl111
+    tegra
     tinydrm
     vc4
     vga-switcheroo
