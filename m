From: Olof Johansson <olof@lixom.net>
Subject: Re: linux-next: manual merge of the rockchip tree with the arm-soc tree
Date: Mon, 21 Nov 2016 15:38:17 -0800
Message-ID: <CAOesGMhm2n3-7zLD4xUdJGJ7B6p9J_kNdNU-b-z7w+NXGZu_0g@mail.gmail.com>
References: <20161122101908.2e967e42@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:36364 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752787AbcKUXiT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Nov 2016 18:38:19 -0500
Received: by mail-qk0-f196.google.com with SMTP id h201so249266qke.3
        for <linux-next@vger.kernel.org>; Mon, 21 Nov 2016 15:38:18 -0800 (PST)
In-Reply-To: <20161122101908.2e967e42@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Andy Yan <andy.yan@rock-chips.com>

Hi,

On Mon, Nov 21, 2016 at 3:19 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Heiko,
>
> Today's linux-next merge of the rockchip tree got a conflict in:
>
>   arch/arm64/configs/defconfig
>
> between commit:
>
>   a59294b2f7c7 ("ARM64: defconfig: Enable MMC related configs")
>
> from the arm-soc tree and commit:
>
>   5295a3157348 ("arm64: defconfig: enable RK808 components")
>
> from the rockchip tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

This sounds fine, and it's a conflict we'll resolve when we merge this
material from Heiko.


-Olof
