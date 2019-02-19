From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the net-next tree
Date: Wed, 20 Feb 2019 09:31:36 +1100
Message-ID: <20190220093136.73779781@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PeFdU3HN7vduMNJqwUmiEU3"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew@lunn.ch>
List-Id: linux-next.vger.kernel.org

--Sig_/PeFdU3HN7vduMNJqwUmiEU3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  a968b5e9d587 ("net: dsa: qca8k: Enable delay for RGMII_ID mode")

Fixes tag

  Fixes: 40269aa9f40a ("net: dsa: qca8k: disable delay for RGMII mode")

has these problem(s):

  - Target SHA1 does not exist

Did you mean:

  Fixes: 5ecdd77c61c8 ("net: dsa: qca8k: disable delay for RGMII mode")

--=20
Cheers,
Stephen Rothwell

--Sig_/PeFdU3HN7vduMNJqwUmiEU3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxsg8gACgkQAVBC80lX
0GymcQgAobz4jyG0c9hquVzRF0ipROjjFvYsC85cwcNrr0KvArwZY3n39LBMuq9M
5h/40Ws53z+uM27ZnYo5WP6tne4mWMs/kzIwJMwzNobV5dV6FlOtE6Qvv8QSHD9V
1BxiYc/Dq6kLw3EBqUtlcKjx748NqKf8LKSBFqX886FXDMTFC+L3EOlzJcKK7lFV
l9CwLhSWwxmecKMIeRMCB8mM+T8/A4tw3ET0mBFHfJOMiPokf5fwNp+K/ItGN8Iy
LceNVO+JEgha+cAQx7ZFNgvikVxV+3izAKN+aY8VBJimzeKtp55wMkLbMklDFSIf
5gNQFNL9zXyxI7vAUCv96h3dEXQNiQ==
=NX/A
-----END PGP SIGNATURE-----

--Sig_/PeFdU3HN7vduMNJqwUmiEU3--
