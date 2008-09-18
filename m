From: "Eric Miao" <eric.y.miao@gmail.com>
Subject: Re: linux-next: arm tree build failure
Date: Fri, 19 Sep 2008 02:26:25 +0800
Message-ID: <f17812d70809181126x374b3056ib1fa7aad5475b89@mail.gmail.com>
References: <20080919040901.4a55f305.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gx0-f16.google.com ([209.85.217.16]:41251 "EHLO
	mail-gx0-f16.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754399AbYIRS01 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Sep 2008 14:26:27 -0400
Received: by gxk9 with SMTP id 9so31643739gxk.13
        for <linux-next@vger.kernel.org>; Thu, 18 Sep 2008 11:26:26 -0700 (PDT)
In-Reply-To: <20080919040901.4a55f305.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Russell King <rmk@arm.linux.org.uk>, linux-next@vger.kernel.org

> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 8854dbb..361240a 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -27,6 +27,7 @@ config LCD_CLASS_DEVICE
>  config LCD_CORGI
>        tristate "LCD Panel support for SHARP corgi/spitz model"
>        depends on LCD_CLASS_DEVICE && SPI_MASTER
> +       depends on ARM

I think a "depends on PXA_SHARPSL" would be more precise here.

>        default n
>        help
>          Say y here to support the LCD panels usually found on SHARP
