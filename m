From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the ceph tree
Date: Thu, 6 Jun 2019 07:48:53 +1000
Message-ID: <20190606074853.69a7b07b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.obmgY=Il4.cZZcJjqKbo+y"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sage Weil <sage@newdream.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Yan, Zheng" <zyan@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/.obmgY=Il4.cZZcJjqKbo+y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Sage,

In commit

  7b2f936fc828 ("ceph: fix error handling in ceph_get_caps()")

Fixes tag

  Fixes: 1199d7da2d ("ceph: simplify arguments and return semantics of try_=
get_cap_refs")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/.obmgY=Il4.cZZcJjqKbo+y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz4OMUACgkQAVBC80lX
0GyEtQf9G0PMBiXfNt9LB1+AgGgRk9+BVIZup9stxuIbY9qoJr/112B25NESkWWu
JuCKNNKlKuI+f79Sqxi73Avelad/BXDlPurjFlLEfTCeaCIAvR6VcC/i7OPXpA5K
HJrSqJ6Tei4HLwrc8ODDDoP+hM7Z/bXa+VvL/Us2S7rAdOUwDV7NpswFyoQjP8Df
SnpFZxETXiLZGN/waTr2mxlX44NSU7siv0+DLaf03NQjhrhQrQk9VlrPOXNvflT9
8DF8v+5Jv5SWcZ7+oHAclLSJWsLHL/m2+nvUZ9Mas4S/fZXsanMh0VK3y6D6O5Ya
Tqp5QvqpoIuUJ/oZSLscdyynhH4N/w==
=dIMC
-----END PGP SIGNATURE-----

--Sig_/.obmgY=Il4.cZZcJjqKbo+y--
