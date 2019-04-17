From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the drm-fixes tree
Date: Thu, 18 Apr 2019 07:46:58 +1000
Message-ID: <20190418074658.541fcfd7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XLXTcL=ylQN8SHPoU=W3Ai+"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
List-Id: linux-next.vger.kernel.org

--Sig_/XLXTcL=ylQN8SHPoU=W3Ai+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  453393369dc9 ("drm/ttm: fix incrementing the page pointer for huge pages")

Fixes tag

  Fixes: e16858a7e6e7 drm/ttm: fix start page for huge page check in ttm_pu=
t_pages()

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: ac1e516d5a4c ("drm/ttm: fix start page for huge page check in ttm_pu=
t_pages()")

--=20
Cheers,
Stephen Rothwell

--Sig_/XLXTcL=ylQN8SHPoU=W3Ai+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly3ntIACgkQAVBC80lX
0GwJFgf+L1fNt2DVdQGwvFYD1E2YdRwApLXSPHx5y4mAeuf96WDsDcwTEnSBucBe
DLMF2YxsjfLBp/P/y6ZVm8mx7MdzGlUTapfrsh92tK5WjQsl1R6EiTGDN+2Wc3Fw
Ykv42awjZmUPB8jZoAeAW5BLpdU+0nv0z0ru4r4yYlQboU5Hc6R3EAVTRpiGFcfO
h/8TmuALnW0M3qBFjXfHeHMJLW9e6+4Yyc+kllo7/0mdXYkLDAPc1RZyjRArQd1y
z0QfhifzC16rcFCugT1olN4B2QMBMECwSLfoa0T7Xey/ktyINbzA7Afu1u90UwQ8
jqw82NLoVGUmSCLjazQJccDsdVwF7w==
=ETlg
-----END PGP SIGNATURE-----

--Sig_/XLXTcL=ylQN8SHPoU=W3Ai+--
