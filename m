From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the mmc tree
Date: Tue, 30 Apr 2019 07:46:32 +1000
Message-ID: <20190430074632.41770aca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/GTco9g8Ng=qUi3DFVj=uzvl"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pan Bian <bianpan2016@163.com>
List-Id: linux-next.vger.kernel.org

--Sig_/GTco9g8Ng=qUi3DFVj=uzvl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

In commit

  98bc384ce704 ("mmc: core: fix possible use after free of host")

Fixes tag

  Fixes: 1ed21719448("mmc: core: fix error path in mmc_host_alloc")

has these problem(s):

  - missing space between the SHA1 and the subject
  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/GTco9g8Ng=qUi3DFVj=uzvl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzHcLgACgkQAVBC80lX
0GylQwf/dKwPkuFztaqgyDI5/T15xB412WcccraMyV39arDYN4cJI9pD0g9VUXwJ
JYfqBF/sjDTMxsmUohwXdsyJm5S1NRSjWaYOvtbhviO804HPHIr9PuqMOmva+0rV
WnqQUdq9RxDIvy27cdmqr0BT5dajpBULY2aYP3kdKhfkAjEC8/azPAtrAO1brMAz
uUnXnmhvH/55nXuLe0np4sbnuZGs9xQsazy4Z8xJC+Rk1zwlsEbmc8+GVbFwq+rI
v4PoX3G4KXnrhvWQQlo3VpM4mm2BmiPaQ0vl2qc+JQSP+FRlHtuzN1VzvLPF3pMM
5+PmkwSRdCCYoawJZnoCvku2doYesA==
=B73O
-----END PGP SIGNATURE-----

--Sig_/GTco9g8Ng=qUi3DFVj=uzvl--
