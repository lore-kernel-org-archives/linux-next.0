From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next not booting on snowball
Date: Wed, 14 Dec 2011 09:38:04 +0100
Message-ID: <CACRpkdZwPTUPdE2XT+aHNvWZW22Ohb3xxHKVQ8H-UaBxumLBvQ@mail.gmail.com>
References: <4ED79454.1090304@linaro.org>
	<20111201145801.GB2103@sirena.org.uk>
	<4ED79E9F.7060103@linaro.org>
	<alpine.LFD.2.02.1112011400380.2357@xanadu.home>
	<4ED8087F.7030507@linaro.org>
	<alpine.LFD.2.02.1112011856310.2357@xanadu.home>
	<4ED90B6F.6050205@linaro.org>
	<alpine.LFD.2.02.1112062227120.2907@xanadu.home>
	<CACRpkdaJUNap3498-cORbW77EBT-4_pyxeLQahn4g3UOhHm3bg@mail.gmail.com>
	<CACRpkda_EzSbYAmeXQz1XjwKLfmV6JiDcC=4+4HiABWRVg2UPw@mail.gmail.com>
	<20111214082718.GC3072@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:38520 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754686Ab1LNIiE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Dec 2011 03:38:04 -0500
Received: by iaeh11 with SMTP id h11so912169iae.19
        for <linux-next@vger.kernel.org>; Wed, 14 Dec 2011 00:38:04 -0800 (PST)
In-Reply-To: <20111214082718.GC3072@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Lists Linaro-dev <linaro-dev@lists.linaro.org>, Stephen Warren <swarren@nvidia.com>, Kevin Hilman <khilman@ti.com>, Jamie Iles <jamie@jamieiles.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Srinidhi KASAGAR <srinidhi.kasagar@stericsson.com>, Rabin VINCENT <rabin.vincent@stericsson.com>

On Wed, Dec 14, 2011 at 9:27 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Wed, Dec 14, 2011 at 09:24:33AM +0100, Linus Walleij wrote:
>
>> The above remaps and reads from some random ROM page to get
>> the ASIC ID is actually not screwing things up. Right now.
>
> The ASIC ID reads are also done by Samsung platforms which boot fine -
> it's not strictly good but it happens to work (and has done for some
> considerable time).

Yes some chicken and egg problem here to some extent :-/

What would be elegant is some readl_early_physical(u32 addr);
that is guaranteed to set up a temporary mapping, read out that
32-bit word wherever it lives and tear it the map down in a
controlled manner afterwards. We could tag it __init so it
is not abused at runtime.

This could atleast collect these hacks in one place.

Don't know how easy it'd be to achieve that...

Linus Walleij
