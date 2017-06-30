From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: build warning after merge of the pinctrl tree
Date: Fri, 30 Jun 2017 08:59:37 +0200
Message-ID: <CAMuHMdVHkg3vs9XVthMoZzyV37KgNcWBj9RN3s6XATY3Eux0qw@mail.gmail.com>
References: <20170630145601.441b4994@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170630145601.441b4994@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Fri, Jun 30, 2017 at 6:56 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> After merging the pinctrl tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> drivers/pinctrl/pinctrl-rza1.c: In function 'rza1_pinctrl_probe':
> drivers/pinctrl/pinctrl-rza1.c:1260:5: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   if (ret)
>      ^
>
> Introduced by commit
>
>   5a49b644b307 ("pinctrl: Renesas RZ/A1 pin and gpio controller")

Doh, 0day doesn't use compilers that report uninitialized variables?
Patch sent.

Thanks for reporting!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
