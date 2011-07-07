From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH next 1/2] MAINTAINERS: Update GPIO sections patterns
Date: Wed, 6 Jul 2011 18:34:08 -0600
Message-ID: <CACxGe6uRmgWBN0H6hrYBik_q7B2NxP0kny3cpH9xEA5wPZLEtw@mail.gmail.com>
References: <e9742e1fca57477517fdb6ea110221d6292eed9c.1309997525.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:50544 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753666Ab1GGAe3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Jul 2011 20:34:29 -0400
In-Reply-To: <e9742e1fca57477517fdb6ea110221d6292eed9c.1309997525.git.joe@perches.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>, Michael Buesch <mb@bu3sch.de>

On Wed, Jul 6, 2011 at 6:28 PM, Joe Perches <joe@perches.com> wrote:
> commit c103de24043 ("gpio: reorganize drivers")
> renamed the files, update the patterns.
>
> cc: Grant Likely <grant.likely@secretlab.ca>
> cc: Michael Hennerich <michael.hennerich@analog.com>
> cc: Michael Buesch <mb@bu3sch.de>
>
> Signed-off-by: Joe Perches <joe@perches.com>
Acked-by: Grant Likely <grant.likely@secretlab.ca>
> ---
> =A0MAINTAINERS | =A0 =A08 ++++----
> =A01 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 657fabe..0ad8ff0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -343,7 +343,7 @@ S: =A0Supported
> =A0F: =A0 =A0 drivers/mfd/adp5520.c
> =A0F: =A0 =A0 drivers/video/backlight/adp5520_bl.c
> =A0F: =A0 =A0 drivers/leds/leds-adp5520.c
> -F: =A0 =A0 drivers/gpio/adp5520-gpio.c
> +F: =A0 =A0 drivers/gpio/gpio-adp5520.c
> =A0F: =A0 =A0 drivers/input/keyboard/adp5520-keys.c
>
> =A0ADP5588 QWERTY KEYPAD AND IO EXPANDER DRIVER (ADP5588/ADP5587)
> @@ -352,7 +352,7 @@ L: =A0device-drivers-devel@blackfin.uclinux.org
> =A0W: =A0 =A0 http://wiki.analog.com/ADP5588
> =A0S: =A0 =A0 Supported
> =A0F: =A0 =A0 drivers/input/keyboard/adp5588-keys.c
> -F: =A0 =A0 drivers/gpio/adp5588-gpio.c
> +F: =A0 =A0 drivers/gpio/gpio-adp5588.c
>
> =A0ADP8860 BACKLIGHT DRIVER (ADP8860/ADP8861/ADP8863)
> =A0M: =A0 =A0 Michael Hennerich <michael.hennerich@analog.com>
> @@ -1587,11 +1587,11 @@ S: =A0 =A0 =A0Maintained
> =A0F: =A0 =A0 Documentation/sound/alsa/Bt87x.txt
> =A0F: =A0 =A0 sound/pci/bt87x.c
>
> -BT8XXGPIO DRIVER
> +BT8XX GPIO DRIVER
> =A0M: =A0 =A0 Michael Buesch <mb@bu3sch.de>
> =A0W: =A0 =A0 http://bu3sch.de/btgpio.php
> =A0S: =A0 =A0 Maintained
> -F: =A0 =A0 drivers/gpio/bt8xxgpio.c
> +F: =A0 =A0 drivers/gpio/gpio-bt8xx.c
>
> =A0BTRFS FILE SYSTEM
> =A0M: =A0 =A0 Chris Mason <chris.mason@oracle.com>
> --
> 1.7.6.131.g99019
>
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
