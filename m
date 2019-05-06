From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags need some work in the block tree
Date: Tue, 7 May 2019 06:43:41 +1000
Message-ID: <20190507064341.7bbbe26c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/inYG87=b/69BKOYy3wOn2zC"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Igor Konopko <igor.j.konopko@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/inYG87=b/69BKOYy3wOn2zC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  486b5aac85f6 ("lightnvm: pblk: fix lock order in pblk_rb_tear_down_check")

Fixes tag

  Fixes: a4bd217 ("lightnvm: physical block device (pblk) target")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

In commit

  4ca885241950 ("lightnvm: pblk: fix race during put line")

Fixes tag

  Fixes: a4bd217 ("lightnvm: physical block device (pblk) target")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/inYG87=b/69BKOYy3wOn2zC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzQnH0ACgkQAVBC80lX
0GzpQAgAo+XRRC6UT+Ne1Ll0wqxSd/6z4u4udN6kp/378IMCS1fpPlTGWI4opXFh
+A6n9Dtbwlo+y+qSurUqN+6gcAnWHttguuiP0AvXfqN/BkN0eB0Gr204n99QQBK2
jKI920utHfbelirY6XMEyGj5l1YOvFiOowMO1xKxovFqdgsf7tGuYqlgunggo2aV
u/q7s21DQm+3mgU+ZqXK+cvXtoiwJccfEO7aQ/05hDZr6exE7Igbiuw+t4TmOvV+
gsbc3pbmy/aFltdO57gbBrioW0o854DYzfaAjEp/daU6t1x4g012lzCc6vYAB9SF
XUlySFf+zRwmxjFA8FuSpbvDjRoLdA==
=g2D4
-----END PGP SIGNATURE-----

--Sig_/inYG87=b/69BKOYy3wOn2zC--
