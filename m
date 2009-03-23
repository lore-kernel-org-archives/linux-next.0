From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree with the infiniband
 tree
Date: Mon, 23 Mar 2009 12:28:43 -0700 (PDT)
Message-ID: <20090323.122843.11697107.davem@davemloft.net>
References: <20090323145001.6615d77b.sfr@canb.auug.org.au>
	<20090322.211720.220979862.davem@davemloft.net>
	<adavdq0w60d.fsf@cisco.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:57336
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1755480AbZCWT24 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Mar 2009 15:28:56 -0400
In-Reply-To: <adavdq0w60d.fsf@cisco.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: rdreier@cisco.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, shemminger@vyatta.com, rolandd@cisco.com

From: Roland Dreier <rdreier@cisco.com>
Date: Mon, 23 Mar 2009 09:36:34 -0700

> > Today's linux-next merge of the net tree got a conflict in
> > drivers/infiniband/ulp/ipoib/ipoib_main.c between commit
> > 574d30e9fd416037fc85bcbb148074214aee50e1 ("IPoIB: Convert to
> > net_device_ops") from the infiniband tree and commit
> > fe8114e8e1d15ba07ddcaebc4741957a1546f307 ("infiniband: convert ipoib to
> > net_device_ops") from the net tree.
> > 
> > Again different versions of the same change.  I used the net tree version.
> 
> I'll drop the netdev-ops topic branch from my tree and assume that
> Stephen's newer patches are the right ones.  Not sure why Stephen sent
> two different versions to two different trees but oh well...

I think because he works purely againt net-next-2.6 and he really
wanted to add the config option without risk of breaking allmodconfig
on x86.

That's only possible if all the netdev_ops conversions go into
net-next-2.6 as I explained.

Anyways, thanks Roland, I appreciate you helping us resolve this.
