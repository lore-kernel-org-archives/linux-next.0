From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree with the infiniband
 tree
Date: Sun, 22 Mar 2009 21:17:20 -0700 (PDT)
Message-ID: <20090322.211720.220979862.davem@davemloft.net>
References: <20090323145001.6615d77b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:47527
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750719AbZCWERc (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Mar 2009 00:17:32 -0400
In-Reply-To: <20090323145001.6615d77b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, shemminger@vyatta.com, rolandd@cisco.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 23 Mar 2009 14:50:01 +1100

> Today's linux-next merge of the net tree got a conflict in
> drivers/infiniband/ulp/ipoib/ipoib_main.c between commit
> 574d30e9fd416037fc85bcbb148074214aee50e1 ("IPoIB: Convert to
> net_device_ops") from the infiniband tree and commit
> fe8114e8e1d15ba07ddcaebc4741957a1546f307 ("infiniband: convert ipoib to
> net_device_ops") from the net tree.
> 
> Again different versions of the same change.  I used the net tree version.

I'll work with Roland to resolve these somehow, thanks.
