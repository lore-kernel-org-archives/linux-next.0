From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the pm tree with the arm-soc tree
Date: Fri, 21 Apr 2017 07:53:57 +0200
Message-ID: <CAK8P3a3kHO1NZFJXvDwWO625aEmXoo2540FRKe+YYzoYE9NCSg@mail.gmail.com>
References: <20170421105405.6a690b35@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:32978 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1035421AbdDUFx7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 Apr 2017 01:53:59 -0400
In-Reply-To: <20170421105405.6a690b35@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Olof Johansson <olof@lixom.net>, ARM <linux-arm-kernel@lists.infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Gerlach <d-gerlach@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Nishanth Menon <nm@ti.com>

On Fri, Apr 21, 2017 at 2:54 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the pm tree got a conflict in:
>
>   include/dt-bindings/genpd/k2g.h
>
> between commit:
>
>   7cc119f29b19 ("dt-bindings: Add TI SCI PM Domains")
>
> from the arm-soc tree and commit:
>
>   45da8edd1741 ("dt-bindings: Add TI SCI PM Domains")
>
> from the pm tree.
>
> I fixed it up (I just used the pm tree version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Dave, Santosh,

any idea what happened here? It seems that we picked up the wrong
version of the tree, do we need to drop this from arm-soc?

        Arnd
