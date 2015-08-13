From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Thu, 13 Aug 2015 09:19:12 +0900
Message-ID: <55CBE280.10905@samsung.com>
References: <20150812181045.0d290caa@canb.auug.org.au>
 <20150812201642.GW9999@pengutronix.de>
 <20150813090248.5fa3441f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20150813090248.5fa3441f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Roger Quadros <rogerq@ti.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On 08/13/2015 08:02 AM, Stephen Rothwell wrote:
> Hi Uwe,
>=20
> On Wed, 12 Aug 2015 22:16:42 +0200 Uwe Kleine-K=C3=B6nig <u.kleine-ko=
enig@pengutronix.de> wrote:
>>
>> On Wed, Aug 12, 2015 at 06:10:45PM +1000, Stephen Rothwell wrote:
>>> After merging the gpio tree, today's linux-next build (powerpc
>>> allyesconfig) failed like this:
>>>
>>> drivers/extcon/extcon-palmas.c:211:25: error: too few arguments to =
function 'devm_gpiod_get_optional'
>>>   palmas_usb->id_gpiod =3D devm_gpiod_get_optional(&pdev->dev, "id"=
);
>>>                          ^
>>> In file included from /home/sfr/next/next/include/asm-generic/gpio.=
h:13:0,
>>>                  from /home/sfr/next/next/include/linux/gpio.h:51,
>>>                  from /home/sfr/next/next/include/linux/of_gpio.h:2=
0,
>>>                  from /home/sfr/next/next/include/linux/mfd/palmas.=
h:24,
>>>                  from /home/sfr/next/next/drivers/extcon/extcon-pal=
mas.c:28:
>>> /home/sfr/next/next/include/linux/gpio/consumer.h:80:32: note: decl=
ared here
>>>  struct gpio_desc *__must_check devm_gpiod_get_optional(struct devi=
ce *dev,
>>>                                 ^
>>>
>>> Caused by commit
>>>
>>>   b17d1bf16cc7 ("gpio: make flags mandatory for gpiod_get functions=
")
>>>
>>> interacting with commit
>>>
>>>   92b7cb5dc885 ("extcon: palmas: Support GPIO based USB ID detectio=
n")
>> that commit is not correct. After
>>
>> 	palmas_usb->id_gpiod =3D devm_gpiod_get_optional(&pdev->dev, "id");
>>
>> it does
>>
>> 	palmas_usb->gpio_id_irq =3D gpiod_to_irq(palmas_usb->id_gpiod);
>>
>> without setting the gpio to input. So the right fix is not to add
>> GPIOD_ASIS but GPIOD_IN.
>=20
> OK, I have fixed my merge fix patch, but can you submit a correct pat=
ch
> to the extcon tree maintainer, please?  I assume it can be fixed in
> that tree right now, right?
>=20

I'll fix it as Uwe comment as following:

--- a/drivers/extcon/extcon-palmas.c
+++ b/drivers/extcon/extcon-palmas.c
@@ -208,7 +208,8 @@ static int palmas_usb_probe(struct platform_device =
*pdev)
                        palmas_usb->wakeup =3D pdata->wakeup;
        }
=20
-       palmas_usb->id_gpiod =3D devm_gpiod_get_optional(&pdev->dev, "i=
d");
+       palmas_usb->id_gpiod =3D
+               devm_gpiod_get_optional(&pdev->dev, "id", GPIOD_IN);
        if (IS_ERR(palmas_usb->id_gpiod)) {
                dev_err(&pdev->dev, "failed to get id gpio\n");
                return PTR_ERR(palmas_usb->id_gpiod);

I'll send it to LKML and apply it on extcon-next tree.

Thanks,
Chanwoo Choi
