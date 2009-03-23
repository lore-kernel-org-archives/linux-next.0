From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: wireless tree build failure
Date: Sun, 22 Mar 2009 21:53:26 -0700 (PDT)
Message-ID: <20090322.215326.125372497.davem@davemloft.net>
References: <20090323153954.95094b80.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:34419
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751431AbZCWExj (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Mar 2009 00:53:39 -0400
In-Reply-To: <20090323153954.95094b80.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, yanghy@cn.fujitsu.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 23 Mar 2009 15:39:54 +1100

> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> drivers/net/spider_net.c:2263: error: expected '}' before ';' token
> 
> Caused by commit 6e06cb626229567629e1dc6eed9399bec549f3cf ("spider_net:
> Convert to net_device_ops").
> 
> Clearly never even build tested (or looked at very hard).
> 
> I have used the version of the net tree from next-20090320 for today

Sorry about that Stephen, I'll fix it up.

Yang, don't send me patches you don't even build test.
