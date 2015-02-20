From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clk tree with Linus' tree
Date: Fri, 20 Feb 2015 11:17:50 +1100
Message-ID: <20150220111750.1aca940b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6H0I/LunfTxWHbR2yOmYYMA"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Emil Medve <Emilian.Medve@Freescale.com>, Michael Ellerman <mpe@ellerman.id.au>
List-Id: linux-next.vger.kernel.org

--Sig_/6H0I/LunfTxWHbR2yOmYYMA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mike,

Today's linux-next merge of the clk tree got a conflict in
arch/powerpc/configs/corenet32_smp_defconfig between commit
a85cade6762b ("powerpc: Update all configs using savedefconfig") from
the  tree and commit 8f0ab1e14139 ("powerpc/corenet: Enable CLK_QORIQ")
from the clk tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/powerpc/configs/corenet32_smp_defconfig
index 51866f170684,cce62e934e0c..000000000000
--- a/arch/powerpc/configs/corenet32_smp_defconfig
+++ b/arch/powerpc/configs/corenet32_smp_defconfig
@@@ -138,10 -143,11 +138,11 @@@ CONFIG_RTC_DRV_DS1307=3D
  CONFIG_RTC_DRV_DS1374=3Dy
  CONFIG_RTC_DRV_DS3232=3Dy
  CONFIG_UIO=3Dy
 -CONFIG_STAGING=3Dy
 -CONFIG_MEMORY=3Dy
  CONFIG_VIRT_DRIVERS=3Dy
  CONFIG_FSL_HV_MANAGER=3Dy
 +CONFIG_STAGING=3Dy
 +CONFIG_FSL_CORENET_CF=3Dy
+ CONFIG_CLK_QORIQ=3Dy
  CONFIG_EXT2_FS=3Dy
  CONFIG_EXT3_FS=3Dy
  # CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set

--Sig_/6H0I/LunfTxWHbR2yOmYYMA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU5n0zAAoJEMDTa8Ir7ZwVlkIQAJRzb6aPCnFzUKcyRpN94qqm
huSqZaCCIxSnLhLiEM16RvcQDJdhXLgp7M4GjxArVgNVSaA0GMORMAUddl7zqmCY
H8r0uWAH+A6/nP3Ki2oGjZ162AoZCJEpn8PGvqMp4RVBFqCmSnCMc06dRRuIWisu
5tN5MEaLJKP6GvIKnzHDMxbqik4AtDQcqbMkBpfJg0GJWPkxIgh7nPMMze0NIuWm
Cz6cxVaQU7t9KMRlN71e/bYXa2zWQ/F8Vy1Uhaz8BiYzl7QZXXTc6YdGIKN1mF1U
KYopChBc2glpVDiX8AJiu1qvx2BIShoph+JMUysvVQTgh5c5ZMhTOCfV07t6ou2k
6oFcKuFF383ipeXWtMZdZFtjW/jLz2J6Nx8HJnkJQVcSxrGbLegrKdVSymK9tILq
siZrcNWRr0JFlpP3Z4CPmGihDxRsHOL3dHeRYbZB7PV/Tfh21TnJSw6PzEU5riiF
4k4bIXE+bf49E3PKiLacs+yhzrS4c3VMzgsridNuk/JlQoUFA2cuZ9FWQO41cr++
Z5r3pNnK6UvDenOqLk+kxzidMBzNkkgin7UB9vsTRY9fXS6VggTFpfXjjUHZ/7c4
3dIEqdyvzNmOCOS63+uOOjjYifWwBzIN1Mp+wecjc4O9sBEaPXLLC5DY7a/7rjkP
UdDcQbJZ+2aIQnO8RUW3
=qCZK
-----END PGP SIGNATURE-----

--Sig_/6H0I/LunfTxWHbR2yOmYYMA--
