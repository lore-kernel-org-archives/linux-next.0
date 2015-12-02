From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the mvebu tree with the arm-soc tree
Date: Wed, 2 Dec 2015 11:18:29 +0000
Message-ID: <20151202111829.GE1929@sirena.org.uk>
References: <20151202111244.b7ee49ee06b4a95e407e740d@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gfkS+pgRssjg/Rwm"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57501 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756004AbbLBLSl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2015 06:18:41 -0500
Content-Disposition: inline
In-Reply-To: <20151202111244.b7ee49ee06b4a95e407e740d@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Cooper <jason@lakedaemon.net>, andrew@lunn.ch, gregory.clement@free-electrons.com, arnd@arndb.de, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


--gfkS+pgRssjg/Rwm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 02, 2015 at 11:12:44AM +0000, Mark Brown wrote:
> Hi all,
>=20
> Today's linux-next merge of the mvebu tree got a conflict in  between com=
mit
> 377524dc4d77f50e ("ARM: mmp: move into ARCH_MULTIPLATFORM") from the arm-=
soc
> tree and commit 5f4423af9dd17 ("ARM: orion: multiplatform support") from =
the
> mvebu tree.

Ccing in Arnd since I forgot to do that.

>=20
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
>=20
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 5a328472bd8c..882f5f33bc7d 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -490,46 +490,6 @@ config ARCH_IXP4XX
>  	help
>  	  Support for Intel's IXP4XX (XScale) family of processors.
> =20
> -config ARCH_DOVE
> -	bool "Marvell Dove"
> -	select ARCH_REQUIRE_GPIOLIB
> -	select CPU_PJ4
> -	select GENERIC_CLOCKEVENTS
> -	select MIGHT_HAVE_PCI
> -	select MVEBU_MBUS
> -	select PINCTRL
> -	select PINCTRL_DOVE
> -	select PLAT_ORION_LEGACY
> -	help
> -	  Support for the Marvell Dove SoC 88AP510
> -
> -config ARCH_MV78XX0
> -	bool "Marvell MV78xx0"
> -	select ARCH_REQUIRE_GPIOLIB
> -	select CPU_FEROCEON
> -	select GENERIC_CLOCKEVENTS
> -	select MVEBU_MBUS
> -	select PCI
> -	select PLAT_ORION_LEGACY
> -	help
> -	  Support for the following Marvell MV78xx0 series SoCs:
> -	  MV781x0, MV782x0.
> -
> -config ARCH_ORION5X
> -	bool "Marvell Orion"
> -	depends on MMU
> -	select ARCH_REQUIRE_GPIOLIB
> -	select CPU_FEROCEON
> -	select GENERIC_CLOCKEVENTS
> -	select MVEBU_MBUS
> -	select PCI
> -	select PLAT_ORION_LEGACY
> -	select MULTI_IRQ_HANDLER
> -	help
> -	  Support for the following Marvell Orion 5x series SoCs:
> -	  Orion-1 (5181), Orion-VoIP (5181L), Orion-NAS (5182),
> -	  Orion-2 (5281), Orion-1-90 (6183).
> -
>  config ARCH_KS8695
>  	bool "Micrel/Kendin KS8695"
>  	select ARCH_REQUIRE_GPIOLIB



--gfkS+pgRssjg/Rwm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWXtOEAAoJECTWi3JdVIfQMO4H/RI/N9N2HpBwjYGXxCUCEleH
WNS7hw3hdMayWZFiOBcfOCNskyfj7WauZmGY8hhSlBeYl5CTgFtWSfOP/1PW68Ow
MU8yhYrRkBAqimVkqwpUPomB40GB2bBoXktuFO0LADH0JNaDi0y4kYYrE1x6FaLF
yRjIfL5JGDTgz51AOgH6op+yYrAjFLyntbZZAb6hVEQYdklpX8j4MRYk7+JzAo0X
8vskjBINO24WeC4rg+gvA+FfdLub+2SHWPQvW9LE3pL1BP3YPk7r7X5/dASK8GWN
RSU8F86RMIwQh1Hqi+ZjIcq/vZ5fTRKgp2e4JED1+GKdYW4BjQcKFj64kukR4sw=
=DtPv
-----END PGP SIGNATURE-----

--gfkS+pgRssjg/Rwm--
