From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the net tree
Date: Thu, 20 Jan 2011 17:10:05 -0800 (PST)
Message-ID: <20110120.171005.93464500.davem@davemloft.net>
References: <20110121120553.5e827247.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:48363
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752356Ab1AUBJb (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 20 Jan 2011 20:09:31 -0500
In-Reply-To: <20110121120553.5e827247.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, pablo@netfilter.org, kaber@trash.net

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 21 Jan 2011 12:05:53 +1100

> Hi all,
> 
> After merging the net tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> ERROR: ".nf_conntrack_tstamp_fini" [net/netfilter/nf_conntrack.ko] undefined!
> ERROR: ".nf_conntrack_tstamp_init" [net/netfilter/nf_conntrack.ko] undefined!
> 
> Presumably caused by commit a992ca2a0498edd22a88ac8c41570f536de29c9e
> ("netfilter: nf_conntrack_tstamp: add flow-based timestamp extension").
> 
> I have used the net tree from next-20110120 for today.

I just pushed a fix into net-next-2.6 to cure this a few minutes ago.
