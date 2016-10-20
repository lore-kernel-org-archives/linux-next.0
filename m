From: Ido Schimmel <idosch@idosch.org>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Thu, 20 Oct 2016 09:37:35 +0300
Message-ID: <20161020063735.GA16644@splinter>
References: <20161020110142.41162709@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:39510 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752941AbcJTGhi (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Oct 2016 02:37:38 -0400
Content-Disposition: inline
In-Reply-To: <20161020110142.41162709@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ido Schimmel <idosch@mellanox.com>, David Ahern <dsa@cumulusnetworks.com>

On Thu, Oct 20, 2016 at 11:01:42AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the net-next tree got conflicts in:
> 
>   include/linux/netdevice.h
>   net/core/dev.c
> 
> between commit:
> 
>   e4961b076885 ("net: core: Correctly iterate over lower adjacency list")
> 
> from the net tree and commit:
> 
>   1a3f060c1a47 ("net: Introduce new api for walking upper and lower devices")
>   f1170fd462c6 ("net: Remove all_adj_list and its references")
> 
> from the net-next tree.
> 
> I fixed it up (I just used the net-next tree version) and can carry the
> fix as necessary.

Yes, net-next is correct. Thanks Stephen!
