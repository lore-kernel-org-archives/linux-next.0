From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the gfs2 tree
Date: Thu, 5 Jul 2018 07:55:44 +1000
Message-ID: <20180705075544.70f2eacf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/yct1U=Wvbk+RW6YAmS.lLq1"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Whitehouse <swhiteho@redhat.com>, Bob Peterson <rpeterso@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/yct1U=Wvbk+RW6YAmS.lLq1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  0627518adcc8 ("GFS2: rgrp free blocks used incorrectly")
  b30cbec54def ("gfs2: Don't reject a supposedly full bitmap if we have blo=
cks reserved")

are missing a Signed-off-by from their committer.

Not updated in the rebase.

--=20
Cheers,
Stephen Rothwell

--Sig_/yct1U=Wvbk+RW6YAmS.lLq1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAls9QmAACgkQAVBC80lX
0Gw3PQf9Gr5mS5Lq1UUvALhz9Z5YKJc8dH5MC120a4BKyIZsq0yWNC5Zt2i5hvml
zA3y+8MH5wbUfYeHJKrgdkQvKEQDpeamfF2rH5VVRZ43j5TvUYxOsaYxVoTVldaD
LLev/ZQnjLKgIZ5JEwd2V6VIIy96VvhVa7IpM5tHpcrRG249Q24D4/fVfSthLjR3
DuMtCKjOykArpWU27ZeIEvwQpQwjBFnonYilkCjZ45rft4jGBPhLsOIXFbigHakm
daZ913YBFpv7AZ6xJrVCrxvl1t5jT5Cla5oM0WRmYpAsDXa+u51SJsyV7cwmo/0a
RevErlFD89st4ua/D64CtaEXrDgDdA==
=Uoi7
-----END PGP SIGNATURE-----

--Sig_/yct1U=Wvbk+RW6YAmS.lLq1--
