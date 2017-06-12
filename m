From: Simon Horman <horms@verge.net.au>
Subject: Re: linux-next: manual merge of the devicetree tree with the renesas
 tree
Date: Mon, 12 Jun 2017 11:58:39 +0200
Message-ID: <20170612095839.GA32404@verge.net.au>
References: <20170609135304.6c1108aa@canb.auug.org.au>
 <CAL_JsqKZNof2oY-zyRx6UXmGw8aHt5-_NhWU4MMBT-gXNePvsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45111 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752129AbdFLJ6n (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Jun 2017 05:58:43 -0400
Content-Disposition: inline
In-Reply-To: <CAL_JsqKZNof2oY-zyRx6UXmGw8aHt5-_NhWU4MMBT-gXNePvsw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marcus Cooper <codekipper@gmail.com>, Biju Das <biju.das@bp.renesas.com>

On Fri, Jun 09, 2017 at 08:46:27AM -0500, Rob Herring wrote:
> On Thu, Jun 8, 2017 at 10:53 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi Rob,
> >
> > Today's linux-next merge of the devicetree tree got a conflict in:
> >
> >   Documentation/devicetree/bindings/vendor-prefixes.txt
> >
> > between commit:
> >
> >   d795f15618b8 ("of: Add vendor prefix for iWave Systems Technologies Pvt. Ltd")
> >
> > from the renesas tree and commit:
> >
> >   97a0268e764c ("devicetree: add Itead vendor prefix")
> >
> > from the devicetree tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> 
> Simon, I can pick up the conflicting patch if you want to drop it.

Thanks, I will drop it.
