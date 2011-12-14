From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next not booting on snowball
Date: Wed, 14 Dec 2011 09:24:33 +0100
Message-ID: <CACRpkda_EzSbYAmeXQz1XjwKLfmV6JiDcC=4+4HiABWRVg2UPw@mail.gmail.com>
References: <4ED79454.1090304@linaro.org>
	<20111201145801.GB2103@sirena.org.uk>
	<4ED79E9F.7060103@linaro.org>
	<alpine.LFD.2.02.1112011400380.2357@xanadu.home>
	<4ED8087F.7030507@linaro.org>
	<alpine.LFD.2.02.1112011856310.2357@xanadu.home>
	<4ED90B6F.6050205@linaro.org>
	<alpine.LFD.2.02.1112062227120.2907@xanadu.home>
	<CACRpkdaJUNap3498-cORbW77EBT-4_pyxeLQahn4g3UOhHm3bg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:58731 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753958Ab1LNIYe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Dec 2011 03:24:34 -0500
Received: by ggdk6 with SMTP id k6so488828ggd.19
        for <linux-next@vger.kernel.org>; Wed, 14 Dec 2011 00:24:33 -0800 (PST)
In-Reply-To: <CACRpkdaJUNap3498-cORbW77EBT-4_pyxeLQahn4g3UOhHm3bg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Lists Linaro-dev <linaro-dev@lists.linaro.org>, Stephen Warren <swarren@nvidia.com>, Kevin Hilman <khilman@ti.com>, Jamie Iles <jamie@jamieiles.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Srinidhi KASAGAR <srinidhi.kasagar@stericsson.com>, Rabin VINCENT <rabin.vincent@stericsson.com>

On Tue, Dec 13, 2011 at 1:35 PM, Linus Walleij <linus.walleij@linaro.or=
g> wrote:
> On Wed, Dec 7, 2011 at 5:09 AM, Nicolas Pitre <nicolas.pitre@linaro.o=
rg> wrote:
>
>>> The kernel hangs at:
>>>
>>> u8500_map_io
>>> =A0-> ux500_map_io
>>> =A0 =A0-> ux500_read_asicid(addr=3D9001dbf4), base=3D9001d000
>>> =A0 =A0 =A0-> =A0readl(__io_address(9001dbf4)=3Df901dbf4);
>
> This code isn't strictly necessary so I moved it out of the way.
>
> Then it hangs on the second iotable_init() call instead.

I found the cause: overlapping iotable entries, sent a separate
patch, check it out...

The above remaps and reads from some random ROM page to get
the ASIC ID is actually not screwing things up. Right now.

Linus Walleij
