From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the block tree
Date: Fri, 22 Feb 2019 07:39:59 +1100
Message-ID: <20190222073959.5accc9a9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/d2IDwTjbDbdXOzL0VNZTwgb"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ming Lei <ming.lei@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/d2IDwTjbDbdXOzL0VNZTwgb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

In commit

  8f4e80da764e ("block: bounce: make sure that bvec table is updated")

Fixes tag

  Fixes: 6dc4f100c ("block: allow bio_for_each_segment_all() to iterate ove=
r multi-page bvec")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/d2IDwTjbDbdXOzL0VNZTwgb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxvDKAACgkQAVBC80lX
0GwEdgf+NQ9BrCjeYBU4miFrZTJgDOuQCie968O6KG+9/5yEZYexZBMXA6LUC+fo
YQACAW44XgiDIuiWYDVmI0LZGsgaKeuUsxGThub0s+dn5pYiiy50EG2JMK82+jte
0vDZSvALvVTQdznhEu9YatEKySwYOCOeNSSPxqVRIJIKgcRWd+MmXPxrbiYRstK6
jzZxJyMZgekHBXi7n9mLTVZ8WiUeWVM19qhQx6Pv+9GX5FiIvXXB4pAyqFWApvP3
37YUY0QWHZGTbPdf38fAhF+DGbmBqTlRK6ivP3JLy0jHXZvd+wnNzGbi4eWJ/+hC
W5Ml5kHQUQdqQxVH5nYogpTv8pFQbw==
=xxJa
-----END PGP SIGNATURE-----

--Sig_/d2IDwTjbDbdXOzL0VNZTwgb--
