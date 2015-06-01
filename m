From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the imx-mxs tree with the arm-soc tree
Date: Mon, 1 Jun 2015 10:54:17 +1000
Message-ID: <20150601105417.3c6e4280@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/v0N7XSjEhwKkGR_flqBTADa"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: linux-next.vger.kernel.org

--Sig_/v0N7XSjEhwKkGR_flqBTADa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

Today's linux-next merge of the imx-mxs tree got a conflict in
arch/arm/mach-imx/Kconfig between commit 8064887e02fd ("ARM: vf610:
enable Cortex-M4 configuration on Vybrid SoC") from the arm-soc tree
and commit ef6c578329c7 ("ARM: imx: imx7d requires anatop") from the
imx-mxs tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mach-imx/Kconfig
index 2e3c45832674,5ccc9eae8d89..000000000000
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@@ -1,8 -1,8 +1,8 @@@
  menuconfig ARCH_MXC
 -	bool "Freescale i.MX family" if ARCH_MULTI_V4_V5 || ARCH_MULTI_V6_V7
 +	bool "Freescale i.MX family" if ARCH_MULTI_V4_V5 || ARCH_MULTI_V6_V7 || =
ARM_SINGLE_ARMV7M
  	select ARCH_REQUIRE_GPIOLIB
  	select ARM_CPU_SUSPEND if PM
- 	select CLKSRC_MMIO
+ 	select CLKSRC_IMX_GPT
  	select GENERIC_IRQ_CHIP
  	select PINCTRL
  	select PM_OPP if PM
@@@ -582,24 -548,19 +548,33 @@@ config SOC_IMX6S
  	help
  	  This enables support for Freescale i.MX6 SoloX processor.
 =20
+ config SOC_IMX7D
+ 	bool "i.MX7 Dual support"
+ 	select PINCTRL_IMX7D
+ 	select ARM_GIC
+ 	select HAVE_IMX_ANATOP
+ 	select HAVE_IMX_MMDC
+ 	help
+ 		This enables support for Freescale i.MX7 Dual processor.
+=20
 +config SOC_LS1021A
 +	bool "Freescale LS1021A support"
 +	select ARM_GIC
 +	select HAVE_ARM_ARCH_TIMER
 +	select PCI_DOMAINS if PCI
 +	select ZONE_DMA if ARM_LPAE
 +	help
 +	  This enables support for Freescale LS1021A processor.
 +
 +endif
 +
 +comment "Cortex-A/Cortex-M asymmetric multiprocessing platforms"
 +
 +if ARCH_MULTI_V7 || ARM_SINGLE_ARMV7M
 +
  config SOC_VF610
  	bool "Vybrid Family VF610 support"
 -	select IRQ_DOMAIN_HIERARCHY
 -	select ARM_GIC
 +	select ARM_GIC if ARCH_MULTI_V7
  	select PINCTRL_VF610
  	select PL310_ERRATA_769419 if CACHE_L2X0
  	select SMP_ON_UP if SMP

--Sig_/v0N7XSjEhwKkGR_flqBTADa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVa60/AAoJEMDTa8Ir7ZwVE8oQAJWqPQyxTIIkL28OkfrmXV1s
JHa68T2NP63/eH+KoFGC1ZS/Ew1S2PObtiRGTGrtzbMHfr5w7xyoeNHtPzPghykp
rkDdsuSNB6BHSgnrnaBR99bTw8J8L3HJBL+QvZgJrMYkDsjt06wlDTGX8nK55PdV
2804aWxJ+Fvpa8tmV16vbQR/MBwYMgdpx0ZNQcqee1i/HArfXYAwtRwaaU8m/i/X
j0A/V+VF+BsYGC9GkomxPhemcsvm40SsDC27eTGXHRKEXZB1znkCBQ0n2jqaoh/n
bxxCBEcAif2LhAvPSJ36+wp71Llu2FfZYUYgsoG+3a1km04bDjiZirxhY8PrsjI/
sEZLyBMHQE0OkqFoC4hTh7IjDRmSL8xmXRIpzcbSgadegnFUfeISrRTwHPXqwX2g
4yo2UvyCOHB70X51ztC6NK4+XxOCJU/kJ/mV/0Bn0a/tsAfV+s1fO6IV+l0unzek
fxEymcB7J7fGOjYZU35wxrYyCWfi89BRzTfbA5Ud+UCdOS6l1RkODzr5rz+G8Pus
rlSmdgnVaXWDp1TeH/g8OVpOYw8xaJp3zslaFF3JQCzH3pYRSnjYCHVilF2LjLZl
b012WneNdJlaZsivncIBSuvOU9+X1L2/L8QumDZIzKwmRk+oLZfWo2g1yRWYwtIY
YVWCFFAHBrJF3kdAYbpS
=rwsw
-----END PGP SIGNATURE-----

--Sig_/v0N7XSjEhwKkGR_flqBTADa--
