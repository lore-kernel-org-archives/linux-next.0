From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Thu, 10 May 2012 14:12:51 +0200
Message-ID: <CACRpkdbc3dWpTvsojUvjCitdBMJ6F9U+uhSoJLt3-zFc=azhxw@mail.gmail.com>
References: <20120510143329.4cef3cd78ce5ea55416b1d93@canb.auug.org.au>
	<CACRpkdYsHXnWHvBw6Pt1atvwKP6KYjfu-PwQnL_L7-yW1-4_FA@mail.gmail.com>
	<20120510090910.GD3908@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:40488 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759311Ab2EJMMv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 May 2012 08:12:51 -0400
Received: by yenm10 with SMTP id m10so1372009yen.19
        for <linux-next@vger.kernel.org>; Thu, 10 May 2012 05:12:51 -0700 (PDT)
In-Reply-To: <20120510090910.GD3908@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Ola Lilja <ola.o.lilja@stericsson.com>, Liam Girdwood <lrg@ti.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, May 10, 2012 at 11:09 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Thu, May 10, 2012 at 10:30:50AM +0200, Linus Walleij wrote:
>
>> =A0menuconfig SND_SOC_UX500
>> =A0 =A0 =A0 =A0 tristate "SoC Audio support for Ux500 platform"
>> =A0 =A0 =A0 =A0 depends on SND_SOC
>> + =A0 =A0 =A0 depends on MFD_DB8500_PRCMU
>> =A0 =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Say Y if you want to enable ASoC-sup=
port for
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 any of the Ux500 platforms (e.g. U85=
00).
>
> I applied this (without your signoff as you didn't supply one so it'l=
l
> show up as my patch,

Sorry, Acked-by :-)

>> But it seems it has a wider dependency on some MOP500 board
>> stuff being merged first, which is more of a problem I think, part
>> of that is pending in the Ux500 tree.
>
> If this has a dependency on a particular board the driver is badly
> broken, this is the driver for the SoC I2S controller so it should wo=
rk
> with any board.
>
> That said in terms of applying the change the arch/arm stuff shouldn'=
t
> be an issue - it was just registering devices and clocks. =A0The driv=
er
> won't load until the two trees are merged but that's not an issue, it=
's
> not going to run anyway if we delay applying it.

Yeah let's see if it works, if it breaks again we can just pull it out
and defer it.

Yours,
Linus Walleij
