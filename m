From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH -next] ARC: Fix earlycon build breakage
Date: Wed, 4 Feb 2015 05:15:59 +0000
Message-ID: <C2D7FE5348E1B147BCA15975FBA2307565BCF75F@IN01WEMBXA.internal.synopsys.com>
References: <1423012132-9149-1-git-send-email-peter@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from us01smtprelay-2.synopsys.com ([198.182.60.111]:49336 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750826AbbBDFQS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Feb 2015 00:16:18 -0500
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Hurley <peter@hurleysoftware.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Guenter Roeck <linux@roeck-us.net>

On Wednesday 04 February 2015 06:39 AM, Peter Hurley wrote:
> Commit ffb7fcd66f14 ("ARC: Dynamically determine BASE_BAUD from DeviceTree")
> breaks arc:defconfig build:
>
>        drivers/built-in.o: In function `of_setup_earlycon':
>        (.init.text+0xb3e): undefined reference to `arc_early_base_baud'
>        drivers/built-in.o: In function `setup_earlycon':
>        (.init.text+0xcd0): undefined reference to `arc_early_base_baud'
>        make: *** [vmlinux] Error 1
>
> BASE_BAUD is only required for earlycon, which should depend on
> CONFIG_SERIAL_EARLYCON.
>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Peter Hurley <peter@hurleysoftware.com>

/Me slaps myself  :-(
Thx for the quick fix Peter. Now applied to my for-next and also quickly tested on
simulator.

FWIW, the issue came about because defconfig doesn't use the 8250 uart driver,
rather the legacy arc uart which still uses earlycon - but I still can't fathom
why i didn't see it earlier.

Thx,
-Vineet

> ---
>  arch/arc/kernel/devtree.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arc/kernel/devtree.c b/arch/arc/kernel/devtree.c
> index 5036d4c..e32b54a 100644
> --- a/arch/arc/kernel/devtree.c
> +++ b/arch/arc/kernel/devtree.c
> @@ -17,7 +17,7 @@
>  #include <asm/clk.h>
>  #include <asm/mach_desc.h>
>  
> -#ifdef CONFIG_SERIAL_8250_CONSOLE
> +#ifdef CONFIG_SERIAL_EARLYCON
>  
>  static unsigned int __initdata arc_base_baud;
>  
