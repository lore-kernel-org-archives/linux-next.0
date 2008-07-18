From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Fri, 18 Jul 2008 14:31:51 +1000
Message-ID: <200807181431.51623.rusty@rustcorp.com.au>
References: <20080716181545.807eeb57.sfr@canb.auug.org.au> <487EDC9D.5070307@qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:42825 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750777AbYGREby (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 00:31:54 -0400
In-Reply-To: <487EDC9D.5070307@qualcomm.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Max Krasnyansky <maxk@qualcomm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, David Miller <davem@davemloft.net>

On Thursday 17 July 2008 15:46:05 Max Krasnyansky wrote:
> Stephen Rothwell wrote:
> > These are essentially the same changes in both trees (but with some
> > additions in the net tree.  I fixed it up as best I could.  It is
> > probably worth a look once the tree is published.
>
> I'm not sure what rr tree is. I'd suggest dropping tun patches from it and
> just going with Dave's tree since everything should be already there.
> ie I did my patches latest patches on top of Rusty's patches. And Dave
> already merged all of them.

Yep, -rr is my tree.  This duplicate is totally expected now Dave has merged, 
and will vanish once Linus gets them and I rebase.

Cheers,
Rusty.
