From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the arc-current tree
Date: Fri, 18 Jan 2019 07:32:57 +1100
Message-ID: <20190118073257.5809b05f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/xjKl8K0_nKccmslA0B20++f"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: linux-next.vger.kernel.org

--Sig_/xjKl8K0_nKccmslA0B20++f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vineet,

Commit

  8e542d2a28c9 ("ARC: adjust memblock_reserve of kernel memory")

Fixes tag

  Fixes: 9ed68785f7f ("ARC: mm: Decouple RAM base address from kernel link =
addr")

has these problems:

  - SHA1 should be at least 12 digits long

--=20
Cheers,
Stephen Rothwell

--Sig_/xjKl8K0_nKccmslA0B20++f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxA5nkACgkQAVBC80lX
0GzBqQf7BF7q83reSR3NF0E7DTDWke/VQBs+UDjYBGDDf3zjX/cNuEZ8ng9yrnqa
9CiRC/WvO/nwLW6UAATbaXTmOaeCrIeAaJjZXFNoCCPqdvP5coRMk4YTrVS7wjdu
VqIl7FrKEv+Ml9GDoqfnY06IAZUbwX7xVrfuzVUmA1onF7rmImvvHtuh9NaVDi2q
0r19IpW90aqznsc91V9Xu8REZPH/VBjkicdtr72U25x9IIb7p2c+vBTYojRngx9r
98TrgCdV+qOiwzk5OyAb195hkT5UFIoFAK6eCv9KygGqBsUIKl4dlPc09pKvhrsf
2rTDR7gg6JQ1QbqzAUVHpUiFp84xjQ==
=0wuO
-----END PGP SIGNATURE-----

--Sig_/xjKl8K0_nKccmslA0B20++f--
