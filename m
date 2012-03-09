From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net-next tree with the powerpc
 tree
Date: Thu, 08 Mar 2012 22:15:34 -0800 (PST)
Message-ID: <20120308.221534.712157352097242982.davem@davemloft.net>
References: <20120309133646.fb8cc30d8c2fd0ef7784d72c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:41856 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751327Ab2CIGTv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Mar 2012 01:19:51 -0500
In-Reply-To: <20120309133646.fb8cc30d8c2fd0ef7784d72c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, benh@kernel.crashing.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org, joe@perches.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 9 Mar 2012 13:36:46 +1100

> Today's linux-next merge of the net-next tree got a conflict in
> drivers/net/ethernet/ibm/iseries_veth.c between commit e92a665949f6
> ("net: powerpc: remove the legacy iSeries ethernet driver") from the
> powerpc tree and commit 41de8d4cff21 ("drivers/net: Remove alloc_etherdev
> error messages") from the net-next tree.
> 
> I just removed the file.

If it makes life easier for anyone I can put the driver removal patch
into net-next.
