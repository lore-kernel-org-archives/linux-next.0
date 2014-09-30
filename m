From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH linux-next] clk-gpio-gate: include gpio/consumer to fix build
Date: Tue, 30 Sep 2014 14:27:30 -0700
Message-ID: <20140930212730.19023.54223@quantum>
References: <20140930162635.GA7135@roeck-us.net>
 <1412105803-9954-1-git-send-email-vincent.stehle@laposte.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:64912 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750962AbaI3V14 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Sep 2014 17:27:56 -0400
Received: by mail-pa0-f51.google.com with SMTP id lj1so5436410pab.24
        for <linux-next@vger.kernel.org>; Tue, 30 Sep 2014 14:27:56 -0700 (PDT)
In-Reply-To: <1412105803-9954-1-git-send-email-vincent.stehle@laposte.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, =?utf-8?q?Vincent_Stehl=C3=A9?= <vincent.stehle@laposte.net>, Jyri Sarha <jsarha@ti.com>

Quoting Vincent Stehl=C3=A9 (2014-09-30 12:36:43)
> This fixes the following build error:
>=20
>   drivers/clk/clk-gpio-gate.c: In function =E2=80=98clk_gpio_gate_ena=
ble=E2=80=99:
>   drivers/clk/clk-gpio-gate.c:36:2: error: implicit declaration of fu=
nction =E2=80=98gpiod_set_value=E2=80=99 [-Werror=3Dimplicit-function-d=
eclaration]
>   drivers/clk/clk-gpio-gate.c: In function =E2=80=98clk_gpio_gate_is_=
enabled=E2=80=99:
>   drivers/clk/clk-gpio-gate.c:52:2: error: implicit declaration of fu=
nction =E2=80=98gpiod_get_value=E2=80=99 [-Werror=3Dimplicit-function-d=
eclaration]
>   drivers/clk/clk-gpio-gate.c: In function =E2=80=98clk_register_gpio=
_gate=E2=80=99:
>   drivers/clk/clk-gpio-gate.c:79:2: error: implicit declaration of fu=
nction =E2=80=98gpiod_is_active_low=E2=80=99 [-Werror=3Dimplicit-functi=
on-declaration]
>   drivers/clk/clk-gpio-gate.c:85:3: error: implicit declaration of fu=
nction =E2=80=98desc_to_gpio=E2=80=99 [-Werror=3Dimplicit-function-decl=
aration]
>   drivers/clk/clk-gpio-gate.c:125:2: error: implicit declaration of f=
unction =E2=80=98gpiod_put=E2=80=99 [-Werror=3Dimplicit-function-declar=
ation]
>   drivers/clk/clk-gpio-gate.c: In function =E2=80=98of_clk_gpio_gate_=
delayed_register_get=E2=80=99:
>   drivers/clk/clk-gpio-gate.c:169:2: error: implicit declaration of f=
unction =E2=80=98gpio_to_desc=E2=80=99 [-Werror=3Dimplicit-function-dec=
laration]
>=20
> Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@laposte.net>
> Cc: Jyri Sarha <jsarha@ti.com>
> Cc: Mike Turquette <mturquette@linaro.org>
> ---
>=20
> Hi,
>=20
> This can be seen with e.g. linux next-20140930 and arm alldefconfig.

=46ixed with:

https://git.linaro.org/people/mike.turquette/linux.git/commit/44b4aa97b=
ea84fa8ac179155f147e3483cc7a6e0

Regards,
Mike

>=20
> Best regards,
>=20
> V.
>=20
>  drivers/clk/clk-gpio-gate.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/clk/clk-gpio-gate.c b/drivers/clk/clk-gpio-gate.=
c
> index 9dde885..08e4322 100644
> --- a/drivers/clk/clk-gpio-gate.c
> +++ b/drivers/clk/clk-gpio-gate.c
> @@ -13,6 +13,7 @@
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  #include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/of_gpio.h>
>  #include <linux/err.h>
>  #include <linux/device.h>
> --=20
> 2.1.0
>=20
