From: Roland Dreier <rdreier@cisco.com>
Subject: Re: linux-next: manual merge of the net tree with the infiniband tree
Date: Mon, 23 Mar 2009 09:36:34 -0700
Message-ID: <adavdq0w60d.fsf@cisco.com>
References: <20090323145001.6615d77b.sfr@canb.auug.org.au>
	<20090322.211720.220979862.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sj-iport-1.cisco.com ([171.71.176.70]:36216 "EHLO
	sj-iport-1.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753578AbZCWQgi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Mar 2009 12:36:38 -0400
In-Reply-To: <20090322.211720.220979862.davem@davemloft.net> (David Miller's
	message of "Sun, 22 Mar 2009 21:17:20 -0700 (PDT)")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, shemminger@vyatta.com, rolandd@cisco.com

> Today's linux-next merge of the net tree got a conflict in
> drivers/infiniband/ulp/ipoib/ipoib_main.c between commit
> 574d30e9fd416037fc85bcbb148074214aee50e1 ("IPoIB: Convert to
> net_device_ops") from the infiniband tree and commit
> fe8114e8e1d15ba07ddcaebc4741957a1546f307 ("infiniband: convert ipoib to
> net_device_ops") from the net tree.
> 
> Again different versions of the same change.  I used the net tree version.

I'll drop the netdev-ops topic branch from my tree and assume that
Stephen's newer patches are the right ones.  Not sure why Stephen sent
two different versions to two different trees but oh well...
