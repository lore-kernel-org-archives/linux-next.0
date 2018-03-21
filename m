From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the drm tree
Date: Wed, 21 Mar 2018 20:27:05 +1100
Message-ID: <20180321202705.708b8f1a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0996714211=="
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: linux-next.vger.kernel.org

--===============0996714211==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0PzI5IxV48yZTTKF_l+Pzu9"; protocol="application/pgp-signature"

--Sig_/0PzI5IxV48yZTTKF_l+Pzu9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

A series of commits

  a82f034765fa ("drm: omapdrm: Split init and cleanup from probe and remove=
 functions")
to
  663ac57b285d ("drm: omapdrm: venc: Allocate the venc private data structu=
re dynamically")

are missing a Signed-off-by from their commiter.

--=20
Cheers,
Stephen Rothwell

--Sig_/0PzI5IxV48yZTTKF_l+Pzu9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqyJWkACgkQAVBC80lX
0GwpDwf9ES4nSmHFMF00KBRiNt6EaPxwL63ejhWocNkFpLZWnBdwiGewROdV9RK9
G8Xpp+ZahWqyPLYoyvP83EzHmdKvXsn34PtyryMullyNAin/kC1dXcvebEc/TPUP
lCRFIg8TUHIuZ6VGBJpuD+miKgXN0LjqHRHEj9+4mIbq98yX53rip31/OrWakIaH
VEOmWgXZ0Rq2xLsA7fTv3fGNVA4C38SF+7UNFIPDjuyotdrebClkISZVfQ8lwxeD
zWay/tY3vdV28RwmUMkjAPO9j6bvDAL929Zf+Xe7Kt3R3klH/RQm35FjvEDqRXtU
j6AJGvONLpjEG7Z5HxvyPbJhe9dLQw==
=ReOe
-----END PGP SIGNATURE-----

--Sig_/0PzI5IxV48yZTTKF_l+Pzu9--

--===============0996714211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0996714211==--
