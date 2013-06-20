From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] clocksource: fix Freescale Vybrid pit timer compilation
Date: Thu, 20 Jun 2013 11:37:26 +0200
Message-ID: <51C2CD56.6080009@linaro.org>
References: <1371719381-19937-1-git-send-email-vincent.stehle@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:47818 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755658Ab3FTJhV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 20 Jun 2013 05:37:21 -0400
Received: by mail-bk0-f46.google.com with SMTP id na10so2760709bkb.19
        for <linux-next@vger.kernel.org>; Thu, 20 Jun 2013 02:37:19 -0700 (PDT)
In-Reply-To: <1371719381-19937-1-git-send-email-vincent.stehle@freescale.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?UTF-8?B?VmluY2VudCBTdGVobMOp?= <vincent.stehle@freescale.com>
Cc: linux-next@vger.kernel.org, Jingchang Lu <b35083@freescale.com>, John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, trivial@kernel.org

On 06/20/2013 11:09 AM, Vincent Stehl=C3=A9 wrote:
> Update sched_clock.h path to fix the following compilation error:
>=20
>   drivers/clocksource/vf_pit_timer.c:15:29: fatal error: asm/sched_cl=
ock.h: No such file or directory
>   compilation terminated.
>=20
> Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@freescale.com>
> Cc: Jingchang Lu <b35083@freescale.com>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: trivial@kernel.org
> ---

Applied in my tree:

https://git.linaro.org/gitweb?p=3Dpeople/dlezcano/clockevents.git;a=3Dc=
ommit;h=3D533bac4630b69e201aed29a2bbf5df595df8d5fa

Thanks
  -- Daniel

> Hi,
>=20
> Compilation of imx_v6_v7_defconfig in linux-next just broke. Here is =
a fix.
>=20
> Best regards,
>=20
> V.
>=20
>=20
>  drivers/clocksource/vf_pit_timer.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clocksource/vf_pit_timer.c b/drivers/clocksource=
/vf_pit_timer.c
> index 598399d..587e020 100644
> --- a/drivers/clocksource/vf_pit_timer.c
> +++ b/drivers/clocksource/vf_pit_timer.c
> @@ -12,7 +12,7 @@
>  #include <linux/clk.h>
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
> -#include <asm/sched_clock.h>
> +#include <linux/sched_clock.h>
> =20
>  /*
>   * Each pit takes 0x10 Bytes register space
>=20


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
