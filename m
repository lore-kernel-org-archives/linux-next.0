From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Fix for mmc/core.h completion [was Re: linux-next: triage for March
 14, 2012]
Date: Fri, 16 Mar 2012 10:46:18 -0400
Message-ID: <4F63523A.8090804@windriver.com>
References: <20120314233926.GA22887@windriver.com> <CAMuHMdV45SBg+cm0+x07SfvY-xpjqb_ZVznn-vD=70G1YZXnFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:46752 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964906Ab2CPOqh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 16 Mar 2012 10:46:37 -0400
In-Reply-To: <CAMuHMdV45SBg+cm0+x07SfvY-xpjqb_ZVznn-vD=70G1YZXnFw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Ball <cjb@laptop.org>

On 12-03-15 04:00 AM, Geert Uytterhoeven wrote:
> On Thu, Mar 15, 2012 at 00:39, Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
>> New breakage since last report:
> 
> Seems you missed two new failures for m68k/allmodconfig:
> 
> include/linux/mmc/core.h:128:20: error: field 'completion' has incomplete type
> make[4]: *** [drivers/mmc/card/mmc_test.o] Error 1

The above I've fixed up.  The file obviously needed completion.h but
curious that it only showed up now.  I'm guessing it was masked by
the other errors happening earlier and blocking a full build, since
the device cleanup has been in linux-next for a while.

I've amended this commit in my device-3.4 cleanup tree to add it.

---------
commit 6adab8a8e42d1da155a0ec0c716fa2573e61b0e5
Author: Paul Gortmaker <paul.gortmaker@windriver.com>
Date:   Mon Jan 30 11:46:54 2012 -0500

    device.h: audit and cleanup users in main include dir
    
---------

[Added Chris to CC so he knows he doesn't need to worry about this]

Thanks,
Paul.

> 
> drivers/staging/android/persistent_ram.c:457:2: error: implicit
> declaration of function 'memblock_reserve'
> [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors
> make[4]: *** [drivers/staging/android/persistent_ram.o] Error 1
> 
>> m68k:allmodconfig
>>       when:   Mar 9, 00:38
>>       why:    ERROR: "__udivdi3" [drivers/media/dvb/frontends/rtl2830.ko] undefined!
> 
> This seems to be fixed, unless it doesn't get that far anymore.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
