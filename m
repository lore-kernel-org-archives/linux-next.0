From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the sound-asoc-fixes tree
Date: Tue, 14 May 2019 01:00:54 +1000
Message-ID: <20190514010054.5ab84a56@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/00XKta0_obGgJC=tRojAR=4"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/00XKta0_obGgJC=tRojAR=4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  7df8e234449a ("ASoC: pcm: fix error handling when try_module_get() fails.=
")

Fixes tag

  Fixes: 52034add7 (ASoC: pcm: update module refcount if

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").
  - Please do not split Fixes tags over more than one line

--=20
Cheers,
Stephen Rothwell

--Sig_/00XKta0_obGgJC=tRojAR=4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzZhqcACgkQAVBC80lX
0GzOyQf9EUlQwT2PGd5j/mRjB7SMtOV9hVhk7bzj8rxE/7F9i08M48c9k4lCRK4K
hTF/fMryO7pxldkKtE8FR86SQRu200o89N2X4+81rNniXs61MTWezo1yzbfUPRZI
ciQDMjA5ij1bdCOc76xLpfYnIQWH9cwhVhOZZ19ldzZcAR3QBFEWDPxX6b2O8Ksn
tTDRFyJdRczeM+rwftRdQqVt7yAxyDFXmP6Lcej2Jq3FLduEZdliCdJzDi1fiZdV
IHBDQRKMdCMrbflLM9G06ALkVkN1qnAXnE2oj19lJD0uGqCp8jlnK8mwRaPkEGNo
aae7XyShZbaIkirqJLE3+9RD1WPFVQ==
=6KL4
-----END PGP SIGNATURE-----

--Sig_/00XKta0_obGgJC=tRojAR=4--
