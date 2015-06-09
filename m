From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm tree
Date: Tue, 9 Jun 2015 23:42:30 +1000
Message-ID: <20150609234230.216ac85c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/cROE5mr8oGTPFrN/_RyA56Y"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51590 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751372AbbFINmn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2015 09:42:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>

--Sig_/cROE5mr8oGTPFrN/_RyA56Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

After merging the drm tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c: In function 'gfx_v7_0_cp_gfx_resume':
drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2879:9: error: 'BUF_SWAP_32BIT' undec=
lared (first use in this function)
  tmp |=3D BUF_SWAP_32BIT;
         ^
drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2879:9: note: each undeclared identif=
ier is reported only once for each function it appears in
drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c: In function 'gfx_v7_0_cp_compute_res=
ume':
drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3398:41: error: 'BUF_SWAP_32BIT' unde=
clared (first use in this function)
   mqd->queue_state.cp_hqd_pq_control |=3D BUF_SWAP_32BIT;
                                         ^
drivers/gpu/drm/amd/amdgpu/cik_sdma.c: In function 'cik_sdma_gfx_resume':
drivers/gpu/drm/amd/amdgpu/cik_sdma.c:413:14: error: 'SDMA_RB_SWAP_ENABLE' =
undeclared (first use in this function)
   rb_cntl |=3D SDMA_RB_SWAP_ENABLE | SDMA_RPTR_WRITEBACK_SWAP_ENABLE;
              ^
drivers/gpu/drm/amd/amdgpu/cik_sdma.c:413:14: note: each undeclared identif=
ier is reported only once for each function it appears in
drivers/gpu/drm/amd/amdgpu/cik_sdma.c:413:36: error: 'SDMA_RPTR_WRITEBACK_S=
WAP_ENABLE' undeclared (first use in this function)
   rb_cntl |=3D SDMA_RB_SWAP_ENABLE | SDMA_RPTR_WRITEBACK_SWAP_ENABLE;
                                    ^

Caused by commit a2e73f56fa62 ("drm/amdgpu: Add support for CIK parts").

I added the following patch to disable this code for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 9 Jun 2015 23:38:30 +1000
Subject: [PATCH] drm/amdgpu: disable CIK parts for now

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/amd/amdgpu/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgp=
u/Kconfig
index b30fcfa4b1f2..8da6bf7f39c8 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -1,6 +1,7 @@
 config DRM_AMDGPU_CIK
 	bool "Enable amdgpu support for CIK parts"
 	depends on DRM_AMDGPU
+	depends on BROKEN
 	help
 	  Choose this option if you want to enable experimental support
 	  for CIK asics.
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/cROE5mr8oGTPFrN/_RyA56Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVdu1QAAoJEMDTa8Ir7ZwVPxUP/0zXg7w47OXzWPMHCF1nhH9I
jK1jjcG83sK2R1CN8UAXl8a9Sfzn5ncXOauyd9i14DPB+0bycFdSVRht/m133/oB
ouZ/W6rKHMqghei4E9WOUvAxg1Mk+AKpnQrtgmL4o/2tdP0JU+FCnpqpZhIza5Oz
C/Oj+oHxWjo+0XwxDFy/oplH6IwzoICaH/IcU3WB2kv3b6PoM2K2MS2OEMVitW3C
z3y4aoXq4DsEFYRV6o09uNlzA3X1rs1YVOWTmDmRiq1NhDT7paeV/x+W810nXlED
xWgt93OHzUcHAXmnVQXZh/Sz2MzlrS3OG8Yfgxqjd4qlmvzUEQxzDmh+gP+UTvio
Huxpx3aCdn6CiVovJeEcJbvtibq0IVf2P5dVZ9zuAwoVZJPmLCq3PK4REwFdCB68
kFg0bHwl2ZNNzpSAd7H8vbEYHIQLQZ8guH/XM88nn//HBgtmTm7DHxDeAnOrWnFd
rqmw4bVYHwtpqfiPqdeW/Lj+8M9Op96SRZHzc2l8TZrn6TNxaMIjdpMq/xEz2J4X
bepHK4kJdaVnZ8enAs9lYzi9/AMvvNqG2JkktcsDJyMuDle27Hy8qjNU0AAeVxZV
KCWJ8+qqc37XU2BmQX+Lf8/CJkfq5nvMpwHViBTeOGgIcV7nUhupHFog3W6ZV7qZ
RG000lahic3VpBQ7dgxq
=xSP8
-----END PGP SIGNATURE-----

--Sig_/cROE5mr8oGTPFrN/_RyA56Y--
