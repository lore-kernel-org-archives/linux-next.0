From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the final tree (net
 tree related)
Date: Wed, 25 Aug 2010 13:59:57 -0700 (PDT)
Message-ID: <20100825.135957.112609658.davem@davemloft.net>
References: <20100825120927.c469ce20.sfr@canb.auug.org.au>
	<E5313AF6F2BFD14293E5FD0F94750F86A4AE225EE8@HQ1-EXCH01.corp.brocade.com>
	<20100825.003526.35028751.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:52676
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752654Ab0HYU7m (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Aug 2010 16:59:42 -0400
In-Reply-To: <20100825.003526.35028751.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: rmody@brocade.com
Cc: sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, huangj@Brocade.COM, James.Bottomley@HansenPartnership.com

From: David Miller <davem@davemloft.net>
Date: Wed, 25 Aug 2010 00:35:26 -0700 (PDT)

> From: Rasesh Mody <rmody@brocade.com>
> Date: Tue, 24 Aug 2010 21:22:19 -0700
> 
>> All,
>> 
>> We are working on a fix and we will submit a patch soon.

Well, where is the fix and why is it taking so long?

Stephen Rothwell is going to build his -next tree for today any minute
now and will have to revert your driver from his tree again since a
fix is not yet in place.

If I don't see a fix quickly, I'll fix it however I like and however
I like might be yanking your driver out of the tree.

Thanks.
