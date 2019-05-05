From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the net tree
Date: Mon, 6 May 2019 07:23:34 +1000
Message-ID: <20190506072334.5eeb8858@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/iIoaWuLbT45b0W=22c.g9UB"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Ahern <dsahern@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/iIoaWuLbT45b0W=22c.g9UB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  64c6f4bbca74 ("neighbor: Reset gc_entries counter if new entry is release=
d before insert")

Fixes tag

  Fixes: 58956317c8d ("neighbor: Improve garbage collection")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/iIoaWuLbT45b0W=22c.g9UB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzPVFYACgkQAVBC80lX
0GzgSQf/c6OvVDblN1/YNpJhV/j2sx2hjoI5gDJX3J2y1AR+2+BPmP/SDRL3ZJmM
8ukm5AsBNqrIeYWlM9sSzjOoQd8DSvyviJcvXJRdGU8aHothh+5LYNcgYGY4/D9J
JU0czzAObzpo7I5+/Wlse7k1qwqWHTLJLc7QbUbMihagc++flkjUP1XO+eOeT7qo
QSHTveRrhX+E0nF6WLanSEVsMeofWf+ANI44cy9GyI68/ElhTT4Pk6G0rgEPtnp3
E2Ct31QNroLOdwVHevUmYTBEW0zP0bRjCALxIi4MJvSlp8FmEgO6QEAhmzImDtW0
706zq/XALUR8RVfwZJq7AFf5HU9ofg==
=QLd4
-----END PGP SIGNATURE-----

--Sig_/iIoaWuLbT45b0W=22c.g9UB--
