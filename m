From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build failure
Date: Mon, 11 Jan 2010 00:02:05 -0800 (PST)
Message-ID: <20100111.000205.164473435.davem@davemloft.net>
References: <20100111184205.8d53fe5b.Stephen@Rothwell.id.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:56820
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752152Ab0AKIB4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Jan 2010 03:01:56 -0500
In-Reply-To: <20100111184205.8d53fe5b.Stephen@Rothwell.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen@Rothwell.id.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, joe@perches.com

From: Stephen Rothwell <Stephen@Rothwell.id.au>
Date: Mon, 11 Jan 2010 18:42:05 +1100

> Hi all,
> 
> Today's linux-next build (powerpc_allnoconfig) failed like this:
> 
> lib/lib.a(vsprintf.o): In function `pointer':
> vsprintf.c:(.text+0x21ba): undefined reference to `byte_rev_table'
> vsprintf.c:(.text+0x21c2): undefined reference to `byte_rev_table'
> 
> Caused by commit bc7259a2ce764ea16200eb9e53f6e136e918d065
> ("lib/vsprintf.c: Add %pMF to format FDDI bit reversed MAC addresses")
> from the net tree.
> 
> I applied the following fixup patch (and can carry it for a while):
> (BTW after this patch, CONFIG_BITREVERSE appears to not be used anywhere
> except where is is selected in Kconfig files.)
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 11 Jan 2010 18:37:16 +1100
> Subject: [PATCH] net: vsprintf now depends on the byte_rev_table
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Thanks I'll apply this and then add a commit which kills
off CONFIG_BITREVERSE.

Thanks!
