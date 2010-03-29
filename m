From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the final tree (net
 tree related)
Date: Mon, 29 Mar 2010 01:01:04 -0700 (PDT)
Message-ID: <20100329.010104.214233589.davem@davemloft.net>
References: <20100329174300.512d83a8.sfr@canb.auug.org.au>
	<1269845561.2164.1.camel@edumazet-laptop>
	<1269845970.2164.4.camel@edumazet-laptop>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:33104
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751631Ab0C2IAm (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Mar 2010 04:00:42 -0400
In-Reply-To: <1269845970.2164.4.camel@edumazet-laptop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: eric.dumazet@gmail.com
Cc: sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, therbert@google.com

From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Mon, 29 Mar 2010 08:59:30 +0200

> From: Stephen Rothwell <sfr@canb.auug.org.au>
 ...
> Oops, a cleaner patch would be :
> 
> [PATCH] rps: fix net-sysfs build for !CONFIG_RPS
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Eric Dumazet <eric.dumazet@gmail.com>

Applied, thanks guys!
