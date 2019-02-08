From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drm-misc tree
Date: Fri, 8 Feb 2019 12:32:04 +1100
Message-ID: <20190208123204.1be5d047@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/hXVPOnLm3.eMKytNTgqaPIQ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>
List-Id: linux-next.vger.kernel.org

--Sig_/hXVPOnLm3.eMKytNTgqaPIQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c: In function 'sun6i_dsi_probe':
drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:1053:9: warning: 'ret' may be used u=
ninitialized in this function [-Wmaybe-uninitialized]
  return ret;
         ^~~

Introduced by commit

  bb3b6fcb6849 ("sun6i: dsi: Convert to generic phy handling")

--=20
Cheers,
Stephen Rothwell

--Sig_/hXVPOnLm3.eMKytNTgqaPIQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxc3BQACgkQAVBC80lX
0GwplAf/ReukGG+lHsXsAfgLXJ1Tbr2ZvFi4psfJBOdXlxky/gFqxdbw5ZboxkCe
AtqPeDluqW3Zc/XTqFWMDNiAkEkXcKd5T4Cc041cPAy/6lDp6hDd44L6hdoMknV8
UHZ8eZreuS33+YZq2kbMZGYpUPQfIfBqtgtQM8U6tqm0+wKmqdyDGzDaZhylzx5a
TLfLncTaJGIjUFe9QIpJiWMRfViC/FDddXgWIELwgp9U27i4X6PlzLXdrpq8guTr
hI+yf0F+09AhpCxbtQVMQyvQIcc0OdtP3FcLBba8R/VUx9I2ZLMXPPQ0pKB6/ibk
TzPyjg8AWV7c7uxIE9Pq87w8QtPLqg==
=N4M2
-----END PGP SIGNATURE-----

--Sig_/hXVPOnLm3.eMKytNTgqaPIQ--
