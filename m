From: Jean Delvare <khali@linux-fr.org>
Subject: Re: [PATCH] max6875: should depend on I2C
Date: Mon, 4 May 2009 12:48:02 +0200
Message-ID: <20090504124802.13e56a44@hyperion.delvare>
References: <1241430586-31878-1-git-send-email-a.beregalov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:9140 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751567AbZEDKsK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 May 2009 06:48:10 -0400
In-Reply-To: <1241430586-31878-1-git-send-email-a.beregalov@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: linux-next@vger.kernel.org, w.sang@pengutronix.de

Hi Alexander,

On Mon,  4 May 2009 13:49:46 +0400, Alexander Beregalov wrote:
> Fix this build error:
> drivers/built-in.o: In function `max6875_remove':
> max6875.c:(.text+0x6bdda): undefined reference to `i2c_unregister_device'
> 
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
> ---
>  drivers/misc/eeprom/Kconfig |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/misc/eeprom/Kconfig b/drivers/misc/eeprom/Kconfig
> index e23f0ec..9118613 100644
> --- a/drivers/misc/eeprom/Kconfig
> +++ b/drivers/misc/eeprom/Kconfig
> @@ -50,7 +50,7 @@ config EEPROM_LEGACY
>  
>  config EEPROM_MAX6875
>  	tristate "Maxim MAX6874/5 power supply supervisor"
> -	depends on EXPERIMENTAL
> +	depends on I2C && EXPERIMENTAL
>  	help
>  	  If you say yes here you get read-only support for the user EEPROM of
>  	  the Maxim MAX6874/5 EEPROM-programmable, quad power-supply

Good catch! I've folded this fix into
i2c/i2c-chips-move-max6875-to-drivers-misc-eeprom.patch, thanks for
reporting.

-- 
Jean Delvare
