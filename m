From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-fixes tree
Date: Fri, 24 May 2019 08:29:26 +1000
Message-ID: <20190524082926.6e1a7d8f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3/vL9jhrSoegPrs8wupWN73"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Harry Wentland <harry.wentland@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
List-Id: linux-next.vger.kernel.org

--Sig_/3/vL9jhrSoegPrs8wupWN73
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-fixes tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'l=
oad_dmcu_fw':
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:667:7: error: i=
mplicit declaration of function 'ASICREV_IS_PICASSO'; did you mean 'ASICREV=
_IS_VEGA12_P'? [-Werror=3Dimplicit-function-declaration]
   if (ASICREV_IS_PICASSO(adev->external_rev_id))
       ^~~~~~~~~~~~~~~~~~
       ASICREV_IS_VEGA12_P

Caused by commit

  55143dc23ca4 ("drm/amd/display: Don't load DMCU for Raven 1")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/3/vL9jhrSoegPrs8wupWN73
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlznHsYACgkQAVBC80lX
0Gxiqgf/TX+jNEffQfpsZ0K5DEdyod6S5jH6C3F8/4luruSvyxWOVsJkfo3n7+eY
G3FgBMxNkwfk/gNzHujp7JwZ1cyONguMQhUd/MgTWdLtu8tj0sELLLxrLecDJtJA
ru1k5stROtvFEFJBt7ttqyQyqUQTCIH29WPrmnRDOlspkhVC9nnY1EaHhIjGJZkq
4Z1AmffQnv4BI0riIg+6EDgM8GlzkopAqn0JkSLXqXrlYyN7o9SyNoh/JsunmF02
+ySAqwq7WO3aAxGUAx24aO8MCJbFw6ZfwAZk+tF6h/28sV0Mkqs9p91uFmxFMqB/
d00p8y1eDXWFDmkJpd+l+HIXXMEP7w==
=XBe4
-----END PGP SIGNATURE-----

--Sig_/3/vL9jhrSoegPrs8wupWN73--
