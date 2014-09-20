From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: Tree for Sep 19
Date: Fri, 19 Sep 2014 22:08:56 -0400 (EDT)
Message-ID: <20140919.220856.2166907140359359148.davem@davemloft.net>
References: <541CC721.2010207@roeck-us.net>
	<541CD3C3.3010905@infradead.org>
	<525DB349B3FB5444AE057A887CB2A8D88EF892@nice.asicdesigners.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:32934 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753398AbaITCI6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Sep 2014 22:08:58 -0400
In-Reply-To: <525DB349B3FB5444AE057A887CB2A8D88EF892@nice.asicdesigners.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: anish@chelsio.com
Cc: rdunlap@infradead.org, linux@roeck-us.net, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, JBottomley@parallels.com, mchan@broadcom.com

From: Anish Bhatt <anish@chelsio.com>
Date: Sat, 20 Sep 2014 01:43:05 +0000

> Original config causing issues can be seen here :
> https://lkml.org/lkml/2014/9/9/500
> 
> As CNIC depends on IPV6, CNIC can be only compiled as a module when IPV6 is 
> compiled as a module. This was the patch I originally commited. Previous 
> behaviour was to disable all ipv6 code in such a case. However, having bnx2fc/i 
>  as built-in overrides CNIC's tristate from m to built-in (as they select CNIC), 
>  causing build issues. As far as I know, there is no way to control the state 
> that select sets.

Really, nothing that has dependencies should be "select"'d, ever.

What people hack up is that they try to do this, and "make it work"
by "select"'ing all of the selected object's dependencies.  And
then you have to do this recursively for dependencies which have
dependencies.

This is really incredibly stupid.

And once something in that chain gains a new dependency, all of
these "select" instances break.

I really want all of these netlink users to "depend" on "NET"
rather than "select" it, and so on and so forth down to the
users of these netlink using subsystems.
