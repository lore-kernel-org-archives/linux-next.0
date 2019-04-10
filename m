From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the sound-asoc-fixes tree
Date: Thu, 11 Apr 2019 07:00:30 +1000
Message-ID: <20190411070020.38749a8b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gmH.ErzNdf.+VgZ6kbf.hin"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/gmH.ErzNdf.+VgZ6kbf.hin
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  70802487bb91 ("ASoC: pcm: fix error handling when try_module_get() fails.=
")

Fixes tag

  Fixes: 52034add7 (ASoC: pcm: update module refcount if

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").
  - Subject has leading but no trailing parentheses

Please do not split Fixes tags over more than one line.  Just use

  git log -1 --format=3D'Fixes: %h ("%s")' <commit>

--=20
Cheers,
Stephen Rothwell

--Sig_/gmH.ErzNdf.+VgZ6kbf.hin
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyuWW4ACgkQAVBC80lX
0Gx7Rwf9Gav4B9R1wsmQc+BPoSx/a1xLX4wlHkwTkp7B1r1QccZxFhQubuY+Jy/h
/0EuLyJSmqE4GxYCNizChjRg9yNB8XZprrJ8EE7wKQPu7VICRCvw6QipyqguXNwD
TBGw0LFCIBw5NhSg4Gf1lAHaLapsEAto7za7TnI7jT/uu8gHhkM1S+d1QiKBWYNj
8SAuQDp5t/QORMaduMXldFkvukxc67sNsWkYKKgLJz/C6if+3ciRjJXP78qWdH3d
FFJ6EgsqDvhzY6rU4ey5WvbOhQx8AwW92YLXIYaysjfxBKUuUX42ONuuOCJMHNNV
k0Tknwze2kFjwYM4go8z8dp+EaZHsQ==
=rVd0
-----END PGP SIGNATURE-----

--Sig_/gmH.ErzNdf.+VgZ6kbf.hin--
