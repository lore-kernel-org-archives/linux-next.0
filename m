From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next-2.6] net: net/ipv4/devinet.c cleanups
Date: Wed, 04 Nov 2009 22:05:24 -0800 (PST)
Message-ID: <20091104.220524.156001126.davem@davemloft.net>
References: <20091105133041.a2aa30f7.sfr@canb.auug.org.au>
	<4AF2571C.7040700@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:59184
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751252AbZKEGE6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Nov 2009 01:04:58 -0500
In-Reply-To: <4AF2571C.7040700@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: eric.dumazet@gmail.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Thu, 05 Nov 2009 05:39:56 +0100

> [PATCH net-next-2.6] net: net/ipv4/devinet.c cleanups
> 
> As pointed by Stephen Rothwell, commit c6d14c84 added a warning :
> 
> net/ipv4/devinet.c: In function 'inet_select_addr':
> net/ipv4/devinet.c:902: warning: label 'out' defined but not used
> 
> delete unused 'out' label and do some cleanups as well
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Eric Dumazet <eric.dumazet@gmail.com>

Applied, thanks everyone.
