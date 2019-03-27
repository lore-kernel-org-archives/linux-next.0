From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the tty.current tree
Date: Thu, 28 Mar 2019 07:27:34 +1100
Message-ID: <20190328072734.2093d03c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NyVSC6m2iVyJYjsKHiymQmt"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Razvan Stefanescu <razvan.stefanescu@microchip.com>
List-Id: linux-next.vger.kernel.org

--Sig_/NyVSC6m2iVyJYjsKHiymQmt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  69646d7a3689 ("tty/serial: atmel: RS485 HD w/DMA: enable RX after TX is s=
topped")

Fixes tag

  Fixes: b389f173aaa1 ("tty/serial: atmel: RS485 half duplex w/DMA: enable

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags across more than 1 line.

--=20
Cheers,
Stephen Rothwell

--Sig_/NyVSC6m2iVyJYjsKHiymQmt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyb3LYACgkQAVBC80lX
0GwHBQgAkD7cBTS7hUYKD4hoE9pLltdzovpDBdWdZKVXeTrMd4i9T4g2HgavU5Uk
f4dHLMdvhO+nY1Snl7B4bra43+qbMLNnwYvXEF/Q8Atn6Hq97AqrZxV8MycQSu3x
G6mfUFobNhy+UkDPPaPXMO1B1S0L7wB7bYNw9x48FBwtq6dYc0HyiGpj4FQh/LL2
1oZSnS783Yq0zsZSatG6OwohHQ0MI7U/IpvZ5MQEAyHcQYsOU4GlYGfifivuPzdz
sS+I71YNZl1Y3X2vwgOhpzkrY1HrZoJ6NpFDqCKu1ZPtsXfM75I6MHQP8ryp2E3S
YMI3wa4qLVpPekQ18aHR2BXqZ2UEHA==
=xMme
-----END PGP SIGNATURE-----

--Sig_/NyVSC6m2iVyJYjsKHiymQmt--
