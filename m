From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sound-asoc tree with the drm tree
Date: Wed, 1 Nov 2017 15:04:15 +1100
Message-ID: <20171101150415.159558ae@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41477 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750716AbdKAEER (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 1 Nov 2017 00:04:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Akshu Agrawal <akshu.agrawal@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, DRI <dri-devel@lists.freedesktop.org>

Hi all,

Today's linux-next merge of the sound-asoc tree got a conflict in:

  drivers/gpu/drm/amd/include/amd_shared.h

between commit:

  cfa289fd4986 ("drm/amdgpu: rename amdgpu_dpm_funcs to amd_pm_funcs")

from the drm tree and commit:

  f674bd281460 ("drm/amdgpu Moving amdgpu asic types to a separate file")

from the sound-asoc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/include/amd_shared.h
index de6fc2731b98,3a49fbd8baf8..000000000000
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@@ -23,36 -23,9 +23,11 @@@
  #ifndef __AMD_SHARED_H__
  #define __AMD_SHARED_H__
  
- #define AMD_MAX_USEC_TIMEOUT		200000  /* 200 ms */
+ #include <drm/amd_asic_type.h>
  
 +struct seq_file;
 +
- /*
-  * Supported ASIC types
-  */
- enum amd_asic_type {
- 	CHIP_TAHITI = 0,
- 	CHIP_PITCAIRN,
- 	CHIP_VERDE,
- 	CHIP_OLAND,
- 	CHIP_HAINAN,
- 	CHIP_BONAIRE,
- 	CHIP_KAVERI,
- 	CHIP_KABINI,
- 	CHIP_HAWAII,
- 	CHIP_MULLINS,
- 	CHIP_TOPAZ,
- 	CHIP_TONGA,
- 	CHIP_FIJI,
- 	CHIP_CARRIZO,
- 	CHIP_STONEY,
- 	CHIP_POLARIS10,
- 	CHIP_POLARIS11,
- 	CHIP_POLARIS12,
- 	CHIP_VEGA10,
- 	CHIP_RAVEN,
- 	CHIP_LAST,
- };
+ #define AMD_MAX_USEC_TIMEOUT		200000  /* 200 ms */
  
  /*
   * Chip flags
