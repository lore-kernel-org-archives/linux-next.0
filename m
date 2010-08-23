From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH -next] isdn/avm: fix build when PCMCIA is not enabled
Date: Sun, 22 Aug 2010 21:37:50 -0700 (PDT)
Message-ID: <20100822.213750.241909397.davem@davemloft.net>
References: <20100819143941.d3ea5cb4.sfr@canb.auug.org.au>
	<20100819100723.d0c0578e.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:53531
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751869Ab0HWEhd (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Aug 2010 00:37:33 -0400
In-Reply-To: <20100819100723.d0c0578e.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: randy.dunlap@oracle.com
Cc: sfr@canb.auug.org.au, calle@calle.de, isdn@linux-pingi.de, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>
Date: Thu, 19 Aug 2010 10:07:23 -0700

> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Why wouldn't kconfig symbol ISDN_DRV_AVMB1_B1PCMCIA also depend on
> PCMCIA?
> 
> Fix build for PCMCIA not enabled:
 ...
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

Applied to net-2.6, thanks Randy.
