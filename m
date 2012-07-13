From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the i2c-embedded
 tree
Date: Fri, 13 Jul 2012 13:03:51 +0200
Message-ID: <50000097.9010902@linaro.org>
References: <20120710164130.f38e4d1673f925ddb13914c9@canb.auug.org.au> <20120712131231.GH2194@pengutronix.de> <201207121554.03240.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:64817 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030437Ab2GMLD4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Jul 2012 07:03:56 -0400
Received: by eaak11 with SMTP id k11so1023034eaa.19
        for <linux-next@vger.kernel.org>; Fri, 13 Jul 2012 04:03:54 -0700 (PDT)
In-Reply-To: <201207121554.03240.arnd@arndb.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Wolfram Sang <w.sang@pengutronix.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alessandro Rubini <rubini@gnudd.com>, Linus Walleij <linus.walleij@stericsson.com>, Samuel Ortiz <sameo@linux.intel.com>

>> They look like they mostly export register settings which is usually
>> questionable since we might want to abstract bindings so they can be
>> useful for a number of drivers.

I'm not exactly sure what you mean by this. These bindings are specific=
=20
to the ST-Ericsson driver and are localised, hence the 'stericsson,'=20
vendor prefix. If you think other drivers might be able to make use of=20
them then we can make them official i2c bindings and drop the 'stericss=
on,'.

>> Arnd, since you committed the patches, can you please comment? I'd
>> prefer to drop this DT conversion for now, otherwise we might have t=
o
>> support this possibly rushed bindings forever? LinusW, what do you
>> think?

We would never have to support them forever. Even if they were deemed t=
o=20
be incorrect, or some other vendors wanted to use the same bindings, we=
=20
would just send a patch fixing them.

> I've dropped the ux500/dt branch for now. and will wait for a new one
> to get submitted as a replacement. There were other things wrong with
> the submission that Lee already knows about, so I think it's better
> to do this the proper way now.

Okay, I've pulled the i2c patches out. I'll re-send the pull-request=20
(less the i2c stuff) when we have an Ack from Sam on the AB8500=20
documentation patch.

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
M: +44 77 88 633 515
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
