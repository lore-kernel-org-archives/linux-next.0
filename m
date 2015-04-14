From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the arm-soc tree
Date: Tue, 14 Apr 2015 02:05:25 +0200
Message-ID: <2367636.XqWxjYfX1q@wuerfel>
References: <20150407111217.2b2cf440@canb.auug.org.au> <CABuKBe+p-hW_8fW4ocq10KM5=CZunoQwJ8+mp4n1U04NBoOPtw@mail.gmail.com> <20150414094735.7fea2b06@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:52881 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754850AbbDNAFs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 13 Apr 2015 20:05:48 -0400
In-Reply-To: <20150414094735.7fea2b06@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>

On Tuesday 14 April 2015 09:47:35 Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 8 Apr 2015 16:59:49 +0200 Matthias Brugger <matthias.bgg@gmail.com> wrote:
> >
> > 2015-04-08 16:49 GMT+02:00 Linus Walleij <linus.walleij@linaro.org>:
> > > On Tue, Apr 7, 2015 at 2:28 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> > >> On Tuesday 07 April 2015 11:28:22 Linus Walleij wrote:
> > >>> On Tue, Apr 7, 2015 at 10:43 AM, Matthias Brugger
> > >>> <matthias.bgg@gmail.com> wrote:
> > >>> > 2015-04-07 3:12 GMT+02:00 Stephen Rothwell <sfr@canb.auug.org.au>:
> > >>> >> Hi all,
> > >>> >>
> > >>> >> After merging the arm-soc tree, today's linux-next build (arm
> > >>> >> multi_v7_defconfig) failed like this:
> > >>> >>
> > >>> >> In file included from arch/arm/boot/dts/mt8135.dtsi:18:0,
> > >>> >>                  from arch/arm/boot/dts/mt8135-evbp1.dts:16:
> > >>> >> arch/arm/boot/dts/mt8135-pinfunc.h:18:40: fatal error: dt-bindings/pinctrl/mt65xx.h: No such file or directory
> > >>> >>  #include <dt-bindings/pinctrl/mt65xx.h>
> > >>> >>                                         ^
> > >>> >>
> > >>> >> Caused by commit e6f219b8ec5e ("ARM: dts: mt8135: Add pinctrl/GPIO/EINT
> > >>> >> node for mt8135").
> > >>> >
> > >>> > This will be fixed as soon as Linus pinctrl for-next branch got merged [1].
> > >>>
> > >>> Hm that's unfortunate, we do not rely on merge orders.
> > >>>
> > >>> Either the ARM SoC tree needs to pull in the pinctrl commit
> > >>> or I need to carry this patch in the pinctrl tree.
> > >>>
> > >>> Is this sufficiently stand-alone to be merged into my tree
> > >>> or do you need to go by the former approach?
> > >>
> > >> Let's just delay this patch to another merge window. You can add the
> > >> driver now, and we should just revert the DT node addition in arm-soc,
> > >> and then we'll add it in 4.2, or come up with a better solution.
> > >
> > > OK. I'm not applying it then.
> > 
> > @arnd: I will send the patch in the next merge window then. Do you
> > want me to do anything else for this merge window (e.g. resend the
> > pull request without the patch)?
> 
> I am still applying my reversion patch to the arm-soc tree merge ...

Sorry about that. I've applied the same revert now to our branch, but
there are some other fixes that I need to apply too before I upload
it. If you don't mind pulling arm-soc again manually at the end
of your merges for today, that might be helpful, otherwise it should
be fixed tomorrow.

	Arnd
