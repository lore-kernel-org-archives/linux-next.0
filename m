From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags need some work in the drm tree
Date: Fri, 1 Feb 2019 10:57:36 +1100
Message-ID: <20190201105736.1428c9fc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0158520816=="
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
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Leo Li <sunpeng.li@amd.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Kent Russell <kent.russell@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Ken Chalmers <ken.chalmers@amd.com>
List-Id: linux-next.vger.kernel.org

--===============0158520816==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Q7A6sF2/x+N6AAYNC/JNS11"; protocol="application/pgp-signature"

--Sig_/Q7A6sF2/x+N6AAYNC/JNS11
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  a93587b31e34 ("drm/amd/display: Only get the connector state for VRR when=
 toggled")

Fixes tag

  Fixes: 3cc22f281318 ("drm/amdgpu: Set FreeSync state using drm VRR proper=
ties")

has these problem(s):

  - Target SHA1 does not exist

Maybe instead:

  FIxes: bb47de736661 ("drm/amdgpu: Set FreeSync state using drm VRR proper=
ties")

In commit

  32e61361b82e ("drm/amd/display: Fix 64-bit division for 32-bit builds")

Fixes tag

  Fixes: https://lists.freedesktop.org/archives/dri-devel/2018-December/201=
008.html

has these problem(s):

  - No SHA1 recognised

Maybe instead:

  Fixes: 80604e27bc9 ("drm/amd/display: Use 100 Hz precision for pipe pixel=
 clocks")

In commit

  c4312c27c826 ("drm/amdgpu: Cleanup 2 compiler warnings")

Fixes tag

  Fixes: e4ae0fc drm/amdgpu: implement gfx8 post_soft_reset

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

Fixes tag

  Fixes: 5e01c09 drm/amdgpu/gfx_v8_0: Reorder the gfx, kiq and kcq rings

has these problem(s):

  - Target SHA1 does not exist

Maybe instead:

  Fixes: c6064de4b734 ("drm/amdgpu/gfx_v8_0: Reorder the gfx, kiq and kcq r=
ings test sequence")

--=20
Cheers,
Stephen Rothwell

--Sig_/Q7A6sF2/x+N6AAYNC/JNS11
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxTi3AACgkQAVBC80lX
0GwzRwf8DBWijKBMDHpG/ElUnWlulbVi9qYhXRJxHKvmLEnHRNlPnjFC4qXS65ci
Fm7U27XnpTKYNN86dtGCELE6V1whHZaCGgyV6yZZUneD2JmmJYVv9AnGeEygkBzX
xuFS1l3C8DNrf290dWP9QPABCD1Vcpw5EXgqEjd1EgRs6v1tvu+s0yoR2BIvWDzf
nF38r46RSYZoc3pq0xorKJ6MX8onfi5lZBjMA2zntmswKPDcga31d6vjfwlEBp+G
U7rb1xsTHJKaanjp9AOyHm1dphpXR98LX1phRBRxshu9Z7ypuOGD9Xrs5bwOP/55
uGJYarSgcjICevRyBSX6CRnqIat0dg==
=xPLZ
-----END PGP SIGNATURE-----

--Sig_/Q7A6sF2/x+N6AAYNC/JNS11--

--===============0158520816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0158520816==--
