From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the sound-asoc tree with the drm-misc tree
Date: Wed, 18 Oct 2017 10:57:33 +0100
Message-ID: <20171018095733.2ffvg6ty6kn2lfdf@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1990169326=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alex Deucher <alexander.deucher@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--===============1990169326==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ti6jtievouznrgp3"
Content-Disposition: inline


--ti6jtievouznrgp3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sound-asoc tree got a conflict in:

  drivers/gpu/drm/amd/include/amd_shared.h

between commit:

  cfa289fd4986c ("drm/amdgpu: rename amdgpu_dpm_funcs to amd_pm_funcs")

=66rom the drm-misc tree and commit:

  1e4448648333a ("drm/amdgpu Moving amdgpu asic types to a separate file")

=66rom the sound-asoc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/include/amd_shared.h
index de6fc2731b98,3a49fbd8baf8..000000000000
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@@ -23,37 -23,10 +23,39 @@@
  #ifndef __AMD_SHARED_H__
  #define __AMD_SHARED_H__
 =20
- #define AMD_MAX_USEC_TIMEOUT		200000  /* 200 ms */
+ #include <drm/amd_asic_type.h>
 =20
 +struct seq_file;
 +
 +/*
 + * Supported ASIC types
 + */
 +enum amd_asic_type {
 +	CHIP_TAHITI =3D 0,
 +	CHIP_PITCAIRN,
 +	CHIP_VERDE,
 +	CHIP_OLAND,
 +	CHIP_HAINAN,
 +	CHIP_BONAIRE,
 +	CHIP_KAVERI,
 +	CHIP_KABINI,
 +	CHIP_HAWAII,
 +	CHIP_MULLINS,
 +	CHIP_TOPAZ,
 +	CHIP_TONGA,
 +	CHIP_FIJI,
 +	CHIP_CARRIZO,
 +	CHIP_STONEY,
 +	CHIP_POLARIS10,
 +	CHIP_POLARIS11,
 +	CHIP_POLARIS12,
 +	CHIP_VEGA10,
 +	CHIP_RAVEN,
 +	CHIP_LAST,
 +};
 +
+ #define AMD_MAX_USEC_TIMEOUT		200000  /* 200 ms */
+=20
  /*
   * Chip flags
   */

--ti6jtievouznrgp3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnnJY0ACgkQJNaLcl1U
h9BI6gf8CGomxQmk2lt3RysjFUGHUVcWZSs1u6J5PJuVGcywmeqqyB1J2Fc59F8w
10phd940OEW9ziJKxmMgRwYbCRIkDaUISYAJFmEs0s7Kh4esKYFbaT+sx/JiNCx6
uLsG+LW6l8SBS+ot1CZvsUz8dEYpIFY2UZpezTW4zPyKTUuL1GH8YQl5AlnRx3x5
xE/W+3clgKd3iTOHEzI9eRXTDti7rEAaWx847Twi2Xpjc0Z+Jhwu9HDiS73FzkBi
v57+X/HDR1pYfmTL+etdDmRQUHnhN2IHWWQpybN2a17oJ/QIzUJXoWXhCwWjl2qu
fgoP3oSFJUoEL3Es9RlZLThvx5YAUQ==
=+KO1
-----END PGP SIGNATURE-----

--ti6jtievouznrgp3--

--===============1990169326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1990169326==--
