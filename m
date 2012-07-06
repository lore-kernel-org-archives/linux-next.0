From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: Tree for July 2 (crypto/hifn_795x)
Date: Fri, 6 Jul 2012 22:32:12 +0200
Message-ID: <CAMuHMdVzPVLFozEV_26JtmFjPbgQAy-Eo2A0nMsbWu7pU5+sSg@mail.gmail.com>
References: <20120702172334.2618cae84cc57b4ec5a63ed7@canb.auug.org.au>
	<4FF1CBF2.8060303@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <4FF1CBF2.8060303@xenotime.net>
Sender: linux-crypto-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-crypto@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Jul 2, 2012 at 6:27 PM, Randy Dunlap <rdunlap@xenotime.net> wrote:
> On 07/02/2012 12:23 AM, Stephen Rothwell wrote:
>> Changes since 20120629:
>
> on i386:
>
> ERROR: "__divdi3" [drivers/crypto/hifn_795x.ko] undefined!

Also on ppc6xx_defconfig
http://kisskb.ellerman.id.au/kisskb/buildresult/6650268/

It doesn't happen in mainline, but there were no changes in
drivers/crypto/hifn_795x.c.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
