From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Tue, 13 Mar 2018 12:15:28 +1100
Message-ID: <20180313121528.36120e37@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1717111929=="
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
Cc: Eric Huang <JinHuiEric.Huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Rex Zhu <Rex.Zhu@amd.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--===============1717111929==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/wrPZgJZxY4WI2A2sGLGYPP+"; protocol="application/pgp-signature"

--Sig_/wrPZgJZxY4WI2A2sGLGYPP+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c

between commit:

  a0aaa03062be ("drm/amd/powerplay: fix power over limit on Fiji")

from the Linus' and commit:

  a5278e511dce ("drm/amd/pp: Revert gfx/compute profile switch sysfs")

from the drm tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/wrPZgJZxY4WI2A2sGLGYPP+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqnJjAACgkQAVBC80lX
0GzVYgf+PdWjze0sLpZoFAOIfJSZRRiYeI2e7jk+LnQErOnbJV89MK/8yGm+7Cr4
lx3KHXqsuSRVJUdFTUokAA5/bhOzWafs8D+3owWQfZ8AiI+MxaRbDqrDhoFfj3tb
dmMjmyEDu9oI670vKvmTdDzAEL5/eqqA2M/Uh948fE3Wy70B1gjTqS9A1xih0WAK
drfcblR94dm0RjqOPmCYtmGHzGLpxB99D/13mMiOdZfKCdjXe97BY3Ez5WZV1EfH
C7Qd3xhcaHkIBnHYHVCJs3WZw3A13ph9O6RNsvg5zlRhjrTuY1Deh88fFXNPQcbB
GJ5KHRGN542tf8q33G3JTTPKNG4QLQ==
=rwMR
-----END PGP SIGNATURE-----

--Sig_/wrPZgJZxY4WI2A2sGLGYPP+--

--===============1717111929==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1717111929==--
