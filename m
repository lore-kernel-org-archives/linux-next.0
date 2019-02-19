From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags need some work in the staging tree
Date: Wed, 20 Feb 2019 07:43:36 +1100
Message-ID: <20190220074336.4c09597a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/sq4h2.LWyEFRXrGPYfoNY=Q"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sergio Paracuellos <sergio.paracuellos@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/sq4h2.LWyEFRXrGPYfoNY=Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

In commit

  8b20408a5662 ("staging: mt7621-pci: reverse condition to check for enable=
d port")

Fixes tag

  Fixes: 802a2f7b2fe3: staging: mt7621-pci: factor out 'mt7621_pcie_enable_=
port' function

has these problem(s):

  - colon after the SHA1 is unexpected
    Just use
	git log -1 --format=3D'Fixes: %h (%s)'

In commit

  766becee70f6 ("staging: mt7621-pci-phy: use 'module_init' instead of 'arc=
h_initcall'")

Fixes tag

  Fixes: 00981d31d6df: staging: mt7621-pci-phy: add new driver for phy part=
 of mt7621-pci

has these problem(s):

  - colon after the SHA1 is unexpected
    Just use
	git log -1 --format=3D'Fixes: %h (%s)'

In commit

  ca87a3bf731d ("staging: mt7621-dts: fix pci phy register addresses")

Fixes tag

  Fixes: 06184ba5a33a: staging: mt7621-dts: add pci-phy related bindings to=
 board's device tree

has these problem(s):

  - colon after the SHA1 is unexpected
    Just use
	git log -1 --format=3D'Fixes: %h (%s)'

--=20
Cheers,
Stephen Rothwell

--Sig_/sq4h2.LWyEFRXrGPYfoNY=Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxsangACgkQAVBC80lX
0GxqHwf8DsHGbYxV/To9Jx89GXeRKT8DOlQ+FUfWVtbIffCckYAPT+qhCda0u0Rs
TJ68goPq6mNhuRbwHpOBy5eeixnCFASdW6rrUi7EpH4YB9EfgWA7fOHKYJDHDF0N
sVzQ+kFFGyO8PUGAfy7zM7dY53D8i/UMih4MYuTpbUop00jdaiOa33bWXHKywZGF
8uHB0qCVvGLWDWc9lBcZQldi5zocK1yhBd1oXSDeWsVxkD44+zURHVhFdL0MRY/D
zn9ZTVcJ+KKGqiomUZjUICIzPWTpuoFl+2OzR7B7y8V3mapl10Sxlrvcx3DdznLl
/VJtD6TJxszcDP5s72y4TlqikwVO9A==
=viJr
-----END PGP SIGNATURE-----

--Sig_/sq4h2.LWyEFRXrGPYfoNY=Q--
