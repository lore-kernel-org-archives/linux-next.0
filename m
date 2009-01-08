From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure
Date: Wed, 07 Jan 2009 21:42:00 -0800 (PST)
Message-ID: <20090107.214200.128478821.davem@davemloft.net>
References: <20090108162007.e77ca43e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:41158
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751170AbZAHFl6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Jan 2009 00:41:58 -0500
In-Reply-To: <20090108162007.e77ca43e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 8 Jan 2009 16:20:07 +1100

> Today's linux-next build (sparc64 defconfig) failed like this:
> 
> drivers/base/topology.c: In function 'show_physical_package_id':
> drivers/base/topology.c:103: error: implicit declaration of function 'cpu_data'
> drivers/base/topology.c:103: error: request for member 'proc_id' in something not a structure or union
> drivers/base/topology.c: In function 'show_core_id':
> drivers/base/topology.c:106: error: request for member 'core_id' in something not a structure or union
> 
> I cherry-picked the fix out of Linus' tree.

Ok :-)
