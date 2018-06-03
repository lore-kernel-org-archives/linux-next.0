From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the drm-msm tree
Date: Mon, 4 Jun 2018 07:44:39 +1000
Message-ID: <20180604074431.399aabf2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9odY32j6grxYv2/V0NdlAq6"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/9odY32j6grxYv2/V0NdlAq6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Commit

  0c999b56810a ("drm/msm: Refactor complete_commit() to look more the helpe=
rs")
  240ca9286fcb ("drm/msm: Move implicit sync handling to prepare_fb")
  a744a6a9e98b ("drm/msm: Issue queued events when disabling crtc")
  efaa2af8b741 ("drm/msm: Remove msm_commit/worker, use atomic helper commi=
t")
  917d7e3c75ec ("drm/msm: Switch to atomic_helper_commit()")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/9odY32j6grxYv2/V0NdlAq6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsUYUcACgkQAVBC80lX
0GyQ+Af+PSmMZ5Kl2ejgfwtY4M/dB4K4VWwZInmuOANwsI4BfoqINMKE85CC73uT
yTN778H/QcwX/TBzRrWFuurYnyWRYP0HjvK/khUKmFKFmrTOq+gNv61lqLGZzCYl
qteVjnypfZCDzzNHvxr+EYhAYWfnL2DFwhtBKNOhT/nd7sNu7Y1szYYXnXSUGRSp
Vwz6YL3ijv8pp+NXo960xHwlV0M+TxbD537rm/ARb6k9NA3l6kdJI9jZCsv8GX5b
78LJJiNMovuYzjTsYHNlhxk2ncztVfE/6nvnUKDSC5fKU5Rx6xagW/f4Ed3x3k0l
I0AxbkmifqYXKykK3cwVj4p/U0NDCw==
=2sxd
-----END PGP SIGNATURE-----

--Sig_/9odY32j6grxYv2/V0NdlAq6--
