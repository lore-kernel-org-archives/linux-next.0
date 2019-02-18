From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the s390 tree
Date: Tue, 19 Feb 2019 07:38:47 +1100
Message-ID: <20190219073847.6f288b66@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/B9/EvsB9I=piEZuCoRd.Qe="; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/B9/EvsB9I=piEZuCoRd.Qe=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b99740ef221f ("s390/setup: fix boot crash for machine without EDAT-1")

Fixes tag

  Fixes: 94f85ed3e2 ("s390/setup: fix early warning messages")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/B9/EvsB9I=piEZuCoRd.Qe=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxrF9cACgkQAVBC80lX
0Gy+UAf/Ze5thMdyBppz5qmN/BIEI0bSQ+hSYJ1MUnb3c7eVlFu5fn/6oJTyWNpc
kqk2+Gr9X86R5JM6JhTUv9hXzqNXc4ONyeB2HQLbkncQimeXh4gcVkvNS0VFEsuT
+ty74o0w123QTYcqIyI99ZOMpDtV+MBsHLQ1XZYom20sEztv+5Jm/r6HvtFYexEL
Rp0drPnRb0XYNPnjMx5elmkCFFxTNxpt0B36sDhsqgNiM5VuRxGD+rvbiiJrW9g+
EMjCOeXY4QdKK8ENobPx+MlxAnM0hU7x65iGb/ze0LISArMAiqmXEUUqbfdnhlaq
9usrqJ61WQzfwxpb88+VvVrADLwt1g==
=Llpo
-----END PGP SIGNATURE-----

--Sig_/B9/EvsB9I=piEZuCoRd.Qe=--
