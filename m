From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the
 drm tree
Date: Fri, 23 Nov 2018 11:13:09 +1100
Message-ID: <20181123111309.74882d70@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1780231875=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>
Cc: Alex Deucher <alexander.deucher@amd.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
List-Id: linux-next.vger.kernel.org

--===============1780231875==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/sPCzz=0NRvj.EWUcJp_LpA7"; protocol="application/pgp-signature"

--Sig_/sPCzz=0NRvj.EWUcJp_LpA7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/Makefile

between commit:

  2bb42410b1bd ("drm: Remove drm_global.{c,h} v2")

from the drm tree and commit:

  c6fdea6e1a19 ("drm: Merge drm_info.c into drm_debugfs.c")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/Makefile
index 7f3be3506057,7c88f12096c5..000000000000
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@@ -10,8 -10,8 +10,8 @@@ drm-y       :=3D	drm_auth.o drm_bufs.o dr
  		drm_scatter.o drm_pci.o \
  		drm_sysfs.o drm_hashtab.o drm_mm.o \
  		drm_crtc.o drm_fourcc.o drm_modes.o drm_edid.o \
- 		drm_info.o drm_encoder_slave.o \
+ 		drm_encoder_slave.o \
 -		drm_trace_points.o drm_global.o drm_prime.o \
 +		drm_trace_points.o drm_prime.o \
  		drm_rect.o drm_vma_manager.o drm_flip_work.o \
  		drm_modeset_lock.o drm_atomic.o drm_bridge.o \
  		drm_framebuffer.o drm_connector.o drm_blend.o \

--Sig_/sPCzz=0NRvj.EWUcJp_LpA7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlv3RhUACgkQAVBC80lX
0Gys+QgAk7eSH5O298kafMwyh6zFaQS68csl/LnHa23k9yeMhRe3FNZaJmKbF1wv
4ofzRc4fQZOIlIpfDmMagwvSzcBb1t1HbfVrsw0UYLzZqua6bn82xLSHA4KSWY3y
15Uvtxn3e4oUm1Edc0DBBhtyTlofI9XiriZUcvM5a2uCL0lePcot/zkGaw+pV+Es
70LOoY/HuCXNpu56dxZQISkLHD6IGaKuckoOi3F2n5M0iNMizKsdky+Lbnk20K98
z1W72YMYFvGQbKwZ++YkaP1fDGnnfXFnoi8mqs9Q5RZerx8VupqyTz1xyVlnJlyZ
AFb7n6D4Y+0UMPFnAnpFIjX21Cwc1Q==
=qzfl
-----END PGP SIGNATURE-----

--Sig_/sPCzz=0NRvj.EWUcJp_LpA7--

--===============1780231875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============1780231875==--
