From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build warning in Linus' tree
Date: Mon, 24 May 2010 21:58:22 -0700 (PDT)
Message-ID: <20100524.215822.13254177.davem@davemloft.net>
References: <20100525114614.fd61d822.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:51336
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751127Ab0EYE6O (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 25 May 2010 00:58:14 -0400
In-Reply-To: <20100525114614.fd61d822.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, NeilJay@gmail.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 25 May 2010 11:46:14 +1000

> Hi Dave,
> 
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
> 
> drivers/net/usb/asix.c: In function 'asix_rx_fixup':
> drivers/net/usb/asix.c:325: warning: cast from pointer to integer of different size
> drivers/net/usb/asix.c:354: warning: cast from pointer to integer of different size
> 
> Introduced by commit 3f78d1f210ff89af77f042ab7f4a8fee39feb1c9
> ("drivers/net/usb/asix.c: Fix unaligned accesses").  This commit casts
> skb->data to u32.

Thanks I'll look into this.
