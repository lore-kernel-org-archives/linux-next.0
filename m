From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the apparmor tree
Date: Fri, 12 Apr 2019 07:32:01 +1000
Message-ID: <20190412073201.5b8ad548@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KV+JkmtVQqczK+HXrh_=yhh"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Johansen <john.johansen@canonical.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/KV+JkmtVQqczK+HXrh_=yhh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  270ad142eb0f ("apparmor: fix missing ZLIB defines")

Fixes tag

  Fixes: 876dd866c084 ("apparmor: Initial implementation of raw policy blob=
 co

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/KV+JkmtVQqczK+HXrh_=yhh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyvslEACgkQAVBC80lX
0GzWUQf+NBDLkS4TEXng1cnPegsE3iXTNOpfgSBojRCBZLJycNaULxilKtBqVoDP
6/s1tiwIP4Zcz60ZUE/0MggoifQ/Z097eMfxCbgZW/bMph4kzErjLz6F2VZcCHXa
3x0/FFqeZWMqU7uvpQ4zrA+PcAr/nsUH7oeTe1WOO2dJAhB29qg3JN375WN3gS89
4VCW4IqfB9FveROTR1tOJzPIaQT/QZGglaPkaqyk4d1pLFF/5RlhxWEEns1ZnKWH
6xULiRw6Wj3PlpEpVXhvpqJSlyQLwHrY2AVBvwVs4OQa+InCF701bOs5EzEufoRK
m96z0sg7ZYoHJa3ZHPHNOoqahhBFAw==
=Ag3f
-----END PGP SIGNATURE-----

--Sig_/KV+JkmtVQqczK+HXrh_=yhh--
