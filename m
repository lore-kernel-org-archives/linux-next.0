From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: build failure after merge of the regmap tree
Date: Thu, 15 Dec 2011 11:25:15 -0700
Message-ID: <CACxGe6tfxGToC2ScUdQv7KNu2xdhxA4ZG=Ms=oZZCQ+2A-aiTQ@mail.gmail.com>
References: <C3AE124F08223B42BC95AEB82F0F6CED1F9D0895@KCHJEXMB01.kpit.com> <1323941146.32031.49.camel@dhruva>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:65375 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751366Ab1LOSZh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Dec 2011 13:25:37 -0500
In-Reply-To: <1323941146.32031.49.camel@dhruva>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ashish Jangam <ashish.jangam@kpitcummins.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Dajun <dajun.chen@diasemi.com>

On Thu, Dec 15, 2011 at 2:25 AM, Ashish Jangam
<ashish.jangam@kpitcummins.com> wrote:
> Fixes DA9052 GPIO errors.
>
> This patch is functionally tested on Samsung SMDKV6410.
>
> Signed-off-by: David Dajun Chen <dchen@diasemi.com>
> Signed-off-by: Ashish Jangam <ashish.jangam@kpitcummins.com>
> ---
> =A0drivers/gpio/gpio-da9052.c =A0 =A0 =A0| =A0 37 ++++---------------=
-----------
> =A0include/linux/mfd/da9052/gpio.h | =A0 48 +++++++++++++++++++++++++=
++++++++++++++

gpio-da9052.c is the only users of mfd/da9052/gpio.h.  Why is this
include file needed?  The #defines can simply stay in the .c file.
I've picked up the patch, but modified it to keep the header defines
in the .c file.  If there is a reason this won't work, then please let
me know.

g.

