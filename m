From: Tony Lindgren <tony@atomide.com>
Subject: Re: linux-next: manual merge of the gpio tree with the arm-soc tree
Date: Tue, 27 Sep 2016 12:16:54 -0700
Message-ID: <20160927191653.57ig7mh3ptjy3izi@atomide.com>
References: <20160927150542.7e81e7ee@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:43195 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752367AbcI0TQ6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Sep 2016 15:16:58 -0400
Content-Disposition: inline
In-Reply-To: <20160927150542.7e81e7ee@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

* Stephen Rothwell <sfr@canb.auug.org.au> [160926 22:06]:
> Hi Linus,
> 
> Today's linux-next merge of the gpio tree got a conflict in:
> 
>   arch/arm/mach-omap2/board-rx51-peripherals.c
> 
> between commit:
> 
>   9b7141d01a76 ("ARM: OMAP2+: Drop legacy board file for n900")
> 
> from the arm-soc tree and commit:
> 
>   9132ce450bd1 ("ARM: omap2: fix missing include")
> 
> from the gpio tree.
> 
> I fixed it up (the former removed the file, so I did that) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

Yes thanks removing it the way to go.

Regards,

Tony
