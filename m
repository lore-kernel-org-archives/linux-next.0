From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: next-20130627 breaks i.MX6 sabre sd UART console
Date: Fri, 28 Jun 2013 14:09:28 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1306281403530.4013@ionos.tec.linutronix.de>
References: <F7C43F8B2814514CA05F3436BC68046EF1EB72@039-SN2MPN1-013.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:45879 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751236Ab3F1MJ2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 28 Jun 2013 08:09:28 -0400
In-Reply-To: <F7C43F8B2814514CA05F3436BC68046EF1EB72@039-SN2MPN1-013.039d.mgd.msft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stehle Vincent-B46079 <B46079@freescale.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, John Stultz <john.stultz@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@codeaurora.org>

On Thu, 27 Jun 2013, Stehle Vincent-B46079 wrote:

Cc'ed Mark and Stephen.

> FYI I remark that today's Linux next 'next-20130627' breaks i.MX6
> sabre sd UART console with ARM config imx_v6_v7_defconfig.
> This was working fine yesterday with 'next-20130626'.
> 
> Bisecting gave me this commit:
> 
>   064706514ec3fea740c2656e03c4f01f6a551ac4 clocksource: Add generic
> dummy timer driver
> 
> If I revert it I do indeed get the boot messages on the UART console
> again, but the kernel then crashes in wm8962_probe(). So there is
> more to find out...
