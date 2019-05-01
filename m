From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the wireless-drivers-next
 tree
Date: Thu, 2 May 2019 07:50:22 +1000
Message-ID: <20190502075022.7d0a9f69@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/pnpuXjq4S2scTonmj6=o__M"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kalle Valo <kvalo@codeaurora.org>, Wireless <linux-wireless@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kbuild test robot <lkp@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/pnpuXjq4S2scTonmj6=o__M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  9c7c756eb066 ("mt76: mt76x02: mt76x02_poll_tx() can be static")

Fixes tag

  Fixes: ec7d2d74760a ("mt76: mt76x02: use napi polling for tx cleanup")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: 2ac515a5d74f ("mt76: mt76x02: use napi polling for tx cleanup")

And BTW, we prefer real names on Signed-off-by tags ...
--=20
Cheers,
Stephen Rothwell

--Sig_/pnpuXjq4S2scTonmj6=o__M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzKFJ4ACgkQAVBC80lX
0GzsKgf9GnowrC+vNhy3Jh0EFLyI+uRZuNKBeVzZB5O9c/Gjv8YAQwjLPq/9eeqp
6ENGMLsRry09lpI2yaVjp4FrjAFzqQtI+MXw9nfwlQzF4++gx4qLEnUKGIWKw8jq
pm70SSE+mJtT51rVtmAuSDQcVKSikAzTJ7uXBB1m0VyFB3IwOtVa0kJLwGxkn2LJ
HwhwXg6TQH7MKeIef+IBQomNJDSgJrTdMgAb1wXPj45M3VeVDvMcX4ZWXMqqvMPy
atYlLou0HahPjrybAvs68zrlj+iBUufL+7A3w+PN3T8D5+Fhu7N7AWOP+ZrAPhqc
qoocrbAZdm2XSjhTCfyJEZSJhetWKA==
=dMg2
-----END PGP SIGNATURE-----

--Sig_/pnpuXjq4S2scTonmj6=o__M--