> =A02 files changed, 53 insertions(+), 32 deletions(-)
> =A0create mode 100644 include/linux/mfd/da9052/gpio.h
> diff --git a/drivers/gpio/gpio-da9052.c b/drivers/gpio/gpio-da9052.c
> index 038f5eb..a404ebd 100644
> --- a/drivers/gpio/gpio-da9052.c
> +++ b/drivers/gpio/gpio-da9052.c
> @@ -24,26 +24,6 @@
> =A0#include <linux/mfd/da9052/pdata.h>
> =A0#include <linux/mfd/da9052/gpio.h>
>
> -#define DA9052_INPUT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 1
> -#define DA9052_OUTPUT_OPENDRAIN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A02
> -#define DA9052_OUTPUT_PUSHPULL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 3
> -
> -#define DA9052_SUPPLY_VDD_IO1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00
> -
> -#define DA9052_DEBOUNCING_OFF =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00
> -#define DA9052_DEBOUNCING_ON =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1
> -
> -#define DA9052_OUTPUT_LOWLEVEL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0
> -
> -#define DA9052_ACTIVE_LOW =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
0
> -#define DA9052_ACTIVE_HIGH =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1
> -
> -#define DA9052_GPIO_MAX_PORTS_PER_REGISTER =A0 =A0 8
> -#define DA9052_GPIO_SHIFT_COUNT(no) =A0 =A0 =A0 =A0 =A0 =A0(no%8)
> -#define DA9052_GPIO_MASK_UPPER_NIBBLE =A0 =A0 =A0 =A0 =A00xF0
> -#define DA9052_GPIO_MASK_LOWER_NIBBLE =A0 =A0 =A0 =A0 =A00x0F
> -#define DA9052_GPIO_NIBBLE_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 4
> -
> =A0struct da9052_gpio {
> =A0 =A0 =A0 =A0struct da9052 *da9052;
> =A0 =A0 =A0 =A0struct gpio_chip gp;
> @@ -104,33 +84,26 @@ static int da9052_gpio_get(struct gpio_chip *gc,=
 unsigned offset)
> =A0static void da9052_gpio_set(struct gpio_chip *gc, unsigned offset,=
 int value)
> =A0{
> =A0 =A0 =A0 =A0struct da9052_gpio *gpio =3D to_da9052_gpio(gc);
> - =A0 =A0 =A0 unsigned char register_value =3D 0;
> =A0 =A0 =A0 =A0int ret;
>
> =A0 =A0 =A0 =A0if (da9052_gpio_port_odd(offset)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (value) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 register_value =3D DA90=
52_GPIO_ODD_PORT_MODE;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D da9052_reg_upd=
ate(gpio->da9052, (offset >> 1) +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0DA9052_GPIO_0_1_REG,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0DA9052_GPIO_ODD_PORT_MODE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 register_value);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 value << DA9052_GPIO_ODD_SHIFT);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret !=3D 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_er=
r(gpio->da9052->dev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0"Failed to updated gpio odd reg,%d",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0ret);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0} else {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (value) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 register_value =3D DA90=
52_GPIO_EVEN_PORT_MODE;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D da9052_reg_upd=
ate(gpio->da9052, (offset >> 1) +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0DA9052_GPIO_0_1_REG,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0DA9052_GPIO_EVEN_PORT_MODE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 register_value);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 value << DA9052_GPIO_EVEN_SHIFT);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret !=3D 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_er=
r(gpio->da9052->dev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0"Failed to updated gpio even reg,%d",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0ret);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0}
> =A0}
>
> @@ -201,9 +174,9 @@ static struct gpio_chip reference_gp __devinitdat=
a =3D {
> =A0 =A0 =A0 =A0.direction_input =3D da9052_gpio_direction_input,
> =A0 =A0 =A0 =A0.direction_output =3D da9052_gpio_direction_output,
> =A0 =A0 =A0 =A0.to_irq =3D da9052_gpio_to_irq,
> - =A0 =A0 =A0 .can_sleep =3D 1;
> - =A0 =A0 =A0 .ngpio =3D 16;
> - =A0 =A0 =A0 .base =3D -1;
> + =A0 =A0 =A0 .can_sleep =3D 1,
> + =A0 =A0 =A0 .ngpio =3D 16,
> + =A0 =A0 =A0 .base =3D -1,
> =A0};
>
> =A0static int __devinit da9052_gpio_probe(struct platform_device *pde=
v)
> diff --git a/include/linux/mfd/da9052/gpio.h b/include/linux/mfd/da90=
52/gpio.h
> new file mode 100644
> index 0000000..c427670
> --- /dev/null
> +++ b/include/linux/mfd/da9052/gpio.h
> @@ -0,0 +1,48 @@
> +/*
> + * GPIO module declarations for DA9052 PMICs.
> + *
> + * Copyright(c) 2011 Dialog Semiconductor Ltd.
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
> + *
> + */
> +
> +#ifndef __LINUX_MFD_DA9052_GPIO_H
> +#define __LINUX_MFD_DA9052_GPIO_H
> +
> +#define DA9052_INPUT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 1
> +#define DA9052_OUTPUT_OPENDRAIN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A02
> +#define DA9052_OUTPUT_PUSHPULL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 3
> +
> +#define DA9052_SUPPLY_VDD_IO1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00
> +
> +#define DA9052_DEBOUNCING_OFF =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00
> +#define DA9052_DEBOUNCING_ON =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1
> +
> +#define DA9052_OUTPUT_LOWLEVEL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0
> +
> +#define DA9052_ACTIVE_LOW =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
0
> +#define DA9052_ACTIVE_HIGH =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1
> +
> +#define DA9052_GPIO_MAX_PORTS_PER_REGISTER =A0 =A0 8
> +#define DA9052_GPIO_SHIFT_COUNT(no) =A0 =A0 =A0 =A0 =A0 =A0(no%8)
> +#define DA9052_GPIO_MASK_UPPER_NIBBLE =A0 =A0 =A0 =A0 =A00xF0
> +#define DA9052_GPIO_MASK_LOWER_NIBBLE =A0 =A0 =A0 =A0 =A00x0F
> +#define DA9052_GPIO_NIBBLE_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 4
> +#define DA9052_IRQ_GPI0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A016
> +#define DA9052_GPIO_ODD_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A07
> +#define DA9052_GPIO_EVEN_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 3
> +
> +#endif /* __LINUX_MFD_DA9052_GPIO_H */
> ---
> On Thu, 2011-12-15 at 14:31 +0530, Ashish Jangam wrote:
>>
>> Hi Mark,
>>
>> After merging the regmap tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> drivers/gpio/gpio-da9052.c:25:35: fatal error: linux/mfd/da9052/gpio=
=2Eh: No such file or directory
>>
>> So, it looks like this would never have built
>> (include/linux/mfd/da9052/gpio.h never existed) but noone ever enabl=
ed
>> CONFIG_PMIC_DA9052 before (which CONFIG_GPIO_DA9052 depends on).
>>
>> drivers/gpio/gpio-da9052.c was added with commit 07bfc9152365 ("GPIO=
:
>> DA9052 GPIO module v3") in v3.1-rc1.
>>
>> I have added this patch for today:
>>
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Thu, 15 Dec 2011 16:59:59 +1100
>> Subject: [PATCH] gpio: disable broken driver
>>
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> ---
>> =A0drivers/gpio/Kconfig | =A0 =A02 +-
>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>> index 79199f4..e338013 100644
>> --- a/drivers/gpio/Kconfig
>> +++ b/drivers/gpio/Kconfig
>> @@ -70,7 +70,7 @@ config GPIO_GENERIC
>>
>> =A0config GPIO_DA9052
>> =A0 =A0 =A0 tristate "Dialog DA9052 GPIO"
>> - =A0 =A0 depends on PMIC_DA9052
>> + =A0 =A0 depends on PMIC_DA9052 && BROKEN
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Say yes here to enable the GPIO driver for the DA905=
2 chip.
>>
>> --
>> 1.7.7.3
>>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
