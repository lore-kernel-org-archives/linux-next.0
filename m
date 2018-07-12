From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drm-misc tree
Date: Thu, 12 Jul 2018 11:51:53 +1000
Message-ID: <20180712115153.25646b70@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/LxKTHVZGBc1PGzxHdTLhpoC"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
List-Id: linux-next.vger.kernel.org

--Sig_/LxKTHVZGBc1PGzxHdTLhpoC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/gpu/drm/sun4i/sun8i_tcon_top.c: In function 'sun8i_tcon_top_registe=
r_gate':
drivers/gpu/drm/sun4i/sun8i_tcon_top.c:102:10: warning: return makes pointe=
r from integer without a cast [-Wint-conversion]
   return index;
          ^~~~~

Introduced by commit

  af11942ee44e ("drm/sun4i: tcon-top: Cleanup clock handling")

--=20
Cheers,
Stephen Rothwell

--Sig_/LxKTHVZGBc1PGzxHdTLhpoC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltGtDkACgkQAVBC80lX
0GxIAAgAnkyoRzoaT98zVQquKPvy+kedJfs54phZyKtyiA6kGexY3nqNRGJmDUDQ
wC97FZ5UesAZP2P8mFdoX4krd7yfR3CIa0kjPHRhDEzLmihBepn7BQ5RHrSX2QMd
TlXZPToVcpF46B0BubcEMVSdlVf2JKZSxp7gR8i08OaND8KLYA/OMAKCTq7lMSdt
KurosoAAoOMcDo3osf4QWafqymhERWymlLsxRE2nmGHAaMSyHymceFlPHEYfaqHK
/sGhF2XfFkzXLUNJ4EOrW03BCuxE+gTBjz1CjUVlXm05fphHUlqNF1LOK9yjk/gF
Qb+9TlVMj84yEdqVAsXp9sOZeIKw4Q==
=3tx/
-----END PGP SIGNATURE-----

--Sig_/LxKTHVZGBc1PGzxHdTLhpoC--
