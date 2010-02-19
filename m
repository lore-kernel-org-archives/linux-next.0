From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after final merge (net tree)
Date: Thu, 18 Feb 2010 22:53:49 -0800 (PST)
Message-ID: <20100218.225349.258488745.davem@davemloft.net>
References: <20100219173713.e3f9f386.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:38853
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752397Ab0BSGxe (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 19 Feb 2010 01:53:34 -0500
In-Reply-To: <20100219173713.e3f9f386.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, kristoffer@gaisler.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 19 Feb 2010 17:37:13 +1100

> I assume that this driver was written and tested only on Sparc ... maybe
> it should depend on SPARC?
> 
> I have reverted that commit for today.

I'll take a look at what it really depends upon.

Thanks.
