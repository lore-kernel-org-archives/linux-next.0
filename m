From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the arm-soc tree
Date: Tue, 4 Oct 2011 09:40:12 +0200
Message-ID: <201110040940.12876.arnd@arndb.de>
References: <20111004112623.aa04e959d29cb19af8053739@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:53106 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754574Ab1JDHk1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Oct 2011 03:40:27 -0400
In-Reply-To: <20111004112623.aa04e959d29cb19af8053739@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>, stable@kernel.org

On Tuesday 04 October 2011, Stephen Rothwell wrote:
> After merging the arm-soc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: "clk_enable" [drivers/misc/atmel_pwm.ko] undefined!
> ERROR: "clk_disable" [drivers/misc/atmel_pwm.ko] undefined!
> ERROR: "clk_put" [drivers/misc/atmel_pwm.ko] undefined!
> ERROR: "clk_get_rate" [drivers/misc/atmel_pwm.ko] undefined!
> ERROR: "clk_get" [drivers/misc/atmel_pwm.ko] undefined!
> 
> Caused by commit 9dccc010c816 ("ARM: at91: remove dependency for Atmel
> PWM driver selector in Kconfig").
> 
> I have used the arm-soc tree from next-20110930 for today.

Ah, thanks for tracking this down. I actually noticed the same
problem on an ARM build but did not realize it was from one of
the patches I had jut put in there myself.

I'm really glad I didn't send this to Linus cc:stable yet then.
Nicolas, in my randconfig branch, I've fixed this by adding

	depends on HAVE_CLK

which I think is the right solution. I'll replace your patch
with one that does this if you don't mind.

I'd also remove the stable tag for this patch, because it can
have unintended side-effects on other architectures.

	Arnd
