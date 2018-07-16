From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the pinctrl tree
Date: Mon, 16 Jul 2018 09:52:44 +0200
Message-ID: <CACRpkdZ5BA1wn=TPn4yWkwWd3pAKh9wuMHd9woBF=+6+L1jtFA@mail.gmail.com>
References: <20180716081018.21bfe495@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180716081018.21bfe495@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Jul 16, 2018 at 12:10 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Commits
>
>   bc319333c156 ("pinctrl: sh-pfc: r8a77965: Add HSCIF pins, groups, and functions")
>   99500c6a4836 ("pinctrl: sh-pfc: r8a77990: Revise USB ID pin name")
>   3d3c62d3458a ("pinctrl: sh-pfc: r8a77990: Add USB2.0 pins, groups and functions")
>   1e0f13198edf ("pinctrl: sh-pfc: r8a77990: Add USB3.0 pins, groups and functions")
>
> are missing a Signed-off-by from their committer.

I am looking at this and I just feel confused. Top to bottom:

commit bc319333c156a710891942d34560b9fca0f52f5d
Author: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Date:   Thu Dec 14 13:04:55 2017 +0900

    pinctrl: sh-pfc: r8a77965: Add HSCIF pins, groups, and functions

    This patch adds HSCIF{0,1,2,3,4} pins, groups and functions to
    the R8A77965 SoC.

    Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
    Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

commit 99500c6a48360ebc9083c690add888c17afed519
Author: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Date:   Wed Jun 6 15:43:04 2018 +0900

    pinctrl: sh-pfc: r8a77990: Revise USB ID pin name

    Since the datasheet Rev.1.00 has an error about the USB ID pin name,
    this patch revises it.

    Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
    Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

commit 3d3c62d3458aef24f819834791c364c9f86146c7
Author: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Date:   Wed Jun 6 15:43:05 2018 +0900

    pinctrl: sh-pfc: r8a77990: Add USB2.0 pins, groups and functions

    This patch adds USB0_{PWEN,OVC}_{A,B} and USB0_ID pins, groups and
    functions to the R8A77990 SoC.

    Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
    Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
    Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

commit 1e0f13198edf47d0df1a8c0561eaeb525eac2154
Author: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Date:   Tue Jul 3 19:53:28 2018 +0900

    pinctrl: sh-pfc: r8a77990: Add USB3.0 pins, groups and functions

    This patch adds USB30_{PWEN,OVC} and USB3HS0_ID pins, groups and functions
    to the R8A77990 SoC.

    Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
    Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
    Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

This is very confusing, it looks correct to me.

As usual it must be some minor syntactic thing like a character missing or
something, I am just soo.... what's wrong here, really?

Yours,
Linus Walleij
