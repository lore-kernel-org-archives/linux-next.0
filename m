From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the pinctrl tree
Date: Tue, 10 Jul 2018 00:46:09 +0200
Message-ID: <CACRpkdZrsGzULrNaoaX6bSy6z6o-gshQXrRhzUk=tuFF86shDw@mail.gmail.com>
References: <20180710075439.4a449b3d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180710075439.4a449b3d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: linux-next.vger.kernel.org

Hm must have come from Geert's pull request?

(I'm regularly wrong about this so not so certain...)

Geert can I fix it the usual way by simply rebasing and
adding the right SoB?

Yours,
Linus Walleij

On Mon, Jul 9, 2018 at 11:54 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Linus,
>
> Commit
>
>   a742fcf72902 ("pinctrl: sh-pfc: r8a77990: Add USB3.0 pins, groups and functions")
>
> is missing a Signed-off-by from its author.
>
> --
> Cheers,
> Stephen Rothwell
