From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the pinctrl tree
Date: Mon, 16 Jul 2018 09:59:31 +0200
Message-ID: <CAMuHMdVRfEcxo0SVW7VkmE-1bjsESKeL9nRk41W32_2V6rpA-A@mail.gmail.com>
References: <20180716081018.21bfe495@canb.auug.org.au> <CACRpkdZ5BA1wn=TPn4yWkwWd3pAKh9wuMHd9woBF=+6+L1jtFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZ5BA1wn=TPn4yWkwWd3pAKh9wuMHd9woBF=+6+L1jtFA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Linus,

On Mon, Jul 16, 2018 at 9:52 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Jul 16, 2018 at 12:10 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Commits
> >
> >   bc319333c156 ("pinctrl: sh-pfc: r8a77965: Add HSCIF pins, groups, and functions")
> >   99500c6a4836 ("pinctrl: sh-pfc: r8a77990: Revise USB ID pin name")
> >   3d3c62d3458a ("pinctrl: sh-pfc: r8a77990: Add USB2.0 pins, groups and functions")
> >   1e0f13198edf ("pinctrl: sh-pfc: r8a77990: Add USB3.0 pins, groups and functions")
> >
> > are missing a Signed-off-by from their committer.
>
> I am looking at this and I just feel confused. Top to bottom:

> commit bc319333c156a710891942d34560b9fca0f52f5d
> Author: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Date:   Thu Dec 14 13:04:55 2017 +0900
>
>     pinctrl: sh-pfc: r8a77965: Add HSCIF pins, groups, and functions
>
>     This patch adds HSCIF{0,1,2,3,4} pins, groups and functions to
>     the R8A77965 SoC.
>
>     Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>     Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> This is very confusing, it looks correct to me.
>
> As usual it must be some minor syntactic thing like a character missing or
> something, I am just soo.... what's wrong here, really?

The previous issue was a missing commit from the _author_, not committer.
As you rebased the branch, _you_ are now the committer, not me anymore.
So now your SoBs must be present, too.

As I already told you I had fixed up the author SoB, and updated the tag,
just drop the above commits, pull sh-pfc-for-v4.19-tag1 again, and be done
with it ;-)

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
