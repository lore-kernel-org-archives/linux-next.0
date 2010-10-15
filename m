From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: manual merge of the spi tree with the tegra tree
Date: Thu, 14 Oct 2010 21:15:22 -0600
Message-ID: <AANLkTi=UUdTixPq63U8UZ9r2M9ez4E8_3hFMnC95_B4X@mail.gmail.com>
References: <20101015132534.f95d5a42.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:43371 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754603Ab0JODPn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 Oct 2010 23:15:43 -0400
In-Reply-To: <20101015132534.f95d5a42.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Erik Gilling <konkers@android.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Masayuki Ohtake <masa-korg@dsn.okisemi.com>

On Thu, Oct 14, 2010 at 8:25 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Grant,
>
> Today's linux-next merge of the spi tree got a conflict in
> drivers/spi/Kconfig drivers/spi/Makefile between commit
> f4fe02ee997ac4dca9d0888d1d1b8ceb29aae7d6 ("spi: add spi_tegra driver"=
)
> from the tegra tree and commit e8b17b5b3f30252b5470dbbf54bc251ddc7fac=
17
> ("spi/topcliff: Add topcliff platform controller hub (PCH) spi bus
> driver") from the spi tree.
>
> Just overlapping additions. =A0I fixed it up (see below) and can carr=
y the
> fix as necessary.

Thanks Stephen.  Yes, please carry the fix for the time being.

g.

> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
>
> diff --cc drivers/spi/Kconfig
> index b806078,9949c25..0000000
> --- a/drivers/spi/Kconfig
> +++ b/drivers/spi/Kconfig
> @@@ -314,13 -313,13 +329,20 @@@ config SPI_STMP3XX
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0SPI driver for Freescale STMP37xx/378x SoC SSP int=
erface
>
> =A0+config SPI_TEGRA
> =A0+ =A0 =A0 =A0tristate "Nvidia Tegra SPI controller"
> =A0+ =A0 =A0 =A0depends on ARCH_TEGRA
> =A0+ =A0 =A0 =A0select TEGRA_SYSTEM_DMA
> =A0+ =A0 =A0 =A0help
> =A0+ =A0 =A0 =A0 =A0SPI driver for NVidia Tegra SoCs
> =A0+
> + config SPI_TOPCLIFF_PCH
> + =A0 =A0 =A0 tristate "Topcliff PCH SPI Controller"
> + =A0 =A0 =A0 depends on PCI
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 SPI driver for the Topcliff PCH (Platform Controlle=
r Hub) SPI bus
> + =A0 =A0 =A0 =A0 used in some x86 embedded processors.
> +
> =A0config SPI_TXX9
> =A0 =A0 =A0 =A0tristate "Toshiba TXx9 SPI controller"
> =A0 =A0 =A0 =A0depends on GENERIC_GPIO && CPU_TX49XX
> diff --cc drivers/spi/Makefile
> index b6573d8,557aaad..0000000
> --- a/drivers/spi/Makefile
> +++ b/drivers/spi/Makefile
> @@@ -39,7 -39,7 +39,8 @@@ obj-$(CONFIG_SPI_PPC4xx) =A0 =A0 =A0 =A0 =A0=
 =A0 =A0+=3D spi_ppc4xx
> =A0obj-$(CONFIG_SPI_S3C24XX_GPIO) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D=
 spi_s3c24xx_gpio.o
> =A0obj-$(CONFIG_SPI_S3C24XX) =A0 =A0 =A0 =A0 =A0 =A0 +=3D spi_s3c24xx=
_hw.o
> =A0obj-$(CONFIG_SPI_S3C64XX) =A0 =A0 =A0 =A0 =A0 =A0 +=3D spi_s3c64xx=
=2Eo
> =A0+obj-$(CONFIG_SPI_TEGRA) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 +=3D spi_tegra.o
> + obj-$(CONFIG_SPI_TOPCLIFF_PCH) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D =
spi_topcliff_pch.o
> =A0obj-$(CONFIG_SPI_TXX9) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0+=3D spi_txx9.o
> =A0obj-$(CONFIG_SPI_XILINX) =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D xilinx_sp=
i.o
> =A0obj-$(CONFIG_SPI_XILINX_OF) =A0 =A0 =A0 =A0 =A0 +=3D xilinx_spi_of=
=2Eo
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
