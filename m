From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH -next] mtd: fix sbc2_flash build when PCI is not enabled
Date: Mon, 16 Apr 2012 18:20:12 -0400
Message-ID: <CAP=VYLr6TtABMNz1EBY2T6vYdhpR5X6S3yQTtvvqV0D7c9U5Lw@mail.gmail.com>
References: <20120416161121.261ba4e7e38989173accfb16@canb.auug.org.au> <4F8C780D.9010702@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:40610 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751701Ab2DPWUo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Apr 2012 18:20:44 -0400
In-Reply-To: <4F8C780D.9010702@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, Tim Hockin <thockin@sun.com>

On Mon, Apr 16, 2012 at 3:50 PM, Randy Dunlap <rdunlap@xenotime.net> wr=
ote:
> From: Randy Dunlap <rdunlap@xenotime.net>
>
> sbc2_flash.c is a PCI driver, but its build fails when CONFIG_PCI

Minor nit -- above line and subject reference sbc2, when fail comes
from scb2 source module.

Paul.
--

> is not enabled, so make it depend on PCI.
>
> drivers/mtd/maps/scb2_flash.c:237:1: warning: data definition has no =
type or storage class
> drivers/mtd/maps/scb2_flash.c:237:1: warning: type defaults to 'int' =
in declaration of 'module_pci_driver'
> drivers/mtd/maps/scb2_flash.c:237:1: warning: parameter names (withou=
t types) in function declaration
>
> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
> Cc: =A0 =A0 David Woodhouse <dwmw2@infradead.org>
> Cc: =A0 =A0 linux-mtd@lists.infradead.org
> ---
> =A0drivers/mtd/maps/Kconfig | =A0 =A02 +-
> =A01 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20120416.orig/drivers/mtd/maps/Kconfig
> +++ linux-next-20120416/drivers/mtd/maps/Kconfig
> @@ -224,7 +224,7 @@ config MTD_CK804XROM
>
> =A0config MTD_SCB2_FLASH
> =A0 =A0 =A0 =A0tristate "BIOS flash chip on Intel SCB2 boards"
> - =A0 =A0 =A0 depends on X86 && MTD_JEDECPROBE
> + =A0 =A0 =A0 depends on X86 && MTD_JEDECPROBE && PCI
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Support for treating the BIOS flash chip on Intel =
SCB2 boards
> =A0 =A0 =A0 =A0 =A0as an MTD device - with this you can reprogram you=
r BIOS.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
