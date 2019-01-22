From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the renesas tree
Date: Wed, 23 Jan 2019 07:56:05 +1100
Message-ID: <20190123075605.116ddbd0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YGyIxYLgTJF6YbZ7JO3Zxhz"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-Id: linux-next.vger.kernel.org

--Sig_/YGyIxYLgTJF6YbZ7JO3Zxhz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8d6e2bbaeceb ("arm64: dts: renesas: r8a774a1: Fix hsusb reg size")

Fixes tag

  Fixes: ed898d4fc19d ("arm64: dts: renesas: r8a774a1: Add USB-DMAC and

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please don't split Fixes tags across 2 lines.

--=20
Cheers,
Stephen Rothwell

--Sig_/YGyIxYLgTJF6YbZ7JO3Zxhz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxHg2UACgkQAVBC80lX
0Gwkxgf/ZCI/KU8klbgL6sKakQ50tMiJOqh3vRQCJUZ6fLKDXWJW7sHRyXx2wx9R
+pki+C9w2Rs6zRy3ZaSmeb7NzNiz8GamCw5cXsgYII/uYM7lPkSz63dWPCI0mzLf
+IVapC1mjMF2iIXJ9ekFO/ltb2PyY9S6pX9OvmWOGwP0mlHpRiOEy0fAty9SVDjm
aroLfa7gurTeQQd8lYPX+3dJ4GzGJwiG5rpKoqtOU3RHkow0LVa/T+n23sn4xBcF
1hwdbuckMP3l37g/GzjRy39hLzTX4B4r+mfTLR1eqi4rGac4gTeZVNvA+nVSLu9K
Xz51EJ4umBC0TZ2MZC5YbqYS+ibqQw==
=+QQm
-----END PGP SIGNATURE-----

--Sig_/YGyIxYLgTJF6YbZ7JO3Zxhz--
