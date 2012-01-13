From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: Tree for Jan 13 (net core)
Date: Fri, 13 Jan 2012 13:55:45 -0800 (PST)
Message-ID: <20120113.135545.2287769681500341872.davem@davemloft.net>
References: <20120113155808.05431d23da358e37b19eee7c@canb.auug.org.au>
	<4F10AFD3.7050505@xenotime.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:50876 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753432Ab2AMV54 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Jan 2012 16:57:56 -0500
In-Reply-To: <4F10AFD3.7050505@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: rdunlap@xenotime.net
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, glommer@parallels.com

From: Randy Dunlap <rdunlap@xenotime.net>
Date: Fri, 13 Jan 2012 14:27:31 -0800

> On 01/12/2012 08:58 PM, Stephen Rothwell wrote:
>> Hi all,
>> 
>> Changes since 20120112:
> 
> 
> net/built-in.o: In function `sk_clone_lock':
> (.text+0x45ed): undefined reference to `sock_update_memcg'
> 
> Full randconfig file is attached.

Grrr, Glauber another regression...
