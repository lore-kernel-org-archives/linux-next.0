From: Roger Quadros <rogerq@ti.com>
Subject: Re: randconfig build error with next-20150812, in drivers/extcon/extcon-palmas.c
Date: Thu, 13 Aug 2015 10:09:27 +0300
Message-ID: <55CC42A7.1090806@ti.com>
References: <CA+r1ZhgSAhSaEgWUnJGSXjJdx7WcQOjjP0XHpn930XjG9xE_CQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:35051 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751429AbbHMHJg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Aug 2015 03:09:36 -0400
In-Reply-To: <CA+r1ZhgSAhSaEgWUnJGSXjJdx7WcQOjjP0XHpn930XjG9xE_CQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, myungjoo.ham@samsung.com, cw00.choi@samsung.com

Hi,

On 12/08/15 17:46, Jim Davis wrote:
> Building with the attached random configuration file,
>=20
> warning: (INTEL_SOC_DTS_IOSF_CORE && PUNIT_ATOM_DEBUG) selects
> IOSF_MBI which has unmet direct dependencies (PCI)
>=20
> drivers/extcon/extcon-palmas.c: In function =91palmas_gpio_id_detect=92=
:
> drivers/extcon/extcon-palmas.c:136:2: error: implicit declaration of
> function =91gpiod_get_value_cansleep=92
> [-Werror=3Dimplicit-function-declaration]
>   id =3D gpiod_get_value_cansleep(palmas_usb->id_gpiod);
>   ^
> drivers/extcon/extcon-palmas.c: In function =91palmas_usb_probe=92:
> drivers/extcon/extcon-palmas.c:211:2: error: implicit declaration of
> function =91devm_gpiod_get_optional=92
> [-Werror=3Dimplicit-function-declaration]
>   palmas_usb->id_gpiod =3D devm_gpiod_get_optional(&pdev->dev, "id", =
GPIOD_ASIS);
>   ^
> drivers/extcon/extcon-palmas.c:211:67: error: =91GPIOD_ASIS=92 undecl=
ared
> (first use in this function)
>   palmas_usb->id_gpiod =3D devm_gpiod_get_optional(&pdev->dev, "id", =
GPIOD_ASIS);
>                                                                    ^
> drivers/extcon/extcon-palmas.c:211:67: note: each undeclared
> identifier is reported only once for each function it appears in
> drivers/extcon/extcon-palmas.c:228:3: error: implicit declaration of
> function =91gpiod_set_debounce=92 [-Werror=3Dimplicit-function-declar=
ation]
>    status =3D gpiod_set_debounce(palmas_usb->id_gpiod,
>    ^
> drivers/extcon/extcon-palmas.c:275:3: error: implicit declaration of
> function =91gpiod_to_irq=92 [-Werror=3Dimplicit-function-declaration]
>    palmas_usb->gpio_id_irq =3D gpiod_to_irq(palmas_usb->id_gpiod);
>    ^
>=20
>=20

Thanks for the catch.

This is because extcon-palmas.c doesn't include the header
include/linux/gpio/consumer.h

It will be addressed in the following thread
http://thread.gmane.org/gmane.linux.kernel/2019235

cheers,
-roger
