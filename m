From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH next 2/2] MAINTAINERS: Update PXA2xx/PXA3xx SUPPORT patterns
Date: Wed, 6 Jul 2011 18:34:39 -0600
Message-ID: <CACxGe6sMP5zzhWd9RCNxqrY2MhMDEmpZmq4-P+HF_cgY4yj22Q@mail.gmail.com>
References: <e9742e1fca57477517fdb6ea110221d6292eed9c.1309997525.git.joe@perches.com>
 <e5bfdcabc4041d24277a2453ecc2690072cfdacf.1309997525.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:47417 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754091Ab1GGAe7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Jul 2011 20:34:59 -0400
In-Reply-To: <e5bfdcabc4041d24277a2453ecc2690072cfdacf.1309997525.git.joe@perches.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>, Wan ZongShun <mcuos.com@gmail.com>, Eric Miao <eric.y.miao@gmail.com>, Russell King <linux@arm.linux.org.uk>

On Wed, Jul 6, 2011 at 6:28 PM, Joe Perches <joe@perches.com> wrote:
> commit ca632f556697 ("spi: reorganize drivers")
> renamed the files, update the MAINTAINERS patterns.
>
> cc: Grant Likely <grant.likely@secretlab.ca>
> cc: Nicolas Ferre <nicolas.ferre@atmel.com>
> cc: Wan ZongShun <mcuos.com@gmail.com>
> cc: Eric Miao <eric.y.miao@gmail.com>
> cc: Russell King <linux@arm.linux.org.uk>
>
> Signed-off-by: Joe Perches <joe@perches.com>

Acked-by: Grant Likely <grant.likely@secretlab.ca>

> ---
> =A0MAINTAINERS | =A0 =A06 +++---
> =A01 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0ad8ff0..4e5cc19 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1123,7 +1123,7 @@ F: =A0 =A0 =A0 =A0drivers/watchdog/nuc900_wdt.c
> =A0F: =A0 =A0 drivers/net/arm/w90p910_ether.c
> =A0F: =A0 =A0 drivers/mtd/nand/nuc900_nand.c
> =A0F: =A0 =A0 drivers/rtc/rtc-nuc900.c
> -F: =A0 =A0 drivers/spi/spi_nuc900.c
> +F: =A0 =A0 drivers/spi/spi-nuc900.c
> =A0F: =A0 =A0 drivers/usb/host/ehci-w90x900.c
> =A0F: =A0 =A0 drivers/video/nuc900fb.c
>
> @@ -1321,7 +1321,7 @@ F: =A0 =A0 =A0 =A0drivers/net/macb.*
> =A0ATMEL SPI DRIVER
> =A0M: =A0 =A0 Nicolas Ferre <nicolas.ferre@atmel.com>
> =A0S: =A0 =A0 Supported
> -F: =A0 =A0 drivers/spi/atmel_spi.*
> +F: =A0 =A0 drivers/spi/spi-atmel.c
>
> =A0ATMEL USBA UDC DRIVER
> =A0M: =A0 =A0 Nicolas Ferre <nicolas.ferre@atmel.com>
> @@ -5142,7 +5142,7 @@ L: =A0 =A0 =A0 =A0linux-arm-kernel@lists.infrad=
ead.org (moderated for non-subscribers)
> =A0S: =A0 =A0 Maintained
> =A0F: =A0 =A0 arch/arm/mach-pxa/
> =A0F: =A0 =A0 drivers/pcmcia/pxa2xx*
> -F: =A0 =A0 drivers/spi/pxa2xx*
> +F: =A0 =A0 drivers/spi/spi-pxa2xx*
> =A0F: =A0 =A0 drivers/usb/gadget/pxa2*
> =A0F: =A0 =A0 include/sound/pxa2xx-lib.h
> =A0F: =A0 =A0 sound/arm/pxa*
> --
> 1.7.6.131.g99019
>
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
