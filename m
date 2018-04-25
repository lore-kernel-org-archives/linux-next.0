From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the clk-samsung tree
Date: Thu, 26 Apr 2018 09:19:40 +1000
Message-ID: <20180426091940.16bb1faf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/J0ZNszMI7N.YaOrpxfJhozp"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/J0ZNszMI7N.YaOrpxfJhozp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Sylwester,

After merging the clk-samsung tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from arch/arm/boot/dts/exynos5440-sd5v1.dts:10:0:
arch/arm/boot/dts/exynos5440.dtsi:9:10: fatal error: dt-bindings/clock/exyn=
os5440.h: No such file or directory
 #include <dt-bindings/clock/exynos5440.h>
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
scripts/Makefile.lib:291: recipe for target 'arch/arm/boot/dts/exynos5440-s=
d5v1.dtb' failed
In file included from arch/arm/boot/dts/exynos5440-ssdk5440.dts:10:0:
arch/arm/boot/dts/exynos5440.dtsi:9:10: fatal error: dt-bindings/clock/exyn=
os5440.h: No such file or directory
 #include <dt-bindings/clock/exynos5440.h>
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  f986c0e40ff5 ("clk: samsung: Remove support for Exynos5440")

I used the version of the clk-samsung tree from next-20180424 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/J0ZNszMI7N.YaOrpxfJhozp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrhDQwACgkQAVBC80lX
0GxZQQgAkqjrKFNur6fra1Yx8tCOMGaDzoNA7Bnp+LWfZF4BqRA4smKQ4zabKmDp
ivSpRnKf6YQJB7rPULVB5KUn75Pk2D4NkNmyL1Ac3g7JoQC6A4/t30a+d3ioeT8z
wSBg6R5HFEgQ4bgmXY96wb7Wqe9YZqGQGRPKkpnFQvrT6xaX4sP31UB9DUJS/4LB
OHYl/2RwCsYdhUP5EQr42GlOudQNoASQ39RQjfN+4cte3tuj6+2PzQnjkt3d5S8z
ntMeUuxnnESBEid3D4R7DsRTjafTMFBjlwK5wOVCq/mPTok9fZOhicgJevcwqvlU
GXjIfi5Y+GxBZpz4dKRzdnc3OzHkqQ==
=TXdZ
-----END PGP SIGNATURE-----

--Sig_/J0ZNszMI7N.YaOrpxfJhozp--
