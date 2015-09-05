From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] mfd: Fixup clients of multi_reg_write/register_patch
Date: Sat, 5 Sep 2015 16:08:06 +0200
Message-ID: <CAMuHMdVST1TjkVSJGfKns_E4SZPyax5hOYuinbr8pY+gQWursw@mail.gmail.com>
References: <20150717143934.4f0ce5d7@canb.auug.org.au>
	<20150717094436.GC21939@opensource.wolfsonmicro.com>
	<20150717103450.GJ11162@sirena.org.uk>
	<20150717140926.GG21939@opensource.wolfsonmicro.com>
	<20150720115935.686b556e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:36700 "EHLO
	mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752082AbbIEOII convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 5 Sep 2015 10:08:08 -0400
In-Reply-To: <20150720115935.686b556e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Nariman Poushin <nariman@opensource.wolfsonmicro.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Richard Fitzgerald <rf@opensource.wolfsonmicro.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

On Mon, Jul 20, 2015 at 3:59 AM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> On Fri, 17 Jul 2015 15:09:26 +0100 Nariman Poushin <nariman@opensourc=
e.wolfsonmicro.com> wrote:
>> Introduced by:
>> commit 8019ff6cfc04
>> ("regmap: Use reg_sequence for multi_reg_write / register_patch")
>>
>> Interacting with:
>> commit 561629755a21 ("mfd: arizona: Add support for WM8998 and WM181=
4")
>> commit 81207880cef2 ("mfd: wm5110: Add register patch for rev E and =
above")
>>
>> Signed-off-by: Nariman Poushin <nariman@opensource.wolfsonmicro.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

>> ---
>>  drivers/mfd/wm5110-tables.c | 2 +-
>>  drivers/mfd/wm8998-tables.c | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> I will apply both these patches as merge fix patches in linux-next
> today.  Thanks.

7 weeks later, the fix is still in -next only, hidden in:

commit 203903b3383c2dc8bcommit 203903b3383c2dc8b79277061341ec1c31ea75e3
Merge: f7ef70b70ccf13a9 90b1f7f5d2016031
Author: Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Thu Sep 3 12:39:52 2015 +1000

    Merge remote-tracking branch 'regmap/for-next'

Worse, the problem is now in Linus' tree:

drivers/mfd/wm5110-tables.c: In function =E2=80=98wm5110_patch=E2=80=99=
:
drivers/mfd/wm5110-tables.c:281: warning: passing argument 2 of
=E2=80=98regmap_register_patch=E2=80=99 from incompatible pointer type
drivers/mfd/wm8998-tables.c: In function =E2=80=98wm8998_patch=E2=80=99=
:
drivers/mfd/wm8998-tables.c:50: warning: passing argument 2 of
=E2=80=98regmap_register_patch=E2=80=99 from incompatible pointer type

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
