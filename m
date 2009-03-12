From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build warning
Date: Wed, 11 Mar 2009 23:24:28 -0700 (PDT)
Message-ID: <20090311.232428.17370685.davem@davemloft.net>
References: <20090312165857.667b22d0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:39779
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1754499AbZCLGYm (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Mar 2009 02:24:42 -0400
In-Reply-To: <20090312165857.667b22d0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, inaky@linux.intel.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 12 Mar 2009 16:58:57 +1100

> Hi Dave,
> 
> Today's linux-next build (powerpc allyesconfig) produced these warnings:
> 
> drivers/net/wimax/i2400m/netdev.c: In function 'i2400m_net_erx':
> drivers/net/wimax/i2400m/netdev.c:523: warning: format '%zu' expects type 'size_t', but argument 7 has type 'unsigned int'
> drivers/net/wimax/i2400m/netdev.c:548: warning: format '%zu' expects type 'size_t', but argument 7 has type 'unsigned int'
> 
> Probably introduced by commit fd5c565c0c04d2716cfdac3f1de3c2261d6a457d
> ("wimax/i2400m: support extended data RX protocol (no need to reallocate
> skbs)").

I just pushed Randy Dunlap's fix for this into the tree.

Thanks.
