From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the net-next tree
Date: Tue, 23 Apr 2019 07:26:34 +1000
Message-ID: <20190423072634.57cdf8b0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/tsgWxA3BKl85cM3aDU7WR=/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, John Hurley <john.hurley@netronome.com>
List-Id: linux-next.vger.kernel.org

--Sig_/tsgWxA3BKl85cM3aDU7WR=/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  7d26c96052cd ("nfp: flower: fix size_t compile warning")

Fixes tag

  Fixes: a6156a6ab0f9 ("nfp: flower: handle merge hint messages")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: dbc2d68edc98 ("nfp: flower: handle merge hint messages")

--=20
Cheers,
Stephen Rothwell

--Sig_/tsgWxA3BKl85cM3aDU7WR=/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly+MYoACgkQAVBC80lX
0GyxBAf/fSvY50YswnL5EHL0gGOHrxiidhu5XHP+FRdqSUvNBz41wzTzhyTaokVV
TYcGJItf2n06jbyGMNhhA75NIIor8xaDbepJZ27rqimb4g1XMm/mTGnkfDGdBRR0
Fv0S/ApnkAKvtuztEmeJLaCq/BSwweU86VynVIhmdABhKmGo4ENyiNe2+v7b+nLT
U3nkoQCq/s/lKi9+dY+sTaUNlDiIXKk0gEcdnbAUcnmYCYtDtfRiMSmsGvnGewKN
oPcV5VOL7Li4xbMMCgrWwtXct1K/N6SK8xJ8EozBQAv3duQAqX5wxDRXjWMl0Zqu
/JzWU8KECIe/fUPZJXUaounXt9EFbQ==
=sIOX
-----END PGP SIGNATURE-----

--Sig_/tsgWxA3BKl85cM3aDU7WR=/--
