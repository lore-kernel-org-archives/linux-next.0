From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: linux-next: manual merge of the mips tree with the net-current
	tree
Date: Tue, 24 Nov 2009 01:19:58 +0000
Message-ID: <20091124011958.GA8105@linux-mips.org>
References: <20091124113717.c5d86d41.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from h5.dl5rb.org.uk ([81.2.74.5]:47282 "EHLO h5.dl5rb.org.uk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752241AbZKXBTy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Nov 2009 20:19:54 -0500
Content-Disposition: inline
In-Reply-To: <20091124113717.c5d86d41.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Beregalov <a.beregalov@gmail.com>, "David S. Miller" <davem@davemloft.net>, Florian Fainelli <florian@openwrt.org>, linux-mips@linux-mips.org, Manuel Lauss <manuel.lauss@googlemail.com>

On Tue, Nov 24, 2009 at 11:37:17AM +1100, Stephen Rothwell wrote:

> Hi Ralf,
> 
> Today's linux-next merge of the mips tree got a conflict in
> drivers/net/au1000_eth.c between commit
> 63edaf647607795a065e6956a79c47f500dc8447 ("Au1x00: fix crash when trying
> register_netdev()") from the net-current tree and commit
> 6cdbc95856e7f4ab4e7b2f2bdab5c3844537ad83 ("NET: au1000-eth: convert to
> platform_driver model") from the mips tree.
> 
> It looks to me that the mips tree change supercedes the net-current one
> (since it moves the register_netdev() call much later), so I just used
> this file from the mips tree.

I agree.  David, can you just drop the net-current patch then?  This fix
is still needed for -stable however.

  Ralf
