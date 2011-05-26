From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [git pull] gpio changes for $NEXT_KERNEL
Date: Thu, 26 May 2011 12:12:53 -0600
Message-ID: <BANLkTinqX9k0K2b3MLudZUVuWWiYp5nDWg@mail.gmail.com>
References: <BANLkTi=S2quduA7-8Emqw7vE0J1eto6bgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:63301 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757802Ab1EZSNN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 May 2011 14:13:13 -0400
Received: by pzk9 with SMTP id 9so417126pzk.19
        for <linux-next@vger.kernel.org>; Thu, 26 May 2011 11:13:13 -0700 (PDT)
In-Reply-To: <BANLkTi=S2quduA7-8Emqw7vE0J1eto6bgA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>

And on that note,

Stephen, can you please add the gpio/next branch to linux-next for toni=
ght?

Thanks,
g.

On Thu, May 26, 2011 at 12:12 PM, Grant Likely
<grant.likely@secretlab.ca> wrote:
> Hi Linus,
>
> Due to my own stupidity, this branch as /not/ been tested through
> linux-next. =A0I put it in a branch that I negelcted to ask Stephen t=
o
> include. =A0:-( =A0I'm asking him to add it for tonight. =A0At the ve=
ry
> least, it has been build tested on various x86, powerpc, mips, sparc
> and arm defconfigs.
>
> You'll probably want to hold off on actually pulling this one, but I
> wanted to give you a heads up that I have it still pending. =A0If you=
've
> not picked it up, then I can resend the pull req tomorrow afternoon
> after confirming it hasn't messed up anything in linux-next.
>
> There's nothing earth shattering here. =A0Just a bunch of driver upda=
tes
> and some faltering steps towards unifying a bunch of the mmio gpio
> logic.
>
> g.
>
> The following changes since commit 4db70f73e56961b9bcdfd0c36c62847a18=
b7dbb5:
>
> =A0tmpfs: fix XATTR N overriding POSIX_ACL Y (2011-05-25 19:53:02 -07=
00)
>
> are available in the git repository at:
> =A0git://git.secretlab.ca/git/linux-2.6 gpio/next
>
> Erik Bot=F6 (1):
> =A0 =A0 =A0gpio/pca953x: Use handle_simple_irq instead of handle_edge=
_irq
>
> H Hartley Sweeten (1):
> =A0 =A0 =A0gpio: remove redundant Kconfig depends on GPIOLIB
>
> Jamie Iles (9):
> =A0 =A0 =A0basic_mmio_gpio: remove runtime width/endianness evaluatio=
n
> =A0 =A0 =A0basic_mmio_gpio: convert to platform_{get,set}_drvdata()
> =A0 =A0 =A0basic_mmio_gpio: allow overriding number of gpio
> =A0 =A0 =A0basic_mmio_gpio: request register regions
> =A0 =A0 =A0basic_mmio_gpio: detect output method at probe time
> =A0 =A0 =A0basic_mmio_gpio: support different input/output registers
> =A0 =A0 =A0basic_mmio_gpio: support direction registers
> =A0 =A0 =A0basic_mmio_gpio: convert to non-__raw* accessors
> =A0 =A0 =A0basic_mmio_gpio: split into a gpio library and platform de=
vice
>
> Jean Delvare (1):
> =A0 =A0 =A0gpiolib: export gpiochip_find
>
> Linus Walleij (2):
> =A0 =A0 =A0gpio: remove some legacy comments in build files
> =A0 =A0 =A0gpio/via: rename VIA local config struct
>
> Uwe Kleine-K=F6nig (1):
> =A0 =A0 =A0gpio: add trace events for setting direction and value
>
> =A0drivers/gpio/Kconfig =A0 =A0 =A0 =A0 =A0 =A0| =A0 23 +-
> =A0drivers/gpio/Makefile =A0 =A0 =A0 =A0 =A0 | =A0 =A07 +-
> =A0drivers/gpio/basic_mmio_gpio.c =A0| =A0517 +++++++++++++++++++++++=
++++++----------
> =A0drivers/gpio/gpiolib.c =A0 =A0 =A0 =A0 =A0| =A0 19 ++-
> =A0drivers/gpio/pca953x.c =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0drivers/video/via/via-gpio.c =A0 =A0| =A0 49 ++--
> =A0include/linux/basic_mmio_gpio.h | =A0 56 +++++
> =A0include/trace/events/gpio.h =A0 =A0 | =A0 56 +++++
> =A08 files changed, 555 insertions(+), 174 deletions(-)
> =A0create mode 100644 include/trace/events/gpio.h
>
>
> --
> Grant Likely, B.Sc., P.Eng.
> Secret Lab Technologies Ltd.
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
