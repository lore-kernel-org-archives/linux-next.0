From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Sun, 21 Jun 2015 13:50:51 +1000
Message-ID: <20150621135051.27364542@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/CF4f4x9OU6EdIrXhAccncU."; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33702 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752060AbbFUDu6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 20 Jun 2015 23:50:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marek =?UTF-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>, Michel =?UTF-8?B?RMOkbnpl?= =?UTF-8?B?cg==?= <michel.daenzer@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>

--Sig_/CF4f4x9OU6EdIrXhAccncU.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the drm tree got conflicts in:

  drivers/gpu/drm/radeon/radeon_kms.c
  include/uapi/drm/radeon_drm.h

between commit:

  3bc980bf19bb ("drm/radeon: Add RADEON_INFO_VA_UNMAP_WORKING query")

from Linus' tree and commit:

  72b9076b2887 ("drm/radeon: add a GPU reset counter queryable by userspace=
")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/radeon/radeon_kms.c
index b0acf50d9558,9632e886ddc3..000000000000
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@@ -576,8 -576,8 +576,10 @@@ static int radeon_info_ioctl(struct drm
  		if (radeon_get_allowed_info_register(rdev, *value, value))
  			return -EINVAL;
  		break;
 +	case RADEON_INFO_VA_UNMAP_WORKING:
 +		*value =3D true;
+ 	case RADEON_INFO_GPU_RESET_COUNTER:
+ 		*value =3D atomic_read(&rdev->gpu_reset_counter);
  		break;
  	default:
  		DRM_DEBUG_KMS("Invalid request %d\n", info->request);
diff --cc include/uapi/drm/radeon_drm.h
index 94d44ab2fda1,573cb86a3d6e..000000000000
--- a/include/uapi/drm/radeon_drm.h
+++ b/include/uapi/drm/radeon_drm.h
@@@ -1038,7 -1038,7 +1038,8 @@@ struct drm_radeon_cs=20
  #define RADEON_INFO_CURRENT_GPU_SCLK	0x22
  #define RADEON_INFO_CURRENT_GPU_MCLK	0x23
  #define RADEON_INFO_READ_REG		0x24
 -#define RADEON_INFO_GPU_RESET_COUNTER	0x25
 +#define RADEON_INFO_VA_UNMAP_WORKING	0x25
++#define RADEON_INFO_GPU_RESET_COUNTER	0x26
 =20
  struct drm_radeon_info {
  	uint32_t		request;

--Sig_/CF4f4x9OU6EdIrXhAccncU.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVhjSfAAoJEMDTa8Ir7ZwVdzQP/AxK3KpVN9UbqhKI7rJpYR3E
HC4L8XxTzGVww1ZJ3iZTdqB+D5wXiQbqrFiQ9ErnaOX3jCqn/NTDI1nJ/cL3tX+U
Tidnyjk8QHwKZFdNVrEWL+W59tO41Tm1lSyl3uor73i+u7fdM+GNq2OHbCRz6Ad0
USRvE1aY4we7BzDMdA/K/upJVea9gFJHgEZdaJRQSH2/jCslNcy521qQjiAWAFKr
HhLclnkySjNjb9F7qxysN0U5dSHdhGBWUO/MgzMyEQLP+EN2sia8iv0Wfgl++nb6
gZM+NzpPat3ZaSprwMTOm+3uaYpLcXx/gQsYY0jF44j4YfqV59dZ1bchtvNfFiv6
+LKERIB7MOG2M3Tpxo6QXEBaIpidc25x48Bi7l+rhTnWwAfk/rPRt72MznwZm0dG
c+61wG/aovPJUpFJY/9Fvbt+qITVx46/xfJyWpAxOb4BUNF1MhaGssBjUGf4dxna
gwCrOPCaFoJP5Ssw5TgvGD/oq66QFl/N4A+eFQ9AlOn78atj28DtVqG14lkwhoiH
nBPSSJlpBBzRAS2JzEWV0bkshIG+Um+o09H9yw6uJVXbZmuFYuTS747eG44tCovF
4iDyakxRYbL0hIwVJm7C58Zpze7/2OutpAKuTmqH68QCR5L14GDMZ00vK62Yvtwp
O2DRD6zlJWPmDqA2SKDP
=pAYT
-----END PGP SIGNATURE-----

--Sig_/CF4f4x9OU6EdIrXhAccncU.--
