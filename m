From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Fri, 22 Aug 2014 20:09:20 +0100
Message-ID: <20140822190920.GX4266@lee--X1>
References: <20140823025616.690f0c83@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f179.google.com ([209.85.223.179]:65263 "EHLO
	mail-ie0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750831AbaHVTJZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 22 Aug 2014 15:09:25 -0400
Received: by mail-ie0-f179.google.com with SMTP id rl12so7034301iec.38
        for <linux-next@vger.kernel.org>; Fri, 22 Aug 2014 12:09:24 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20140823025616.690f0c83@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@linaro.org>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

On Sat, 23 Aug 2014, Stephen Rothwell wrote:

> Hi Lee,
>=20
> After merging the mfd tree, today's linux-next build (x86_64 allmodco=
nfig)
> failed like this:
>=20
> ERROR: "wm8994_base_regmap_config" [drivers/mfd/wm8994-core.ko] undef=
ined!
> ERROR: "wm8994_irq_init" [drivers/mfd/wm8994-core.ko] undefined!
> ERROR: "wm1811_regmap_config" [drivers/mfd/wm8994-core.ko] undefined!
> ERROR: "wm8958_regmap_config" [drivers/mfd/wm8994-core.ko] undefined!
> ERROR: "wm8994_regmap_config" [drivers/mfd/wm8994-core.ko] undefined!
>=20
> Presumably caused by commit a3ee6a4e2729 ("mfd: wm8994: Allow modular
> build").
>=20
> I have used the mfd tree from next-20140822 for today.

I fixed this at 10 o'clock this morning?

When did you pull?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
