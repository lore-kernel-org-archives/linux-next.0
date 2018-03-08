From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the pinctrl tree
Date: Thu, 8 Mar 2018 08:05:50 +0100
Message-ID: <CAMuHMdX05OjHcTyKXx4o7is2Vpi1ToQeuB-xGkGj-Cx7vOcTrQ@mail.gmail.com>
References: <20180308073921.5c104e74@canb.auug.org.au> <CACRpkdaWd_7QWd7t5i6DvU3_Gu1giR9v2uoqQiLNXVWTPEty8w@mail.gmail.com>
 <20180308113647.75279391@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180308113647.75279391@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Thu, Mar 8, 2018 at 1:36 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Wed, 7 Mar 2018 23:25:48 +0100 Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Wed, Mar 7, 2018 at 9:39 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> > Commit
>> >
>> >   fc08fa6009a0 ("pinctrl: sh-pfc: r8a7795: remove duplicate of CLKOUT pin in pinmux_pins[]")
>> >
>> > is missing a Signed-off-by from its committer.
>>
>> Looping in Geert,
>>
>> I guess this came in through the Renesas PFC pull request.
>>
>> Geert do you prefer that I back it all out so you can send me
>> a new pull request? Or some other solution?
>
> But you are listed as the committer ...

Right, that's the bug fix I had asked Linus to take directly, as a fix
for v4.16.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
