From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net: fix hp-plus build error
Date: Thu, 26 Feb 2009 21:02:40 -0800 (PST)
Message-ID: <20090226.210240.56120085.davem@davemloft.net>
References: <20090224212949.0dacb59f.sfr@canb.auug.org.au>
	<49A4248F.6090202@oracle.com>
	<49A76A6B.7020709@oracle.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:46554
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750710AbZB0FC7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Feb 2009 00:02:59 -0500
In-Reply-To: <49A76A6B.7020709@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: randy.dunlap@oracle.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, shemminger@vyatta.com, akpm@linux-foundation.org

From: Randy Dunlap <randy.dunlap@oracle.com>
Date: Thu, 26 Feb 2009 20:22:03 -0800

> hp-plus needs to call __alloc_eip_netdev() instead of
> __alloc_ei_netdev() since it is linked with 8390p.o.
> 
> Fixes this build error:
> ERROR: "__alloc_ei_netdev" [drivers/net/hp-plus.ko] undefined!
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

Applied to net-2.6, thanks Randy.
