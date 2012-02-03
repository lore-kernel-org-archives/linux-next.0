From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Fri, 3 Feb 2012 16:18:08 -0700
Message-ID: <CACxGe6uaxKoqKVyVZsaXZ6s-J3urJ7i_SxP2S-6sXQ7ZqXrYFw@mail.gmail.com>
References: <20120203135432.e9ab5f0d41805bff0df10333@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:61657 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755142Ab2BCXS2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Feb 2012 18:18:28 -0500
In-Reply-To: <20120203135432.e9ab5f0d41805bff0df10333@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

On Thu, Feb 2, 2012 at 7:54 PM, Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> Hi Grant,
>
> After merging the gpio tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/i2c/busses/i2c-gpio.c:18:22: fatal error: asm/gpio.h: No such=
 file or directory
> drivers/input/mouse/gpio_mouse.c:17:22: fatal error: asm/gpio.h: No s=
uch file or directory
> drivers/leds/leds-gpio.c:23:22: fatal error: asm/gpio.h: No such file=
 or directory
>
> Caused by commit 4f79dfb562c2 ("gpiolib/arches: Centralise bolierplat=
e
> asm/gpio.h"). =A0Grep is your friend ...
>
> I have used the gpio tree from next-20120202 for today.

I've dropped the patch from my tree.  Looks like there are still a few
drivers that need to be either fixed up or made "depends on
ARCH_HAVE_CUSTOM_GPIO_H".

g.
