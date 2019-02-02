From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the origin tree
Date: Sun, 3 Feb 2019 08:33:10 +1100
Message-ID: <20190203083310.12b97619@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.zZ9TSU4MuKdwxg66cFvAFz"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Schwab <schwab@suse.de>, Palmer Dabbelt <palmer@sifive.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

--Sig_/.zZ9TSU4MuKdwxg66cFvAFz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

[Just a reminder for the future.]

Hi all,

In commit

  2bb10639f12c ("RISC-V: fix bad use of of_node_put")

Fixes tag

  Fixes: 94f9bf118f ("RISC-V: Fix of_node_* refcount")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/.zZ9TSU4MuKdwxg66cFvAFz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxWDJYACgkQAVBC80lX
0GxoPgf9HfjG1zGR/52aXHCLUzJ+uvffNhoPqDDkxVtcjZjO6TvUj416ooVWXHNg
3ZIY+NZ3sUFKq6RNVw0UjpSvQ/pXOVYT+U1OtwmQ2u67rZhb66VQmVTfYTIbKS53
Z6PXrAX6KC6N1c9MK39a2UUjYx2CgEIrRQKVpgcWXKnoK8vu6l8KIb1c9KzKAWYs
sybuBmsyjW/2Bfy4Ko7amVrpIC8m0GaLfDtFrDuhe+sbbY1sI7iHrYoeQDYEGcSo
VzypM6mTnipvu56EWTTa1l7pTs+w7JJa/gIQ9Ixrg1XUQVGumLBkpDDvKVFyomUd
qN79cJHZun6E5iNiz5C4w1tX5mDylQ==
=vNha
-----END PGP SIGNATURE-----

--Sig_/.zZ9TSU4MuKdwxg66cFvAFz--
