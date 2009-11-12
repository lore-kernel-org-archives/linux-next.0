From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build warning
Date: Wed, 11 Nov 2009 18:53:38 -0800 (PST)
Message-ID: <20091111.185338.253345558.davem@davemloft.net>
References: <20091112132424.e010e3c5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:50100
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1759976AbZKLCxM (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Nov 2009 21:53:12 -0500
In-Reply-To: <20091112132424.e010e3c5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, eric.dumazet@gmail.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 12 Nov 2009 13:24:24 +1100

> Hi Dave,
> 
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
> 
> net/ipv6/addrconf.c: In function 'inet6_dump_ifinfo':
> net/ipv6/addrconf.c:3833: warning: unused variable 'err'
> 
> Introduced by commit 84d2697d9649339215675551eae28ba04068dea1 ("ipv6:
> speedup inet6_dump_ifinfo()").

I just pushed a fix for this into net-next-2.6, thanks!
