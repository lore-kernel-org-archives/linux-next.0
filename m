From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH -next] netxen: fix builds for SYSFS=n or MODULES=n
Date: Wed, 28 Oct 2009 02:36:36 -0700 (PDT)
Message-ID: <20091028.023636.92232706.davem@davemloft.net>
References: <20091026172104.205f15af.sfr@canb.auug.org.au>
	<20091026150945.3f35a811.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:34903
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750870AbZJ1JgM (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Oct 2009 05:36:12 -0400
In-Reply-To: <20091026150945.3f35a811.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: randy.dunlap@oracle.com
Cc: sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, dhananjay@netxen.com

From: Randy Dunlap <randy.dunlap@oracle.com>
Date: Mon, 26 Oct 2009 15:09:45 -0700

> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> When CONFIG_MODULES=n:
> drivers/net/netxen/netxen_nic_main.c:2751: error: dereferencing pointer to incomplete type
> drivers/net/netxen/netxen_nic_main.c:2764: error: dereferencing pointer to incomplete type
> 
> Also needs addition of <linux/sysfs.h> for sysfs function prototypes or
> stubs when CONFIG_SYSFS=n.
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

Applied, thanks Randy.
