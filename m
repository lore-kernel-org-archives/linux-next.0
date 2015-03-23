From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with the arm-perf tree
Date: Mon, 23 Mar 2015 11:33:18 +1100
Message-ID: <20150323113318.0319c248@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NVnJnAiNxBUvnOKKnNesIXh"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Will Deacon <will.deacon@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Suzuki K. Poulose" <suzuki.poulose@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-next.vger.kernel.org

--Sig_/NVnJnAiNxBUvnOKKnNesIXh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in
drivers/bus/Kconfig between commit c9966c98697a ("arm-cci: Split the
code for PMU vs driver support") from the arm-perf tree and commit
13fbf3c8d0f7 ("drivers: bus: Sort Kconfig entries alphabetically") from
the arm-soc tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/bus/Kconfig
index 79e297b1f221,7e9c2674af81..000000000000
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@@ -4,6 -4,21 +4,38 @@@
 =20
  menu "Bus devices"
 =20
 -config ARM_CCI
 -	bool "ARM CCI driver support"
++config ARM_CCI400_PORT_CTRL
++	bool
+ 	depends on ARM && OF && CPU_V7
++	select ARM_CCI400_COMMON
+ 	help
 -	  Driver supporting the CCI cache coherent interconnect for ARM
 -	  platforms.
++	  Low level power management driver for CCI400 cache coherent
++	  interconnect for ARM platforms.
++
++config ARM_CCI400_PMU
++	bool "ARM CCI400 PMU support"
++	default y
++	depends on ARM || ARM64
++	depends on HW_PERF_EVENTS
++	select ARM_CCI400_COMMON
++	help
++	  Support for PMU events monitoring on the ARM CCI cache coherent
++	  interconnect.
++
++	  If unsure, say Y
++
++config ARM_CCI400_COMMON
++	bool
++	select ARM_CCI
+=20
+ config ARM_CCN
+ 	bool "ARM CCN driver support"
+ 	depends on ARM || ARM64
+ 	depends on PERF_EVENTS
+ 	help
+ 	  PMU (perf) driver supporting the ARM CCN (Cache Coherent Network)
+ 	  interconnect.
+=20
  config BRCMSTB_GISB_ARB
  	bool "Broadcom STB GISB bus arbiter"
  	depends on ARM || MIPS

--Sig_/NVnJnAiNxBUvnOKKnNesIXh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVD19SAAoJEMDTa8Ir7ZwV394P+QH48Ax6U2Zs0cl/JtaYN0wY
t88ty31JMZa8wnN+fI3tpGuQtHNjVH8p/sH4xr45Cnlzr6zLllw+niflWSXdzJ3u
naWo0zEoIfy9m7o6JQoOdHcl8CEci8TDqQ5IQdkqv5UuVh4HhiUAoqKWySIaRXxC
HqMuVA0KcTq3RLPW257hFxfAZlSrMTaQaAqvzvrlnbMfN152tJhn0i2VypfNBDuQ
4CIStRplQDe06JXQvoYR4gHCSc5GW2vMeMXSQgJMTtNj7WoMLlyT9TJuBOsgBpSp
9oXr7heyeOlMdRfhFvTZY96yW2HeU48L2YJGHn2GUlUYXYO/FaQdOTKtfBsAWSkW
mLR+clPPnAKi6+xnPSGc3jnvNon12sP3K+HdjSOPwP7FL/ot33ryulVyFVEgwIQo
k97A1zADj03MNeBCCM1zcKAIrV5+ecyUbCPFBgGSJqxs2ZWky3zCyP32W/8EYDWW
q+WwLHzl1TylcCnYotX8jL+fQq3mJ4WGQP7rlNsokC4k2iPMM4X5nevycBOTIXBE
/eUEtyooL4kHRUk1W2ORJ3tzp9XPpT0wmISkYKWJ2y98DpyJWMpqh0lYDchW+3Fu
I2BoJ8m3EofvKKAj7TNTAncfvq2eRxWRHyoHZDGcKnkekNnduTBF3KgbhwOj0YOB
6UsYfY2seV/r8qJsR6rA
=NUGg
-----END PGP SIGNATURE-----

--Sig_/NVnJnAiNxBUvnOKKnNesIXh--
