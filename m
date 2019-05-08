From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags need some work in the v4l-dvb tree
Date: Thu, 9 May 2019 07:53:11 +1000
Message-ID: <20190509075311.1865ca8b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/FHpSzG6JJhO86JmkIl_PTbX"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Eugen Hristev <eugen.hristev@microchip.com>
List-Id: linux-next.vger.kernel.org

--Sig_/FHpSzG6JJhO86JmkIl_PTbX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  1199fa8c0ddd ("media: tegra-cec: fix cec_notifier_parse_hdmi_phandle retu=
rn check")

Fixes tag

  Fixes: 4d34c9267db7: ("media: tegra_cec: use new cec_notifier_parse_hdmi_=
phandle helper")

has these problem(s):

  - the ':' after teh SHA1 is unexpected
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

In commit

  1e4e25c4959c ("media: atmel: atmel-isc: fix asd memory allocation")

Fixes tag

  Fixes: 106267444f ("[media] atmel-isc: add the Image Sensor Controller co=
de")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

In commit

  79199002db5c ("media: atmel: atmel-isc: fix INIT_WORK misplacement")

Fixes tag

  Fixes: 93d4a26c3d ("[media] atmel-isc: add the isc pipeline function")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/FHpSzG6JJhO86JmkIl_PTbX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzTT8cACgkQAVBC80lX
0Gzd/wf+OnEgksfPQzlPlH6WxyYgQzboNgR8RrbKfxgDPPLdkINV/fXwGvacw12Z
pTLvj8hk6DINl2H1R59AsIkVu/mX43fNF8+hIz+VFsAQiKFiGapIMkIb+GfWPAGp
wZok4LXIdNcATZvmr9xBlNEObbhG345AbgN/fUpP1spM/sOOYZYnzo/WSc9bOcWE
lKZ1KJTPIES/G6ixuqILFn0DRllxV5Z3C8FrEwLdvFE0eArkDvW5PKorsb9keTQ2
lvT/KitWYvwqmoTnQLoKCe5+38gxmpFHDUKPNvVRa6peICJIj0i3qeEeGq4Yz50v
UEpr7kVwXPRUOi3jOwasUB4K5hs5xA==
=n53M
-----END PGP SIGNATURE-----

--Sig_/FHpSzG6JJhO86JmkIl_PTbX--
