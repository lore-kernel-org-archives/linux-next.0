From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: triage for March 14, 2012
Date: Thu, 15 Mar 2012 09:00:50 +0100
Message-ID: <CAMuHMdV45SBg+cm0+x07SfvY-xpjqb_ZVznn-vD=70G1YZXnFw@mail.gmail.com>
References: <20120314233926.GA22887@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:62267 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755917Ab2COIAw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Mar 2012 04:00:52 -0400
In-Reply-To: <20120314233926.GA22887@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Mar 15, 2012 at 00:39, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> New breakage since last report:

Seems you missed two new failures for m68k/allmodconfig:

include/linux/mmc/core.h:128:20: error: field 'completion' has incomple=
te type
make[4]: *** [drivers/mmc/card/mmc_test.o] Error 1

drivers/staging/android/persistent_ram.c:457:2: error: implicit
declaration of function 'memblock_reserve'
[-Werror=3Dimplicit-function-declaration]
cc1: some warnings being treated as errors
make[4]: *** [drivers/staging/android/persistent_ram.o] Error 1

> m68k:allmodconfig
>       when:   Mar 9, 00:38
>       why:    ERROR: "__udivdi3" [drivers/media/dvb/frontends/rtl2830=
=2Eko] undefined!

This seems to be fixed, unless it doesn't get that far anymore.

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
