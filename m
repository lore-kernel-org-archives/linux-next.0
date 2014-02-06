From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: randconfig build error with next-20140206, in
 drivers/hwmon/ltc2945.c
Date: Thu, 6 Feb 2014 09:03:56 -0800
Message-ID: <20140206170356.GB25071@roeck-us.net>
References: <CA+r1ZhgB-DpgshX24HmzuqZPQr5wsueg4GYACy-669RmTL4xRA@mail.gmail.com>
 <52F39718.9070205@roeck-us.net>
 <CAP=VYLrOBrkgnmC818a-Ke_UkDBsgMjbTx3WBZ2wqqPOmFMrCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f67.google.com ([209.85.220.67]:61650 "EHLO
	mail-pa0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752882AbaBFRD5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Feb 2014 12:03:57 -0500
Content-Disposition: inline
In-Reply-To: <CAP=VYLrOBrkgnmC818a-Ke_UkDBsgMjbTx3WBZ2wqqPOmFMrCQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, jdelvare@suse.de, lm-sensors@lm-sensors.org

On Thu, Feb 06, 2014 at 10:07:20AM -0500, Paul Gortmaker wrote:
> On Thu, Feb 6, 2014 at 9:07 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> > On 02/06/2014 05:57 AM, Jim Davis wrote:
> >>
> >> Building with the attached random configuration file,
> >>
> >> drivers/built-in.o: In function `ltc2945_set_value':
> >> ltc2945.c:(.text+0x58b1ad): undefined reference to `__udivdi3'
> >> ltc2945.c:(.text+0x58b1cc): undefined reference to `__udivdi3'
> >> ltc2945.c:(.text+0x58b1dd): undefined reference to `__udivdi3'
> >> ltc2945.c:(.text+0x58b1fb): undefined reference to `__udivdi3'
> >> make: *** [vmlinux] Error 1
> >>
> >
> > I really love those auto-builders :-)
> >
> > Should be fixed in the next version of -next.
> 
> Looks like the same problem cropped up in mips allmodconfig, but
> w/o the nice pointer to the line number in the source...
> 
>   CC [M]  lib/notifier-error-inject.o
>   CC [M]  lib/pm-notifier-error-inject.o
> ERROR: "__udivdi3" [drivers/hwmon/ltc2945.ko] undefined!
> make[2]: *** [__modpost] Error 1
> make[1]: *** [modules] Error 2
> make: *** [sub-make] Error 2
> 

Yeah, having 64 bit divides in 32 bit builds just isn't a good idea.

Something is wrong with my auto-build scripts ... they should catch
that kind of problem before it hits -next. I'll need to get that fixed.

Guenter
