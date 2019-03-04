From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the drm tree
Date: Mon, 4 Mar 2019 19:09:53 +1100
Message-ID: <20190304190953.342ec64e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2G1qVqAboWVRSB1Qz.zxaT_"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mario Kleiner <mario.kleiner.de@gmail.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Alex Deucher <alexander.deucher@amd.com>
List-Id: linux-next.vger.kernel.org

--Sig_/2G1qVqAboWVRSB1Qz.zxaT_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  289aabbf7bc8 ("drm/amd/display: Use vrr friendly pageflip throttling in D=
C.")

Fixes tag

  Fixes: bb47de736661 ("drm/amdgpu: Set FreeSync state using drm VRR

has these problem(s):

  - Please don't split Fixes tags over more than one line

--=20
Cheers,
Stephen Rothwell

--Sig_/2G1qVqAboWVRSB1Qz.zxaT_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlx83VIACgkQAVBC80lX
0GyaFAf9FikT8e1m5N8PZiyZp4XFCG3A7aozEiNSJLy6x/709YwBRqePFEw9t+nL
tzsBm/bXMDhkVsIIIoc9QYeAeD5SEc4Q7QJaqhWvZoWxhtVwTtLd34dkqRuN8FAT
9is+RX9jh2hcidmQEckxH4U4PgE5/7dyH0/2UhRP6xD9B6FfQDiCUyxRvb0kX1pv
Hl4ppr7N2l7akbARR84aw2WsnQ/Xbz2AWwFGslA1RgU6BNw8OlkYQtzUdk6kzc6W
jt4yBur0WjME0uPteqvbev1003tqg8scb2VvTBlwrCv+jfHB1JHLcAozKHPZJ1X1
OFZyfBfoOzP/iOPQikc9ThaN1TtdMQ==
=nhdB
-----END PGP SIGNATURE-----

--Sig_/2G1qVqAboWVRSB1Qz.zxaT_--
