From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the gfs2 tree
Date: Wed, 20 Mar 2019 08:24:02 +1100
Message-ID: <20190320082402.5af7812e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/dJcu8/ISlMk0rINfVKju5Rq"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Whitehouse <swhiteho@redhat.com>, Bob Peterson <rpeterso@redhat.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andreas Gruenbacher <agruenba@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/dJcu8/ISlMk0rINfVKju5Rq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  31b13f0abfa6 ("gfs2: Fix loop in gfs2_rbm_find (v2)")

Fixes tag

  Fixes: e579ed4f44 ("GFS2: Introduce rbm field bii")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/dJcu8/ISlMk0rINfVKju5Rq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyRXfIACgkQAVBC80lX
0GzccQgAlFsa8NGGfgojG2MKSN3pjdgxlNyww8zmdJDQ5mkJwmBOJaVJ/UxZKGLL
3zpMF63AfU9Ynp3zlaCh6J5C/2f/E+LfBv5SxPWMvpMneF22HVmHCFI70VI2FMVm
wBvduapkUAPtmHsV0C9sDSKSV4CaDsD1SjAAuDj8E0QSMi9R08YzObd/JAHhXg+B
QRWndVx1yxHaEtA6CPuelK/WjkD5OpnxTnTAI/PhEocYbhKhqHyeKyQq5QqRggtB
YOBUsLZgMuzhHyWN/JquqqldRAEyHZ2Gr7BnwkMZoILrezRTzaozMeHQhnjONG8K
mKPQP4rOWzTSDIKMV+lLEG65+zO3Bg==
=DKaH
-----END PGP SIGNATURE-----

--Sig_/dJcu8/ISlMk0rINfVKju5Rq--
