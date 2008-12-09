From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: m68k build failure
Date: Tue, 09 Dec 2008 00:00:52 -0800 (PST)
Message-ID: <20081209.000052.32930290.davem@davemloft.net>
References: <20081209174534.17ad7991.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:44338
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750949AbYLIIAv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Dec 2008 03:00:51 -0500
In-Reply-To: <20081209174534.17ad7991.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, geert@linux-m68k.org, shemminger@vyatta.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 9 Dec 2008 17:45:34 +1100

> Hi Dave,
> 
> The linux-next build (m68k defconfig) failed like this:
> 
> drivers/net/hydra.c: In function 'hydra_init':
> /drivers/net/hydra.c:163: error: 'hydra_netdev_ops' undeclared (first use in this function)
> 
> Caused by commit 5618f0d1193d6b051da9b59b0e32ad24397f06a4 ("hydra:
> convert to net_device_ops") which contains a typo in the net_device_ops
> structure naming (presumably cut and paste).

Sorry about that.  I just pushed a fix for this to net-next-2.6
from Alexey D.
