From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Date: Thu, 31 Mar 2016 11:15:21 +1100
Message-ID: <20160331111521.4d8b20b4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53052 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750943AbcCaAPY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Mar 2016 20:15:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c

between commit:

  257bf15a4b97 ("drm/amdgpu: add slap cache for sync objects as well")

from Linus' tree and commit:

  44debe7a123c ("vgacon: dummy implementation for vgacon_text_force")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index f1e17d60055a,fba20bd59cfa..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@@ -555,8 -539,6 +555,7 @@@ static struct pci_driver amdgpu_kms_pci
  
  static int __init amdgpu_init(void)
  {
 +	amdgpu_sync_init();
- #ifdef CONFIG_VGA_CONSOLE
  	if (vgacon_text_force()) {
  		DRM_ERROR("VGACON disables amdgpu kernel modesetting.\n");
  		return -EINVAL;
