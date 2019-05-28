From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the ipsec tree
Date: Wed, 29 May 2019 07:48:12 +1000
Message-ID: <20190529074812.00c8df44@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/t68a.7rqE3KQABLBwq1dh39"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Steffen Klassert <steffen.klassert@secunet.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jeremy Sowden <jeremy@azazel.net>
List-Id: linux-next.vger.kernel.org

--Sig_/t68a.7rqE3KQABLBwq1dh39
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Steffen,

In commit

  7c80eb1c7e2b ("af_key: fix leaks in key_pol_get_resp and dump_sp.")

Fixes tag

  Fixes: 55569ce256ce ("Fix conversion between IPSEC_MODE_xxx and XFRM_MODE=
_xxx.")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/t68a.7rqE3KQABLBwq1dh39
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlztrJwACgkQAVBC80lX
0GxuXAf9Hh415uZ2vKeIAQ4ICsK3TgMdgl6omZ92f3gE0vTerrGpw9weux9qf18o
JR10zdcusb1hVJ8BReB+h8j5yyQqsRIgtVvjvNDubknk4gr/LIh3fkvnIY9eX3cm
D/1O2hfie0Z6Xk9an1RkHq8WuTLjnoGUamv21OxDBVJQ7z+LwceZp43E+kHCVqYd
llrgDPCu/9xJ0DOEghfxGOfviDGcJnVP8Tph+BKq0ArYcEdhINmS/GV/aJpA29gH
LkTL9cyd2g73jN6J3ncHj+PzvoRtgbDj67Rx87xNQZa2VjCF1tUGqG8QhKekY+zp
mvC9jlcaYFtnJvo6erw5FqGcMCUV+Q==
=2q9e
-----END PGP SIGNATURE-----

--Sig_/t68a.7rqE3KQABLBwq1dh39--
