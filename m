From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the arm-soc tree
Date: Wed, 3 Oct 2018 07:21:40 +1000
Message-ID: <20181003072140.7c18d772@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/R05i2mNEGINKxz7p1lx0qkT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>
List-Id: linux-next.vger.kernel.org

--Sig_/R05i2mNEGINKxz7p1lx0qkT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  6eeb4180d4b9 ("ARM: dts: sunxi: h3-h5: Add Bananapi M2+ v1.2 device trees=
")
  80c21c8c8b8d ("arm64: dts: allwinner: h5: Add device tree for Bananapi M2=
 Plus H5")
  aa8fee415f46 ("ARM: dts: sun8i: h3: Split out non-SoC-specific parts of B=
ananapi M2 Plus")
  db9fd9d13e30 ("ARM: dts: sun8i: h3: bpi-m2-plus: Fix address for external=
 RGMII Ethernet PHY")
  6c700289a3e8 ("ARM: dts: sun8i: h3-h5: ir register size should be the who=
le memory block")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/R05i2mNEGINKxz7p1lx0qkT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluz4WQACgkQAVBC80lX
0GxCTAgAozD5f4v6SR6WyCl1blW3dv0OqFGVM0454VPbZpb5a88fuvavZFL7LJ4c
Ya4xOM/a3oAZD7JpO9J5qX0oZ1lAQ1yz/VPVZna6EuQSDl6BPeqW0unJlVTidtuu
+C6ze2HtrYdEOCwZvQrsUe6CUVRcYqOSRdnwnaivzPI2kD95UTOgW24344Rd7xu8
+CHIsEChOAhMGUjenEC7bSmbKISD5T5s7duysWw5tcnZ1wq/lF3xHtkSSbHNwX8V
y6S1hI0Pl9B4LbrMvD03W9vGNfCh+A4RBOtZrsH7cDgEBQGcEXNCGpo9hbJ8RBf+
7iQEUmf1V1WQBj2ScSkwqwkIW8NnhQ==
=Sj+p
-----END PGP SIGNATURE-----

--Sig_/R05i2mNEGINKxz7p1lx0qkT--
