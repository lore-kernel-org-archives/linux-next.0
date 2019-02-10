From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the fbdev tree
Date: Mon, 11 Feb 2019 07:24:43 +1100
Message-ID: <20190211072443.1cbedb29@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0jbvx2uDb=JZ6mlzAEZVh6q"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal =?UTF-8?B?Vm9rw6E=?= =?UTF-8?B?xI0=?= <michal.vokac@ysoft.com>
List-Id: linux-next.vger.kernel.org

--Sig_/0jbvx2uDb=JZ6mlzAEZVh6q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bartlomiej,

In commit

  7d7e58d30e04 ("dt-bindings: display: ssd1307fb: Remove reset-active-low f=
rom examples")

Fixes tag

  Fixes: 519b4db ("fbdev: ssd1307fb: Remove reset-active-low from the DT bi=
nding document")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/0jbvx2uDb=JZ6mlzAEZVh6q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxgiIsACgkQAVBC80lX
0Gx8Owf/ef1b6SjQ6j0R8Pi+vN3kshSml97kMXbIWa4NNhcS1+7NuQ5kbNfFEl9O
rR2nQWdUTsmgcm2b0E0CrySJvv4rmBdC7oNkz7BcuYs78GxXjhgpyrzBU0W3iADH
vbDO3Lxn62d7ZMS7+Hb8S+WBWHB+Ei/yA7c3HLOZA7rRyUdFQoekuvbi9wKnmY3w
NtLgIUokp61sCafaKpfXmld3R7jhHtvzlWXWrhHn1HZEuqredwp26AlX4Cqz5bgZ
QCVK5ph7nrP/rN3KChV4dKKIl3VLOB93+T1M8qlvm8QP+9HX63P2iElEKBf43za6
F3JikrgLYUemqNsNImPnthcbcXDSdQ==
=d/FZ
-----END PGP SIGNATURE-----

--Sig_/0jbvx2uDb=JZ6mlzAEZVh6q--
