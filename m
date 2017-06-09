From: Rob Herring <robherring2@gmail.com>
Subject: Re: linux-next: manual merge of the devicetree tree with the renesas tree
Date: Fri, 9 Jun 2017 08:46:27 -0500
Message-ID: <CAL_JsqKZNof2oY-zyRx6UXmGw8aHt5-_NhWU4MMBT-gXNePvsw@mail.gmail.com>
References: <20170609135304.6c1108aa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f170.google.com ([209.85.161.170]:36177 "EHLO
        mail-yw0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751596AbdFINqt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Jun 2017 09:46:49 -0400
In-Reply-To: <20170609135304.6c1108aa@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Simon Horman <horms@verge.net.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marcus Cooper <codekipper@gmail.com>, Biju Das <biju.das@bp.renesas.com>

On Thu, Jun 8, 2017 at 10:53 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Rob,
>
> Today's linux-next merge of the devicetree tree got a conflict in:
>
>   Documentation/devicetree/bindings/vendor-prefixes.txt
>
> between commit:
>
>   d795f15618b8 ("of: Add vendor prefix for iWave Systems Technologies Pvt. Ltd")
>
> from the renesas tree and commit:
>
>   97a0268e764c ("devicetree: add Itead vendor prefix")
>
> from the devicetree tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Simon, I can pick up the conflicting patch if you want to drop it.

Rob
