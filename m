From: Eric Miao <eric.y.miao@gmail.com>
Subject: Re: [PATCH next 2/2] MAINTAINERS: Update PXA2xx/PXA3xx SUPPORT patterns
Date: Thu, 7 Jul 2011 16:28:44 +0800
Message-ID: <CAMPhdO_ifW8ivha+_AOo-oNhTMuwGzLrQYP2r-q6iQUp+fb20Q@mail.gmail.com>
References: <e9742e1fca57477517fdb6ea110221d6292eed9c.1309997525.git.joe@perches.com>
 <e5bfdcabc4041d24277a2453ecc2690072cfdacf.1309997525.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:50358 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753784Ab1GGI3F convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Jul 2011 04:29:05 -0400
In-Reply-To: <e5bfdcabc4041d24277a2453ecc2690072cfdacf.1309997525.git.joe@perches.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Nicolas Ferre <nicolas.ferre@atmel.com>, Wan ZongShun <mcuos.com@gmail.com>, Russell King <linux@arm.linux.org.uk>

On Thu, Jul 7, 2011 at 8:28 AM, Joe Perches <joe@perches.com> wrote:
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

Acked-by: Eric Miao <eric.y.miao@gmail.com>

> ---
> =C2=A0MAINTAINERS | =C2=A0 =C2=A06 +++---
> =C2=A01 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0ad8ff0..4e5cc19 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1123,7 +1123,7 @@ F: =C2=A0 =C2=A0 =C2=A0 =C2=A0drivers/watchdog/=
nuc900_wdt.c
> =C2=A0F: =C2=A0 =C2=A0 drivers/net/arm/w90p910_ether.c
> =C2=A0F: =C2=A0 =C2=A0 drivers/mtd/nand/nuc900_nand.c
> =C2=A0F: =C2=A0 =C2=A0 drivers/rtc/rtc-nuc900.c
> -F: =C2=A0 =C2=A0 drivers/spi/spi_nuc900.c
> +F: =C2=A0 =C2=A0 drivers/spi/spi-nuc900.c
> =C2=A0F: =C2=A0 =C2=A0 drivers/usb/host/ehci-w90x900.c
> =C2=A0F: =C2=A0 =C2=A0 drivers/video/nuc900fb.c
>
> @@ -1321,7 +1321,7 @@ F: =C2=A0 =C2=A0 =C2=A0 =C2=A0drivers/net/macb.=
*
> =C2=A0ATMEL SPI DRIVER
> =C2=A0M: =C2=A0 =C2=A0 Nicolas Ferre <nicolas.ferre@atmel.com>
> =C2=A0S: =C2=A0 =C2=A0 Supported
> -F: =C2=A0 =C2=A0 drivers/spi/atmel_spi.*
> +F: =C2=A0 =C2=A0 drivers/spi/spi-atmel.c
>
> =C2=A0ATMEL USBA UDC DRIVER
> =C2=A0M: =C2=A0 =C2=A0 Nicolas Ferre <nicolas.ferre@atmel.com>
> @@ -5142,7 +5142,7 @@ L: =C2=A0 =C2=A0 =C2=A0 =C2=A0linux-arm-kernel@=
lists.infradead.org (moderated for non-subscribers)
> =C2=A0S: =C2=A0 =C2=A0 Maintained
> =C2=A0F: =C2=A0 =C2=A0 arch/arm/mach-pxa/
> =C2=A0F: =C2=A0 =C2=A0 drivers/pcmcia/pxa2xx*
> -F: =C2=A0 =C2=A0 drivers/spi/pxa2xx*
> +F: =C2=A0 =C2=A0 drivers/spi/spi-pxa2xx*
> =C2=A0F: =C2=A0 =C2=A0 drivers/usb/gadget/pxa2*
> =C2=A0F: =C2=A0 =C2=A0 include/sound/pxa2xx-lib.h
> =C2=A0F: =C2=A0 =C2=A0 sound/arm/pxa*
> --
> 1.7.6.131.g99019
>
>
