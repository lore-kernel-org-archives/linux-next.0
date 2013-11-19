From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: Tree for Nov 19 (mfd/as3722)
Date: Tue, 19 Nov 2013 19:38:09 +0000
Message-ID: <20131119193809.GD19953@lee--X1>
References: <20131119143954.74186994a2e977f244ac95e0@canb.auug.org.au>
 <528B9F03.6040601@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:61001 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751521Ab3KSTiP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Nov 2013 14:38:15 -0500
Received: by mail-oa0-f44.google.com with SMTP id m1so1271360oag.31
        for <linux-next@vger.kernel.org>; Tue, 19 Nov 2013 11:38:14 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <528B9F03.6040601@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Florian Lobmaier <florian.lobmaier@ams.com>, Laxman Dewangan <ldewangan@nvidia.com>

On Tue, 19 Nov 2013, Randy Dunlap wrote:

> On 11/18/13 19:39, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Please do *not* add any v3.14 material to linux-next until after
> > v3.13-rc1 is released.
> >=20
> > Changes since 20131118:
> >=20
>=20
> on i386:
>=20
> when CONFIG_I2C=3Dm
> (a.k.a. the dangers of having a bool depend on a tristate)
>=20
> drivers/built-in.o: In function `as3722_i2c_probe':
> as3722.c:(.text+0x41456): undefined reference to `devm_regmap_init_i2=
c'
> drivers/built-in.o: In function `as3722_i2c_driver_init':
> as3722.c:(.init.text+0x1b5d): undefined reference to `i2c_register_dr=
iver'
> drivers/built-in.o: In function `as3722_i2c_driver_exit':
> as3722.c:(.exit.text+0x41e): undefined reference to `i2c_del_driver'

I accepted a patch which fixes this yesterday and intended to send post=
 -rc1.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
