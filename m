From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree
Date: Thu, 27 Nov 2008 00:03:49 -0800 (PST)
Message-ID: <20081127.000349.200638124.davem@davemloft.net>
References: <20081127144043.6cba4a7f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:57890
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751939AbYK0IDt (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 27 Nov 2008 03:03:49 -0500
In-Reply-To: <20081127144043.6cba4a7f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, randy.dunlap@oracle.com, shemminger@vyatta.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 27 Nov 2008 14:40:43 +1100

> Today's linux-next merge of the net tree got a conflict in
> drivers/net/hp-plus.c between commit
> 1d71da164d7fb40fac72c0406a4a531265916fc8 ("net: hp-plus uses eip_poll")
> from the net-current tree and commit
> d4a97d425c2f59849ebdcc94281ecf108818efbf ("hp-plus: convert to
> net_device_ops") from the net tree.
> 
> The fixed it up (see below) but assume it will be fixed soon in the net
> tree.

Thanks Stephen.

I just merged net-2.6 into net-next-2.6 to clear up all of these
merge and build hassles.
