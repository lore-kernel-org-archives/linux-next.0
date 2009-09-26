From: Jean Delvare <khali@linux-fr.org>
Subject: Re: [PATCH -next]  i2c: uses/select RT_MUTEXES
Date: Sat, 26 Sep 2009 11:47:40 +0200
Message-ID: <20090926114740.182d8b70@hyperion.delvare>
References: <20090925133830.1ba29584.sfr@canb.auug.org.au>
	<4ABD4213.9010700@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from poutre.nerim.net ([62.4.16.124]:58358 "EHLO poutre.nerim.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751717AbZIZJri (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 26 Sep 2009 05:47:38 -0400
In-Reply-To: <4ABD4213.9010700@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mika Kuoppala <mika.kuoppala@nokia.com>, Peter Ujfalusi <peter.ujfalusi@nokia.com>

Hi Randy,

On Fri, 25 Sep 2009 15:20:03 -0700, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> i2c-core uses rt mutexes, so it needs to select that
> kconfig symbol since there is no prompt for it.
> 
> ERROR: "rt_mutex_lock" [drivers/i2c/i2c-core.ko] undefined!
> ERROR: "__rt_mutex_init" [drivers/i2c/i2c-core.ko] undefined!
> ERROR: "rt_mutex_trylock" [drivers/i2c/i2c-core.ko] undefined!
> ERROR: "rt_mutex_unlock" [drivers/i2c/i2c-core.ko] undefined!
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> ---
>  drivers/i2c/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20090925.orig/drivers/i2c/Kconfig
> +++ linux-next-20090925/drivers/i2c/Kconfig
> @@ -5,6 +5,7 @@
>  menuconfig I2C
>  	tristate "I2C support"
>  	depends on HAS_IOMEM
> +	select RT_MUTEXES
>  	---help---
>  	  I2C (pronounce: I-square-C) is a slow serial bus protocol used in
>  	  many micro controller applications and developed by Philips.  SMBus,

Thanks for the fix, I've folded it into
i2c-prevent-priority-inversion-on-top-of-bus-lock.patch.

-- 
Jean Delvare
