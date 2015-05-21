From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the imx-mxs tree with the arm-soc tree
Date: Thu, 21 May 2015 10:58:56 +1000
Message-ID: <20150521105856.1a076b4a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6hro4B1g.5BJzbTBm6b5zNc"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33693 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753060AbbEUA7E (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 May 2015 20:59:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shawn Guo <shawn.guo@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, Anson Huang <b20788@freescale.com>, Frank Li <Frank.Li@freescale.com>

--Sig_/6hro4B1g.5BJzbTBm6b5zNc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

Today's linux-next merge of the imx-mxs tree got a conflict in
arch/arm/mach-imx/Kconfig between commit 8064887e02fd ("ARM: vf610:
enable Cortex-M4 configuration on Vybrid SoC") from the arm-soc tree
and commit aff62955b27b ("ARM: imx: add msl support for imx7d") from
the imx-mxs tree.

I fixed it up (hopefully - see below) and can carry the fix as
necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mach-imx/Kconfig
index 2e3c45832674,b8e05379311e..000000000000
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@@ -582,24 -548,17 +548,31 @@@ config SOC_IMX6S
  	help
  	  This enables support for Freescale i.MX6 SoloX processor.
 =20
+ config SOC_IMX7D
+ 	bool "i.MX7 Dual support"
+ 	select PINCTRL_IMX7D
+ 	select ARM_GIC
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

--Sig_/6hro4B1g.5BJzbTBm6b5zNc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVXS3VAAoJEMDTa8Ir7ZwVct4P/37R/iv3byc2xGYaxrXDhcft
qGQyjqqIi+re6UwHg7SV+p5nZ1Zh7gwndGYjx84paFfye7pvnp3yFjv03DL0+nIB
17zETycPT5oNnfwOBuI48wZzKxIaSsoo6iUE+dOU7CW26hTvDQP1U11W3KwtkLA0
GiZ7k6F9lATQ5lAjnFR9Fv6raOIHBNs8TnXq/I7vldQ34V9MycwIBh2svi+dyyd5
qEnX95HYrWazd1qwsiuh25tBA6SmwI7zwvWVk80DBee2sPVfazIIAbyeFHK5pyAv
8/ZrMUUCpKtonsWjKJpZuuljZppiWPDrTPsQmwo49wtNejXRll2s/S36TO+7LUwv
Z9cDuQFyXKEwSKOVUudAyg6hBSps36UI1xR+R33H3yUAl+cWTBDom6dC+cDKtoMi
8ZdAowy67ywP88+xXLGwvhkuzkkxQUN2lR/yPPooGKjO67C0nq16vwG1Wfq/CKS8
KcbrwRb4OEfeUe8ebF7Tjw7eZ3Z/r1VVviDdgCFxaNIer8+Y0wnCu3h1YrpBE6OG
tzl5BAkswS6tD1RnLaE6fLcq4I2HOKzU95y7/dagS6wNkQOfZpHVm1oz3TpZRylp
q17JWC+332zb+G3mbjkCjUzxBq08bDNByvR3NWUmqRFvuJLPUy3RcQPw+0+JQTC7
dy1E3prJif+si5/T9xKj
=ipyl
-----END PGP SIGNATURE-----

--Sig_/6hro4B1g.5BJzbTBm6b5zNc--
