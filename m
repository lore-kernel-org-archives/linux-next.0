From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: boot test failure (net tree)
Date: Tue, 16 Aug 2011 20:05:28 -0700 (PDT)
Message-ID: <20110816.200528.63647861483543536.davem@davemloft.net>
References: <20110817105002.efebf85d08460ad99b14be8e@canb.auug.org.au>
	<20110816.175657.1688139393736610845.davem@davemloft.net>
	<20110817112110.ec81ef078204bf4a02049a66@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:42355 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753239Ab1HQDHb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 16 Aug 2011 23:07:31 -0400
In-Reply-To: <20110817112110.ec81ef078204bf4a02049a66@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, jeffrey.t.kirsher@intel.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 17 Aug 2011 11:21:10 +1000

> On Tue, 16 Aug 2011 17:56:57 -0700 (PDT) David Miller <davem@davemloft.net> wrote:
>>
>> This happens on other occaisions, I see new group guards all
>> the time when I resync my net and net-next trees with Linus.
> 
> "All the time"?  really?

I can't think of too many days during the merge window where this
doesn't happen, quite frankly.
