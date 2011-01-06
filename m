From: Eric Miao <eric.y.miao@gmail.com>
Subject: Re: linux-next: manual merge of the bjdooks-i2c tree with the arm tree
Date: Thu, 6 Jan 2011 11:29:15 +0800
Message-ID: <AANLkTi=SmAOxTKmP5w-GKbx1mEDAXAJs7Cv58tRV-AOk@mail.gmail.com>
References: <20110106133107.463c3e60.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:42557 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754159Ab1AFD3g convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 Jan 2011 22:29:36 -0500
In-Reply-To: <20110106133107.463c3e60.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Dirk Brandewie <dirk.brandewie@gmail.com>, Marek Vasut <marek.vasut@gmail.com>

On Thu, Jan 6, 2011 at 10:31 AM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Ben,
>
> Today's linux-next merge of the bjdooks-i2c tree got a conflict in
> arch/arm/mach-pxa/pxa27x.c, arch/arm/mach-pxa/pxa3xx.c and
> arch/arm/mach-pxa/trizeps4.c between commit
> ad68bb9f7a3cd47396635a5e3895215af57579da ("ARM: pxa: Access SMEMC via
> virtual addresses") from the arm tree and commit
> 0a56f28ec486273d84d25571573908344aa67176 ("arm/pxa2xx: reorganize I2C
> files") from the bjdooks-i2c tree.
>
> I fixed it up (see below) and can carry the fix as necessary.

Thanks Stephen, that looks sane to me.

> --
> Cheers,
> Stephen Rothwell =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0sfr@canb.auug.org.au
>
> diff --cc arch/arm/mach-pxa/pxa27x.c
> index b2130b7,1c77e89..0000000
> --- a/arch/arm/mach-pxa/pxa27x.c
> +++ b/arch/arm/mach-pxa/pxa27x.c
> @@@ -17,9 -17,8 +17,10 @@@
> =C2=A0#include <linux/suspend.h>
> =C2=A0#include <linux/platform_device.h>
> =C2=A0#include <linux/sysdev.h>
> =C2=A0+#include <linux/io.h>
> + #include <linux/i2c/pxa-i2c.h>
>
> =C2=A0+#include <asm/mach/map.h>
> =C2=A0#include <mach/hardware.h>
> =C2=A0#include <asm/irq.h>
> =C2=A0#include <mach/irqs.h>
> @@@ -29,10 -28,7 +30,8 @@@
> =C2=A0#include <mach/ohci.h>
> =C2=A0#include <mach/pm.h>
> =C2=A0#include <mach/dma.h>
> =C2=A0+#include <mach/smemc.h>
>
> - #include <plat/i2c.h>
> -
> =C2=A0#include "generic.h"
> =C2=A0#include "devices.h"
> =C2=A0#include "clock.h"
> diff --cc arch/arm/mach-pxa/pxa3xx.c
> index e14818f,c9d9729..0000000
> --- a/arch/arm/mach-pxa/pxa3xx.c
> +++ b/arch/arm/mach-pxa/pxa3xx.c
> @@@ -21,8 -21,8 +21,9 @@@
> =C2=A0#include <linux/irq.h>
> =C2=A0#include <linux/io.h>
> =C2=A0#include <linux/sysdev.h>
> + #include <linux/i2c/pxa-i2c.h>
>
> =C2=A0+#include <asm/mach/map.h>
> =C2=A0#include <mach/hardware.h>
> =C2=A0#include <mach/gpio.h>
> =C2=A0#include <mach/pxa3xx-regs.h>
> @@@ -31,8 -31,6 +32,7 @@@
> =C2=A0#include <mach/pm.h>
> =C2=A0#include <mach/dma.h>
> =C2=A0#include <mach/regs-intc.h>
> =C2=A0+#include <mach/smemc.h>
> - #include <plat/i2c.h>
>
> =C2=A0#include "generic.h"
> =C2=A0#include "devices.h"
> diff --cc arch/arm/mach-pxa/trizeps4.c
> index 43fc9ca,995e671..0000000
> --- a/arch/arm/mach-pxa/trizeps4.c
> +++ b/arch/arm/mach-pxa/trizeps4.c
> @@@ -47,8 -47,6 +47,7 @@@
> =C2=A0#include <mach/mmc.h>
> =C2=A0#include <mach/irda.h>
> =C2=A0#include <mach/ohci.h>
> =C2=A0+#include <mach/smemc.h>
> - #include <plat/i2c.h>
>
> =C2=A0#include "generic.h"
> =C2=A0#include "devices.h"
>
