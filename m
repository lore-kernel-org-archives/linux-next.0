From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: manual merge of the trivial tree with the ux500-core tree
Date: Fri, 29 Apr 2011 09:25:13 +0200
Message-ID: <BANLkTikJ5CVvS+P17T_Mhtqyb29vpDcmvw@mail.gmail.com>
References: <20110429115948.e949234b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:43576 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754475Ab1D2HZO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Apr 2011 03:25:14 -0400
In-Reply-To: <20110429115948.e949234b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>

2011/4/29 Stephen Rothwell <sfr@canb.auug.org.au>:

> Today's linux-next merge of the trivial tree got a conflict in
> arch/arm/mach-u300/gpio.c between commit 4a5a6e2804a3 ("mach-u300:
> rewrite gpio driver, move to drivers/gpio") from the ux500-core tree =
and
> commit b0c3af5ef0d7 ("arm: mach-u300/gpio: Fix mem_region resource si=
ze
> miscalculations") from the trivial tree.
>
> The former removed the file updated by the latter. =A0These updates s=
hould
> be applied to drivers/gpio/u300-gpio.c, now. =A0Joe, maybe you could =
update
> your patch and send it to Linus Walleij.

I rewrote the driver completely so likely it will rather be dropped, bu=
t
please check! I'll be happy to carry any patches.

Yours,
Linus Walleij
