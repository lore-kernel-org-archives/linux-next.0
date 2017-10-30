From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the sunxi tree with the arm-soc tree
Date: Mon, 30 Oct 2017 12:22:00 +0000
Message-ID: <20171030122200.z5sj2riar4vfoiwo@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="44j64tp64e4prup6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org, arnd@arndb.de, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
Cc: linux-arm-kernel@lists.infradead.org, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--44j64tp64e4prup6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sunxi tree got a conflict in:

   arch/arm/boot/dts/sunxi-h3-h5.dtsi
   arch/arm/boot/dts/sun7i-a20.dtsi
   arch/arm/boot/dts/sun6i-a31.dtsi
   arch/arm/boot/dts/sun4i-a10.dtsi

between commit:

   8dccafaa281aa1 ("arm: dts: fix unit-address leading 0s")

=66rom the arm-soc tree and various commits from the sunxi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm/boot/dts/sun4i-a10.dtsi
index b9b138a36686,b91300d49a31..000000000000
--- a/arch/arm/boot/dts/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/sun4i-a10.dtsi
diff --cc arch/arm/boot/dts/sun6i-a31.dtsi
index ca46bd223ebb,8bfa12b548e0..000000000000
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
diff --cc arch/arm/boot/dts/sun7i-a20.dtsi
index 08bea4f5616d,228c368537a0..000000000000
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
diff --cc arch/arm/boot/dts/sunxi-h3-h5.dtsi
index f2dcf97a0d08,d7a71e726a9f..000000000000
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi

--44j64tp64e4prup6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAln3GWgACgkQJNaLcl1U
h9AwRgf/TLEiO6GqMprHuahTYIjUpbJcLn8zo5dDWrMSH64oeH6eO39apQA6yxpT
Hw1zWrmsKmMl7ipiADLyCbLBtcETRMlPJ10dvSNtHOpGrIn9/o/N2B7I27+y1iaI
m5t7aJd1ry0nFvemWHOoHr9sT/VluYYozB+QHXlLvCgQcWbuL8bQsXXHx5Vy0P1N
lWBI9EleyKSzjiu9zKuM7lv7TElIYLRlKksEDUimGNZ5dQHlhhPDCsR4ie4I+YbK
axmBFoxgcJ+kjioRDDvMl6c5AHORmBBcjh7p/YQcbeRJcV9g8Fu49brOI5b9enOO
1SN2E3fEtfukBRIVzPEECq5ydHC4FA==
=ajiz
-----END PGP SIGNATURE-----

--44j64tp64e4prup6--
