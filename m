From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: upstream build failure
Date: Wed, 14 May 2008 17:45:20 -0700 (PDT)
Message-ID: <20080514.174520.250034635.davem@davemloft.net>
References: <20080515103925.3e282f11.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:55128
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751660AbYEOAp1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 14 May 2008 20:45:27 -0400
In-Reply-To: <20080515103925.3e282f11.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: bunk@kernel.org, graf.yang@analog.com, cooloney@kernel.org, linux-next@vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 15 May 2008 10:39:25 +1000

> Hi Dave,
> 
> Today's linux-next build of Linus' tree (x86_64 allmodconfig) failed like
> this:
> 
> net/irda/irnet/irnet_irda.c: In function 'irnet_discovery_indication':
> net/irda/irnet/irnet_irda.c:1676: error: implicit declaration of function 'get_unaligned'
> 
> I have applied Adrian's patch ("irnet_irda.c must #include
> <asm/unaligned.h>") which you have queued but not pushed out, yet.

Andrew sent a copy to Linus, should show up in his tree soon.

Thanks.
