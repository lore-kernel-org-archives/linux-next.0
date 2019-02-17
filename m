From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: linux-next: Fixes tag needs some work in the pinctrl tree
Date: Sun, 17 Feb 2019 23:27:35 +0100
Message-ID: <CAFBinCCOqBumiAm6hM0MhVwPrUZydvvvOhrS34wTWRo6Jy87yA@mail.gmail.com>
References: <20190218092536.39375e84@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218092536.39375e84@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Sun, Feb 17, 2019 at 11:25 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Linus,
>
> In commit
>
>   a5a0bbca16cd ("pinctrl: meson: meson8b: fix the sdxc_a data 1..3 pins")
>
> Fixes tag
>
>   Fixes: 0fefcb6 ("pinctrl: Add support for Meson8b")
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").
Linus fixed this one hour ago in the linux-pinctrl tree
so this should be gone with your next run


Regards
Martin
