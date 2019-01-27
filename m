From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the
 drm-misc-fixes tree
Date: Sun, 27 Jan 2019 14:41:26 +1100
Message-ID: <20190127144126.6fc70a71@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1239765417=="
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sandy Huang <hjc@rock-chips.com>
List-Id: linux-next.vger.kernel.org

--===============1239765417==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/LIHR_E5UmizOOwQOhRM_PYJ"; protocol="application/pgp-signature"

--Sig_/LIHR_E5UmizOOwQOhRM_PYJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  053ff09f1a8f ("drm/rockchip: rgb: update SPDX license identifier")

Fixes tag

  Fixes: 1f0f01515172 ("Add support for Rockchip Soc RGB output interface")

has these problem(s):

  - Subject does not match target commit subject

--=20
Cheers,
Stephen Rothwell

--Sig_/LIHR_E5UmizOOwQOhRM_PYJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxNKGYACgkQAVBC80lX
0GwKXgf+P86GlJDxFktJYVZh7npJM6LUTjeN3RFgxtNzbfwy6PShLVosKmDCVwbx
aAiJk/DtZJMStrX1ogilf585b1IYEuSDBP1Ht8uTMVNAvAA6Au/qpWJovV+KV65i
n0LUqT12P0Zq/L6m9SDV91hJSBr81kzK4++S3A7gHsVnlxqzU2LrOmy08N83OAqU
Bbr9wP+RQ5voO5rscSdoD7UZdR2nNcz9f2QzQkeSZO6mSzTI++aDFKzaWWYFvIXP
c0soD0xHPMtSdPNiZcKOxSriprRtZeskHOHXswUj1wVofkyN2xs7zEVWeA1ts8kP
7eHFOYnkmuuukUpfTf/Kd9eIcth5Gw==
=0YvE
-----END PGP SIGNATURE-----

--Sig_/LIHR_E5UmizOOwQOhRM_PYJ--

--===============1239765417==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============1239765417==--
