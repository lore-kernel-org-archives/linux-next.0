From: Jonathan Woithe <jwoithe@physics.adelaide.edu.au>
Subject: Re: [PATCH -next] fujitsu-laptop: depends on INPUT
Date: Thu, 26 Jun 2008 14:05:36 +0930 (CST)
Message-ID: <200806260435.m5Q4ZadJ009415@turbo.physics.adelaide.edu.au>
References: <20080623093449.b4f19f85.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20080623093449.b4f19f85.randy.dunlap@oracle.com> from "Randy Dunlap" at Jun 23, 2008 09:34:49 AM
Sender: linux-acpi-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: jwoithe@physics.adelaide.edu.au, linux-acpi@vger.kernel.org, linux-next@vger.kernel.org, akpm <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> fujitsu-laptop uses input_* functions, so it should depend
> on INPUT.
:
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> ---
>  drivers/misc/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20080623.orig/drivers/misc/Kconfig
> +++ linux-next-20080623/drivers/misc/Kconfig
> @@ -179,6 +179,7 @@ config FUJITSU_LAPTOP
>          tristate "Fujitsu Laptop Extras"
>          depends on X86
>          depends on ACPI
> +        depends on INPUT
>          depends on BACKLIGHT_CLASS_DEVICE
>          ---help---
>  	  This is a driver for laptops built by Fujitsu:

Ack.

jonathan
