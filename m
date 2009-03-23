From: Stephen Hemminger <shemminger@vyatta.com>
Subject: Re: linux-next: manual merge of the net tree with the infiniband
 tree
Date: Mon, 23 Mar 2009 09:42:34 -0700
Message-ID: <20090323094234.79080220@nehalam>
References: <20090323145001.6615d77b.sfr@canb.auug.org.au>
	<20090322.211720.220979862.davem@davemloft.net>
	<adavdq0w60d.fsf@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.vyatta.com ([76.74.103.46]:50543 "EHLO mail.vyatta.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752819AbZCWQmm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Mar 2009 12:42:42 -0400
In-Reply-To: <adavdq0w60d.fsf@cisco.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Roland Dreier <rdreier@cisco.com>
Cc: David Miller <davem@davemloft.net>, sfr@canb.auug.org.au, linux-next@vger.kernel.org, rolandd@cisco.com

On Mon, 23 Mar 2009 09:36:34 -0700
Roland Dreier <rdreier@cisco.com> wrote:

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

I was looking at net-next tree and wanted to make allmodconfig
build w/o netdev_ops. The IB one hadn't bubbled up yet.
