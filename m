From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: Tree for Jan 30 (clk related WARNING on arm)
Date: Sun, 1 Feb 2015 10:23:29 +0100
Message-ID: <CAMuHMdV64QF=WNxOgFn3mzpSCrA8amr6wrWQJFaZsUYozTVW=Q@mail.gmail.com>
References: <20150130180209.2bd86cc4@canb.auug.org.au>
	<20150130190709.GA13943@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:34812 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751491AbbBAJXa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 1 Feb 2015 04:23:30 -0500
In-Reply-To: <20150130190709.GA13943@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>

On Fri, Jan 30, 2015 at 8:07 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Fri, Jan 30, 2015 at 06:02:09PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20150129:
>>
>> The arm-soc gained conflicts against the arm-current and arm trees.
>>
>> The spi tree gained a build failure for which I reverted a commit.
>>
>> Non-merge commits (relative to Linus' tree): 6300
>>  6348 files changed, 255117 insertions(+), 131620 deletions(-)
>>
>> ----------------------------------------------------------------------------
>>
> I see the following runtime warning repeatedly (with different call
> paths to vexpress_osc_round_rate) with my qemu vexpress test.
>
> Bisect points to commit cb75a8fcd14e71 ("clk: Add rate constraints to clocks").
>
> Guenter
>
> ---
> WARNING: CPU: 0 PID: 1 at drivers/clk/versatile/clk-vexpress-osc.c:47
> vexpress_osc_round_rate+0x58/0x64()

See also the thread started at
http://www.spinics.net/lists/linux-doc/msg28017.html

Will try the patch after FOSDEM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
