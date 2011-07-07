From: Michael Hennerich <michael.hennerich@analog.com>
Subject: Re: [PATCH next 1/2] MAINTAINERS: Update GPIO sections patterns
Date: Thu, 7 Jul 2011 09:19:59 +0200
Message-ID: <4E155E1F.7030609@analog.com>
References: <e9742e1fca57477517fdb6ea110221d6292eed9c.1309997525.git.joe@perches.com>
Reply-To: <michael.hennerich@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]:43865 "EHLO
	TX2EHSOBE002.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750900Ab1GGHVj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Jul 2011 03:21:39 -0400
In-Reply-To: <e9742e1fca57477517fdb6ea110221d6292eed9c.1309997525.git.joe@perches.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Michael Buesch <mb@bu3sch.de>, "device-drivers-devel@blackfin.uclinux.org" <device-drivers-devel@blackfin.uclinux.org>

On 07/07/2011 02:28 AM, Joe Perches wrote:
> commit c103de24043 ("gpio: reorganize drivers")
> renamed the files, update the patterns.
>
> cc: Grant Likely<grant.likely@secretlab.ca>
> cc: Michael Hennerich<michael.hennerich@analog.com>
> cc: Michael Buesch<mb@bu3sch.de>
>
> Signed-off-by: Joe Perches<joe@perches.com>
Acked-by: Michael Hennerich <michael.hennerich@analog.com>
> ---
>   MAINTAINERS |    8 ++++----
>   1 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 657fabe..0ad8ff0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -343,7 +343,7 @@ S:	Supported
>   F:	drivers/mfd/adp5520.c
>   F:	drivers/video/backlight/adp5520_bl.c
>   F:	drivers/leds/leds-adp5520.c
> -F:	drivers/gpio/adp5520-gpio.c
> +F:	drivers/gpio/gpio-adp5520.c
>   F:	drivers/input/keyboard/adp5520-keys.c
>
>   ADP5588 QWERTY KEYPAD AND IO EXPANDER DRIVER (ADP5588/ADP5587)
> @@ -352,7 +352,7 @@ L:	device-drivers-devel@blackfin.uclinux.org
>   W:	http://wiki.analog.com/ADP5588
>   S:	Supported
>   F:	drivers/input/keyboard/adp5588-keys.c
> -F:	drivers/gpio/adp5588-gpio.c
> +F:	drivers/gpio/gpio-adp5588.c
>
>   ADP8860 BACKLIGHT DRIVER (ADP8860/ADP8861/ADP8863)
>   M:	Michael Hennerich<michael.hennerich@analog.com>
> @@ -1587,11 +1587,11 @@ S:	Maintained
>   F:	Documentation/sound/alsa/Bt87x.txt
>   F:	sound/pci/bt87x.c
>
> -BT8XXGPIO DRIVER
> +BT8XX GPIO DRIVER
>   M:	Michael Buesch<mb@bu3sch.de>
>   W:	http://bu3sch.de/btgpio.php
>   S:	Maintained
> -F:	drivers/gpio/bt8xxgpio.c
> +F:	drivers/gpio/gpio-bt8xx.c
>
>   BTRFS FILE SYSTEM
>   M:	Chris Mason<chris.mason@oracle.com>


-- 
Greetings,
Michael

--
Analog Devices GmbH      Wilhelm-Wagenfeld-Str. 6      80807 Muenchen
Sitz der Gesellschaft: Muenchen; Registergericht: Muenchen HRB 40368;
Geschaeftsfuehrer:Dr.Carsten Suckrow, Thomas Wessel, William A. Martin,
Margaret Seif
