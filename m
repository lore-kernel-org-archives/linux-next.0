From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: origin tree build failure
Date: Tue, 14 Oct 2008 16:52:54 -0700 (PDT)
Message-ID: <20081014.165254.228300725.davem@davemloft.net>
References: <20081015095916.f30c0979.sfr@canb.auug.org.au>
	<alpine.LFD.2.00.0810141637210.3288@nehalem.linux-foundation.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:40911
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751626AbYJNXxR (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 19:53:17 -0400
In-Reply-To: <alpine.LFD.2.00.0810141637210.3288@nehalem.linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: torvalds@linux-foundation.org
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, broonie@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org, lrg@slimlogic.co.uk

From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Oct 2008 16:43:12 -0700 (PDT)

> The proper way to test for whether an interrupt is valid or not is to do
> 
> 	if (dev->irq) {
> 		...
> 
> and no other. There is no spoon. That NO_IRQ was insane. And architectures 
> or drivers that still think otherwise should fix themselves.

Agreed.  Someone tried to add something similar to the network
driver phylib layer, and I told them similarly.
