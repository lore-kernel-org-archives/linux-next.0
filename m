From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm-current tree
Date: Fri, 29 Mar 2019 13:39:14 +1100
Message-ID: <20190329133914.45a4a255@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bz/5X2ivF34+g6UO7vy52Fz"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, George Spelvin <lkml@sdf.org>
List-Id: linux-next.vger.kernel.org

--Sig_/bz/5X2ivF34+g6UO7vy52Fz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

lib/list_sort.c:17:36: warning: 'pure' attribute ignored [-Wattributes]
   struct list_head const *, struct list_head const *);
                                    ^~~~~~~~~

Introduced by commit

  820c81be5237 ("lib/list_sort: simplify and remove MAX_LIST_LENGTH_BITS")

--=20
Cheers,
Stephen Rothwell

--Sig_/bz/5X2ivF34+g6UO7vy52Fz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlydhVIACgkQAVBC80lX
0Gwfcwf/a08aToYMZc7G6FsZ5WGZIELQG6jO+w/bgXuIo+Oq68NVJm1mCrH0oiM9
pTlM/1BXDvLqyRsIBkDCeTjC02oZrPBMB7MrzYQKzRFkgpRTZWkKDG3qz5S8SgHQ
Q4/A577fqDglq+zdnKfMz05CpioFd8r4vsA1UpfcqNZljirmWa9MZOA7FYhPYV64
q5y1yk71YtERywotcCRQw/RYQ9DkVq0Mkgk9fgxQsLkIyVKdJxqVFVvjyW1eZZ3k
PVv9chwoluBaMwLuxlaA9hkBwqCecLeZMMayZ8Nu/UwRsQhviGy1FKK+tn4KU1Vx
AIt8EqYqDHW7iT90MnvGH7OqSo4cyQ==
=6CYq
-----END PGP SIGNATURE-----

--Sig_/bz/5X2ivF34+g6UO7vy52Fz--
