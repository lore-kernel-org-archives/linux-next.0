From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the drm tree
Date: Fri, 20 Mar 2009 15:38:26 +1100
Message-ID: <20090320153826.e6f1d760.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39501 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751103AbZCTEic (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Mar 2009 00:38:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Thomas Hellstrom <thellstrom@vmware.com>, Richard Purdie <rpurdie@linux.intel.com>, Ben Gamari <bgamari@gmail.com>, Eric Anholt <eric@anholt.net>, Dave Airlie <airlied@linux.ie>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in
drivers/gpu/drm/Makefile between commit
955b12def42e83287c1bdb1411d99451753c1391 ("drm: Convert proc files to
seq_file and introduce debugfs") from the drm tree and commit
69a914df73e04807248f21b6738dab9cf9e3c094 ("drm: Add a tracker for global
objects") from the staging tree.

Just trivial overlapping additions.  I fixed it up (see below) and can
carry the fix as necessary.

However, I do need to wonder why changes to drivers/gpu are appearing in
the staging tree - I assumed that its updates would be restricted to the
drivers/staging directory (as much as possible).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/gpu/drm/Makefile
index 4ec5061,9186cfd..0000000
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@@ -11,7 -11,7 +11,7 @@@ drm-y       :=	drm_auth.o drm_bufs.o dr
  		drm_agpsupport.o drm_scatter.o ati_pcigart.o drm_pci.o \
  		drm_sysfs.o drm_hashtab.o drm_sman.o drm_mm.o \
  		drm_crtc.o drm_crtc_helper.o drm_modes.o drm_edid.o \
- 		drm_info.o drm_debugfs.o
 -		drm_global.o
++		drm_info.o drm_debugfs.o drm_global.o
  
  drm-$(CONFIG_COMPAT) += drm_ioc32.o
  
