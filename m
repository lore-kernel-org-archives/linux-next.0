From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the pinctrl tree
Date: Tue, 10 Jul 2018 09:07:20 +0200
Message-ID: <CAMuHMdUr1kX=EX32tY0nGZYeriFG+NkmmEQ=ANeb29nN-gBB0Q@mail.gmail.com>
References: <20180710075439.4a449b3d@canb.auug.org.au> <CACRpkdZrsGzULrNaoaX6bSy6z6o-gshQXrRhzUk=tuFF86shDw@mail.gmail.com>
 <OSBPR01MB22933EFD31CAC8A88CE08EDAD85B0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <OSBPR01MB22933EFD31CAC8A88CE08EDAD85B0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Takeshi Kihara <takeshi.kihara.df@renesas.com>
List-Id: linux-next.vger.kernel.org

Hi Shimoda-san, Linus,

On Tue, Jul 10, 2018 at 3:18 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > -----Original Message-----
> > From: Linus Walleij, Sent: Tuesday, July 10, 2018 7:46 AM
> >
> > Hm must have come from Geert's pull request?
> >
> > (I'm regularly wrong about this so not so certain...)
> >
> > Geert can I fix it the usual way by simply rebasing and
> > adding the right SoB?
>
> I'm very sorry for this trouble.
> When I ported this patch, I dropped the author's Signed-of-by wrongly..
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Thank you!

Since this was the top commit from my last pull request, I've just ammended it,
retagged, and pushed.

Sorry for the trouble.

/me looks into improving checkpatch.pl...

> > On Mon, Jul 9, 2018 at 11:54 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > Commit
> > >
> > >   a742fcf72902 ("pinctrl: sh-pfc: r8a77990: Add USB3.0 pins, groups and functions")
> > >
> > > is missing a Signed-off-by from its author.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
