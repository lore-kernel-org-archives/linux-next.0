From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the tip tree with the net tree
Date: Wed, 12 Aug 2009 17:33:25 -0700 (PDT)
Message-ID: <20090812.173325.255498124.davem@davemloft.net>
References: <20090807164705.725869c1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:49190
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751105AbZHMAdP (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Aug 2009 20:33:15 -0400
In-Reply-To: <20090807164705.725869c1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: tglx@linutronix.de, mingo@elte.hu, hpa@zytor.com, peterz@infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de, jengelh@medozas.de

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 7 Aug 2009 16:47:05 +1000

> Today's linux-next merge of the tip tree got a conflict in
> arch/x86/include/asm/socket.h between commits
> 49c794e94649020248e37b78db16cd25bad38b4f ("net: implement a SO_PROTOCOL
> getsockoption") and 0d6038ee76f2e06b79d0465807f67e86bf4025de ("net:
> implement a SO_DOMAIN getsockoption") from the net tree and commit
> 73a2d096fdf23aa841f7595d114a11ec85a85e4d ("x86: remove all now-duplicate
> header files") from the tip tree.
> 
> The latter change supercedes the former ones, so I used the latter.

That should be the correct merge resolution, thanks!
