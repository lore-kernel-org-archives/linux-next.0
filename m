From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm tree with the rockchip
 tree
Date: Tue, 10 Jan 2017 17:22:48 -0800
Message-ID: <20170110172248.9195c9bdeb15c4c2dfe52719@linux-foundation.org>
References: <20170109135521.4bd995f5@canb.auug.org.au>
        <CAK7LNATca+7CMs+Nxw00KmPVHbiXO8Nsd-Kf9RhYWJviAO43Ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:34340 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754389AbdAKBWt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Jan 2017 20:22:49 -0500
In-Reply-To: <CAK7LNATca+7CMs+Nxw00KmPVHbiXO8Nsd-Kf9RhYWJviAO43Ag@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

On Wed, 11 Jan 2017 10:07:33 +0900 Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> 2017-01-09 11:55 GMT+09:00 Stephen Rothwell <sfr@canb.auug.org.au>:
> > Hi Andrew,
> >
> > Today's linux-next merge of the akpm tree got a conflict in:
> >
> >   Documentation/devicetree/bindings/soc/rockchip/grf.txt
> >
> > between commit:
> >
> >   2c257ce6ab6f ("dt-bindings: add used but undocumented rockchip grf compatible values")
> >
> > from the rockchip tree and patch:
> >
> >    "scripts/spelling.txt: add "followings" pattern and fix typo instances"
> >
> > from the akpm tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >
> > --
> > Cheers,
> > Stephen Rothwell
> >
> > diff --cc Documentation/devicetree/bindings/soc/rockchip/grf.txt
> > index c6e62cb30712,76d6ccf677f5..000000000000
> > --- a/Documentation/devicetree/bindings/soc/rockchip/grf.txt
> > +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.txt
> > @@@ -10,19 -9,16 +10,19 @@@ From RK3368 SoCs, the GRF is divided in
> >
> >   Required Properties:
> >
> > - - compatible: GRF should be one of the followings
> > + - compatible: GRF should be one of the following:
> >  +   - "rockchip,rk3036-grf", "syscon": for rk3036
> >      - "rockchip,rk3066-grf", "syscon": for rk3066
> >      - "rockchip,rk3188-grf", "syscon": for rk3188
> >      - "rockchip,rk3228-grf", "syscon": for rk3228
> >      - "rockchip,rk3288-grf", "syscon": for rk3288
> >      - "rockchip,rk3368-grf", "syscon": for rk3368
> >      - "rockchip,rk3399-grf", "syscon": for rk3399
> > - - compatible: PMUGRF should be one of the followings
> > + - compatible: PMUGRF should be one of the following:
> >      - "rockchip,rk3368-pmugrf", "syscon": for rk3368
> >      - "rockchip,rk3399-pmugrf", "syscon": for rk3399
> >  +- compatible: SGRF should be one of the following
> >  +   - "rockchip,rk3288-sgrf", "syscon": for rk3288
> >   - reg: physical base address of the controller and length of memory mapped
> >     region.
>
> Hi Andrew,
> 
> I have been wondering this
> because this series is touching files across sub-systems.
> 
> I expected it would be pulled into upstream
> during the previous MW, but it was not.
> How long will it stay in your branch?

(Top-posting fixed.  Please don't do that!)

I expect I'll be sending
scripts-spellingtxt-add-several-more-common-spelling-mistakes.patch in
to Linus for 4.11-rc1.  If "dt-bindings: add used but undocumented
rockchip grf compatible values" gets merged befoe that, I'll fix up
scripts-spellingtxt-add-several-more-common-spelling-mistakes.patch. 
If scripts-spellingtxt-add-several-more-common-spelling-mistakes.patch
get merged first, you'lll need to fix up "dt-bindings: add used but
undocumented rockchip grf compatible values".
