From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the net tree
Date: Tue, 19 Mar 2019 16:20:25 +1100
Message-ID: <20190319162025.3024a5e6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//kWFd7n=Pi9h5i=LkzhdcLF"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yoshiki Komachi <komachi.yoshiki@lab.ntt.co.jp>
List-Id: linux-next.vger.kernel.org

--Sig_//kWFd7n=Pi9h5i=LkzhdcLF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  18bed89107a4 ("af_packet: fix the tx skb protocol in raw sockets with ETH=
_P_ALL")

Fixes tag

  Fixes: 75c65772c3 ("net/packet: Ask driver for protocol if not provided b=
y user")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_//kWFd7n=Pi9h5i=LkzhdcLF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyQfBkACgkQAVBC80lX
0Gz/Uwf/QM4t34PddhPvfqKsRMftReoe/YZZSAT1uCfk0TbLDi+MCm3oi5DclJM1
ZUqMgye4kMZZmkH6lmzssW0d0wNrPwVlxo+Cd8lsXXPmhs7vsFffbTrAXGMbGJ8V
L3oO4HogPYr6mNnhL8XKTBiO7luNMM/RR4ImT3ZPMgxOWTi2jRi54GklS14/tvxn
v49o259YpVT2orZpZ/Foo15nUGomIZQpCAUI4MZQFtHDhw5sm1CryB6dQ6ANeyyC
NeAdqACSeylKrQnYAl14UtmEdi1oFJ3Ax+kSwj9Kx1icIAIoiXvqbc4sgA5gQnUG
37uMZguksrQy3C/wM1gb+SZb4X/Wzg==
=0CFl
-----END PGP SIGNATURE-----

--Sig_//kWFd7n=Pi9h5i=LkzhdcLF--
