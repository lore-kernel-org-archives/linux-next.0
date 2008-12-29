From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: origin tree build warnings
Date: Sun, 28 Dec 2008 20:01:45 -0800 (PST)
Message-ID: <20081228.200145.33502228.davem@davemloft.net>
References: <20081229113525.89450db7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:53917
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751404AbYL2EBm (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 28 Dec 2008 23:01:42 -0500
In-Reply-To: <20081229113525.89450db7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: nhorman@tuxdriver.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 29 Dec 2008 11:35:25 +1100

> Hi Neil,
> 
> Today's linux-next build (powerpc ppc64_defconfig) produced these new
> warnings:
> 
> drivers/net/pasemi_mac.c: In function 'pasemi_mac_rx_intr':
> drivers/net/pasemi_mac.c:957: warning: unused variable 'dev'
> drivers/net/pasemi_mac.c: In function 'pasemi_mac_poll':
> drivers/net/pasemi_mac.c:1637: warning: unused variable 'dev'
> drivers/net/spider_net.c: In function 'spider_net_poll':
> drivers/net/spider_net.c:1280: warning: unused variable 'netdev'
> 
> Probably caused by commit 908a7a16b852ffd618a9127be8d62432182d81b4 ("net:
> Remove unused netdev arg from some NAPI interfaces").
> 
> Please fix these up.

I'll take care of all of these issues, along with the
ibmveth et al. ones you reported seperately.

Thanks Stephen.
