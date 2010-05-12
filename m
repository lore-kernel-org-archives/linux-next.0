From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the net tree
Date: Tue, 11 May 2010 23:13:39 -0700 (PDT)
Message-ID: <20100511.231339.22535803.davem@davemloft.net>
References: <20100512125653.38f442c5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:33554
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752741Ab0ELGNd (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 12 May 2010 02:13:33 -0400
In-Reply-To: <20100512125653.38f442c5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, kaber@trash.net, andreas.meissner@sphairon.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 12 May 2010 12:56:53 +1000

> After merging the net tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> net/ipv4/ipmr.c: In function 'ipmr_cache_unresolved':
> net/ipv4/ipmr.c:1001: error: 'net' undeclared (first use in this function)
> 
> Caused by commit 0c12295a741d3186987f96f518cfbdaf01abb087 ("ipv4: ipmr:
> move mroute data into seperate structure") from the net tree interacting
> with commit bbd725435ddb1cac732f7a8c23c21ff67f24c60f ("IPv4: unresolved
> multicast route cleanup") from Linus' tree.

Tricky merge :-)

I'll clear all of these issues up for you tonight Stephen, thanks!

There should have been a merge conflict in
Documentation/feature-removal-schedule.txt due to some recent
netfilter commits too, I'll take care of that too of course :)
