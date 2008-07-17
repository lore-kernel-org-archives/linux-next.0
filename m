From: Max Krasnyansky <maxk@qualcomm.com>
Subject: Re: linux-next: manual merge of the rr tree
Date: Wed, 16 Jul 2008 22:46:05 -0700
Message-ID: <487EDC9D.5070307@qualcomm.com>
References: <20080716181545.807eeb57.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254]:4816 "EHLO
	wolverine01.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751426AbYGQFzg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Jul 2008 01:55:36 -0400
In-Reply-To: <20080716181545.807eeb57.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, David Miller <davem@davemloft.net>

Stephen Rothwell wrote:
> Hi Rusty,
> 
> Today's linux-next merge of the rr tree got conflicts in
> drivers/net/tun.c and include/linux/if_tun.h between commits
> 07240fd0902c872f044f523893364a1a24c9f278 ("tun: Interface to query
> tun/tap features"), 5228ddc98fa49b3cedab4024e269d62410a0d806 ("tun:
> TUNSETFEATURES to set gso features") and
> f271b2cc78f09c93ccd00a2056d3237134bf994c ("tun: Fix/rewrite packet
> filtering logic") from the net tree and commit
> 10c9db38e381599da1491d7d5e71f13573d39144 ("misc:tun-gso-csum-features")
> from the rr tree.
> 
> These are essentially the same changes in both trees (but with some
> additions in the net tree.  I fixed it up as best I could.  It is
> probably worth a look once the tree is published.

I'm not sure what rr tree is. I'd suggest dropping tun patches from it and
just going with Dave's tree since everything should be already there.
ie I did my patches latest patches on top of Rusty's patches. And Dave already
merged all of them.

Max
