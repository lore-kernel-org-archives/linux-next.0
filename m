From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-msm tree with the drm tree
Date: Mon, 23 Jul 2018 12:40:45 +1000
Message-ID: <20180723124045.4346df97@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/HZpJu.gVwwxp2NbzE+ak6U+"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>, Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Chandan Uddaraju <chandanu@codeaurora.org>, Sean Paul <seanpaul@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/HZpJu.gVwwxp2NbzE+ak6U+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Today's linux-next merge of the drm-msm tree got a conflict in:

  drivers/gpu/drm/msm/dsi/dsi_manager.c

between commit:

  97e14fbeb53f ("drm: drop _mode_ from remaining connector functions")

from the drm tree and commit:

  b6a221993e7c ("drm/msm/dsi: Use one connector for dual DSI mode")

from the drm-msm tree.

I fixed it up (the latter removed code modified by the former) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/HZpJu.gVwwxp2NbzE+ak6U+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltVQC0ACgkQAVBC80lX
0GysoAf/V7o/x8dLL3R6jz/dW1bqr8cF64YWI/S+GCSNxCkANNsYv1YHq9VElXWN
0OyugJBRtQBM3Fr6UFtCetZOqVaxhetd90YJE8wrIK9ydOW4mJyN9SaetGCNeM9u
6rLbZsDJ8jeH+9J2XSyOknTNcUcFOAN75KQc1AGdJfiJ3/JkIomn4ZumIhN5J6VL
5k+3NgeIVeX3BgCuF8lPOnYeu8/XV3SYD0M0RoGBHdj2Y/da4OUYIMdZkz36pL2V
Wh4d6hziMhTTi+keDyizDvEaB5OKGzEFx8LJU3jvH/4LBuUXdeqmf4LGKKVo+etT
J8lkCj1OQu6pR4/3NhzcbsQrkErj8A==
=c25I
-----END PGP SIGNATURE-----

--Sig_/HZpJu.gVwwxp2NbzE+ak6U+--
