From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the sound tree
Date: Fri, 22 Feb 2019 00:10:29 +1100
Message-ID: <20190222001029.03c14a16@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//8bgML0XMvcBgnKBnLQAEFd"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jian-Hong Pan <jian-hong@endlessm.com>
List-Id: linux-next.vger.kernel.org

--Sig_//8bgML0XMvcBgnKBnLQAEFd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

In commit

  de73e99af971 ("ALSA: hda/realtek: Enable audio jacks of ASUS UX362FA with=
 ALC294")

Fixes tag

  Fixes: 4e0511067 ("ALSA: hda/realtek: Enable audio jacks of ASUS UX533FD =
with ALC294")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_//8bgML0XMvcBgnKBnLQAEFd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxuo0UACgkQAVBC80lX
0Gz8QggAhXz5FXPnGxbAHVD+5ZUAdpzl5Xz0fOhu/d+Vyjhm1HHEmYzOSWblF7fi
hIBruh0DddGLt2V1j1hTHvBOeWmqM+nxPDiE0HXw7lsAMO5QEVlgaZrCyrCSQbZb
7rAKPvlFyEPE7QvAxYjMaPnLwOoE8Glys7HZVCdfQvM9vgAQ6qDQa+4sjvDl0/lh
38rriCe99J3R3FSsHFrCpel9YHnC5bNDTzgw67XxVHZTBR7/+/IoEUadwCTSG17+
wsYqeitjgpvQeaMHFVhcI2AdI98CZLy9ldrs3oH0MeIwi1Vxj/5arEpIkCLJIBem
f1OX+JQx/azvrq6xwpmmNuL29zJoLQ==
=eFle
-----END PGP SIGNATURE-----

--Sig_//8bgML0XMvcBgnKBnLQAEFd--
