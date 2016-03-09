From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: manual merge of the gpio tree with the mfd tree
Date: Wed, 9 Mar 2016 12:35:23 +0700
Message-ID: <20160309053523.GN13692@x1>
References: <20160309143725.412f97b3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160309143725.412f97b3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, "Andrew F. Davis" <afd@ti.com>
List-Id: linux-next.vger.kernel.org

On Wed, 09 Mar 2016, Stephen Rothwell wrote:

> Hi Linus,
>=20
> Today's linux-next merge of the gpio tree got a conflict in:
>=20
>   drivers/gpio/gpio-tps65912.c
>=20
> between commits:
>=20
>   65b6555971d0 ("mfd: tps65912: Remove old driver in preparation for =
new driver")
>   ca801a22f465 ("gpio: tps65912: Add GPIO driver for the TPS65912 PMI=
C")
>=20
> from the mfd tree and commit:
>=20
>   0964ac703edf ("gpio: tps65912: Use devm_gpiochip_add_data() for gpi=
o registration")
>=20
> from the gpio tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary (no acti=
on
> is required).

I sent out a pull-request for this already.

Please pull 'ib-mfd-regulator-gpio-4.6' from my tree.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
