From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the sunxi tree with the arm-soc tree
Date: Mon, 30 Oct 2017 14:51:13 +0100
Message-ID: <CAK8P3a12bGTr1-royZZeuu69kD+59MhVZeJJ-8iVviGg33hA-w@mail.gmail.com>
References: <20171030122200.z5sj2riar4vfoiwo@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:43070 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751837AbdJ3NvU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Oct 2017 09:51:20 -0400
In-Reply-To: <20171030122200.z5sj2riar4vfoiwo@sirena.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Oct 30, 2017 at 1:22 PM, Mark Brown <broonie@kernel.org> wrote:
> Hi all,
>
> Today's linux-next merge of the sunxi tree got a conflict in:
>
>    arch/arm/boot/dts/sunxi-h3-h5.dtsi
>    arch/arm/boot/dts/sun7i-a20.dtsi
>    arch/arm/boot/dts/sun6i-a31.dtsi
>    arch/arm/boot/dts/sun4i-a10.dtsi
>
> between commit:
>
>    8dccafaa281aa1 ("arm: dts: fix unit-address leading 0s")
>
> from the arm-soc tree and various commits from the sunxi tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks!

I think I did the same merge when I pulled in the sunxi/dt branch
today, so it should be resolved next time.

      Arnd
