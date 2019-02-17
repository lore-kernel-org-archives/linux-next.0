From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: Fixes tag needs some work in the pinctrl tree
Date: Sun, 17 Feb 2019 22:25:42 +0100
Message-ID: <CACRpkdbUKzpKnozHpH8Gz6S41S-qxQS0DJrqTEwycqG3pz+OnQ@mail.gmail.com>
References: <20190214220338.7241bdc5@canb.auug.org.au> <CAFBinCCTbn0zMQqTzk2RvELCRBX1=Vf1QuY54Kp+BKc+sOmKHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCCTbn0zMQqTzk2RvELCRBX1=Vf1QuY54Kp+BKc+sOmKHQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Feb 14, 2019 at 12:55 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> Hi Stephen, Hi Linus,
>
> On Thu, Feb 14, 2019 at 12:03 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi Linus,
> >
> > In commit
> >
> >   a5a0bbca16cd ("pinctrl: meson: meson8b: fix the sdxc_a data 1..3 pins")
> >
> > Fixes tag
> >
> >   Fixes: 0fefcb6 ("pinctrl: Add support for Meson8b")
> >
> > has these problem(s):
> >
> >   - SHA1 should be at least 12 digits long
> >     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
> >     or later) just making sure it is not set (or set to "auto").
> this is my fault - sorry about that.
>
> Linus, do you want me to re-send the patch or do you want to change
> the referenced SHA1 to 0fefcb6876d0d6 ?
> I'm fine either way, please let me know what's easiest for you.

I fixed it up, no big deal.

Thanks Stephen, Martin!
Linus Walleij
