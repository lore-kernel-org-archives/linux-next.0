From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Mon, 9 May 2016 11:27:26 +1000
Message-ID: <20160509112726.072ba66d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sonny Jiang <sonny.jiang@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Arindam Nath <arindam.nath@amd.com>
List-Id: linux-next.vger.kernel.org

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c

between commit:

  562e2689baeb ("amdgpu/uvd: add uvd fw version for amdgpu")

from Linus' tree and commit:

  c036554170fc ("drm/amdgpu: handle more than 10 UVD sessions (v2)")

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

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index 871018c634e0,db86012deb67..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@@ -158,11 -171,19 +171,22 @@@ int amdgpu_uvd_sw_init(struct amdgpu_de
  	DRM_INFO("Found UVD firmware Version: %hu.%hu Family ID: %hu\n",
  		version_major, version_minor, family_id);
  
 +	adev->uvd.fw_version = ((version_major << 24) | (version_minor << 16) |
 +				(family_id << 8));
 +
+ 	/*
+ 	 * Limit the number of UVD handles depending on microcode major
+ 	 * and minor versions. The firmware version which has 40 UVD
+ 	 * instances support is 1.80. So all subsequent versions should
+ 	 * also have the same support.
+ 	 */
+ 	if ((version_major > 0x01) ||
+ 	    ((version_major == 0x01) && (version_minor >= 0x50)))
+ 		adev->uvd.max_handles = AMDGPU_MAX_UVD_HANDLES;
+ 
  	bo_size = AMDGPU_GPU_PAGE_ALIGN(le32_to_cpu(hdr->ucode_size_bytes) + 8)
- 		 +  AMDGPU_UVD_STACK_SIZE + AMDGPU_UVD_HEAP_SIZE;
+ 		  +  AMDGPU_UVD_STACK_SIZE + AMDGPU_UVD_HEAP_SIZE
+ 		  +  AMDGPU_UVD_SESSION_SIZE * adev->uvd.max_handles;
  	r = amdgpu_bo_create(adev, bo_size, PAGE_SIZE, true,
  			     AMDGPU_GEM_DOMAIN_VRAM,
  			     AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED,
