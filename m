From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build warnings after merge of the rtc tree
Date: Tue, 31 May 2016 23:42:24 +0200
Message-ID: <13174805.K2ejzuCglS@wuerfel>
References: <20160531125213.20d3eaa2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:65518 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752896AbcEaVl7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 31 May 2016 17:41:59 -0400
In-Reply-To: <20160531125213.20d3eaa2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tuesday, May 31, 2016 12:52:13 PM CEST Stephen Rothwell wrote:
> Hi Alexandre,
> 
> After merging the rtc tree, today's linux-next build (x86_64 allmodconfig)
> produced these warnings:
> 
> In file included from drivers/char/mwave/smapi.c:51:0:
> drivers/char/mwave/smapi.h:52:0: warning: "TRUE" redefined
>  #define TRUE 1
>  ^
> In file included from include/acpi/acpi.h:58:0,
>                  from include/linux/acpi.h:33,
>                  from include/linux/mc146818rtc.h:21,
>                  from drivers/char/mwave/smapi.c:50:
> include/acpi/actypes.h:438:0: note: this is the location of the previous definition
>  #define TRUE                            (1 == 1)
>  ^
> In file included from drivers/char/mwave/smapi.c:51:0:
> drivers/char/mwave/smapi.h:53:0: warning: "FALSE" redefined
>  #define FALSE 0
>  ^
> In file included from include/acpi/acpi.h:58:0,
>                  from include/linux/acpi.h:33,
>                  from include/linux/mc146818rtc.h:21,
>                  from drivers/char/mwave/smapi.c:50:
> include/acpi/actypes.h:433:0: note: this is the location of the previous definition
>  #define FALSE                           (1 == 0)
>  ^

Thanks for the report!

> Introduced by commit
> 
>   fd09cc80165c ("rtc: cmos: move mc146818rtc code out of asm-generic/rtc.h")
> 
> Why the hell do we have any definitions of TRUE and FALSE, anyway?
> There are a few more (I counted 4 in header files before stopping).

I've seen variations of the problem before, so when it showed up now,
I didn't think it had anything to do with my patches, sorry for not
catching it earlier.

> Hmmm, those 2 static inline functions in include/linux/mc146818rtc.h
> that reference ACPI stuff are probably to big to be inline and in a header
> file anyway, right?

They certainly are, I just couldn't come up with an obvious place
for them to go. They used to be part of asm-generic/rtc.h, which is now
gone.

An easy workaround would be to change the mwave driver to use the normal
bool type instead of its own, and that's basically a good idea regardless
of what else we do. I've submitted a patch for this.

Regarding where to put the two functions if not in the header, I looked
at the existing callers:

arch/alpha/kernel/rtc.c:        mc146818_get_time(tm);
arch/alpha/kernel/rtc.c:        return mc146818_set_time(tm);
arch/mn10300/kernel/rtc.c:      mc146818_set_time(&tm);
arch/x86/kernel/hpet.c:         mc146818_set_time(&curr_time);
arch/x86/kernel/rtc.c:          retval = mc146818_set_time(&tm);
drivers/base/power/trace.c:     mc146818_set_time(&time);
drivers/base/power/trace.c:     mc146818_get_time(&time);
drivers/rtc/rtc-cmos.c: mc146818_get_time(t);
drivers/rtc/rtc-cmos.c: return mc146818_set_time(t);

For x86, this is really easy, we can just put it into drivers/rtc/ like we
do for rtc-lib.c. This includes drivers/base/power/trace.c, which is x86
specific.

However, alpha does not always set CONFIG_RTC_LIB or CONFIG_RTC_CLASS, so
we'd have to change that first. As mentioned, this is probably a good idea,
as the CONFIG_RTC driver doesn't work reliably on some Alpha machines.

The main tricky bit is mn10300, which doesn't use RTC_LIB at all and which
does not even work with RTC_DRV_CMOS, only CONFIG_RTC, so we never enter
drivers/rtc there. We could either try to change that and use RTC_DRV_CMOS
there, or duplicate the mc146818_get_time() function on mn10300.

	Arnd
