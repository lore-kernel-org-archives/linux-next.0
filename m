From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: Tree for Feb 27 (gpio-sodaville.c)
Date: Mon, 27 Feb 2012 17:06:53 -0700
Message-ID: <CACxGe6sFTSu8eznKDecjTj+2fyBXN4_+EM2SaQRSZMmFyonD4w@mail.gmail.com>
References: <20120227182029.545a7db32550ce94c9faffb4@canb.auug.org.au>
 <4F4BC3C5.8040802@xenotime.net> <20120228104047.85b5515f3b27c631580f5503@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:60643 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755311Ab2B1AHN convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Feb 2012 19:07:13 -0500
Received: by obcva7 with SMTP id va7so6135464obc.19
        for <linux-next@vger.kernel.org>; Mon, 27 Feb 2012 16:07:13 -0800 (PST)
In-Reply-To: <20120228104047.85b5515f3b27c631580f5503@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <rdunlap@xenotime.net>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "Hans J. Koch" <hjk@linutronix.de>, Linus Walleij <linus.walleij@stericsson.com>

On Mon, Feb 27, 2012 at 4:40 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> On Mon, 27 Feb 2012 09:56:21 -0800 Randy Dunlap <rdunlap@xenotime.net=
> wrote:
>>
>> on i386:
>>
>> drivers/gpio/gpio-sodaville.c:130:2: error: unknown field 'dt_transl=
ate' specified in initializer
>> drivers/gpio/gpio-sodaville.c:130:2: warning: initialization from in=
compatible pointer type
>> drivers/gpio/gpio-sodaville.c: In function 'sdv_register_irqsupport'=
:
>> drivers/gpio/gpio-sodaville.c:152:8: error: 'struct irq_domain' has =
no member named 'irq_base'
>> drivers/gpio/gpio-sodaville.c:182:2: error: implicit declaration of =
function 'irq_domain_add'
>> drivers/gpio/gpio-sodaville.c: In function 'sdv_gpio_remove':
>> drivers/gpio/gpio-sodaville.c:263:2: error: implicit declaration of =
function 'irq_domain_del'
>
> These are a conflicts between the gio tree and the irqdomain tree.
> Grant, can you supply me with a merge fix patch? =A0Or will you merge=
 the
> irqdomain stuff into the gpio tree (making sure that the irqdomain tr=
ee
> never rebases again) ...

The irqdomain branch has already been made stable for that exact
reason with other trees.  I'll get it fixed up and send out an update.
 I've got 4 hours on a plane tomorrow, so I'll probably crank it out
then.

g.
