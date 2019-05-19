From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the net tree
Date: Sun, 19 May 2019 11:55:54 +1000
Message-ID: <20190519115554.5fb4401d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/F8Ln1Iv=xRyhhRkafI0faUa"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Junwei Hu <hujunwei4@huawei.com>
List-Id: linux-next.vger.kernel.org

--Sig_/F8Ln1Iv=xRyhhRkafI0faUa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  532b0f7ece4c ("tipc: fix modprobe tipc failed after switch order of devic=
e registration")

Fixes tag

  Fixes: 7e27e8d6130c

has these problem(s):

  - missing subject

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/F8Ln1Iv=xRyhhRkafI0faUa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzgt6oACgkQAVBC80lX
0Gzdjwf/ReTHS6gphp80Qg9+IifkL9yZGNbTP59/YBBJWkSQD8ElZovA57jFum1D
aBZ0CjcePFJ6qrQbUK4t0jCyviSY2yyxzeA0nTB23MENUtJJjPv55557OPtb5eiR
7sr+Nh9/59WN7smM81yZbGaG3BviZeLMKyg1XVLA3uQ+wPAZh49QPlzRk5xQzgrm
nE6woXxj8UIWBtufUEOfJjOXgaQgOVRjYd3XUxL5TMYZBWzd7Plpix2y0K0X93LV
mIxfNTofLInV8iMH9hdHNZRo1xwwhaK9ytppeXPrC4cMYOJ+f/eSBiRy/R09LJSZ
qmLE/UnfUHxZTAZU5YPztoNa0VvGMA==
=5Ani
-----END PGP SIGNATURE-----

--Sig_/F8Ln1Iv=xRyhhRkafI0faUa--
