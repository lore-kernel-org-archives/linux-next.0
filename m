From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Wed, 11 Dec 2013 19:36:39 -0500 (EST)
Message-ID: <20131211.193639.2058525533631918382.davem@davemloft.net>
References: <20131212111539.cff1b2efe934c5cd7abbb822@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:60702 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751000Ab3LLAgk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Dec 2013 19:36:40 -0500
In-Reply-To: <20131212111539.cff1b2efe934c5cd7abbb822@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, jasowang@redhat.com, wuzhy@linux.vnet.ibm.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 12 Dec 2013 11:15:39 +1100

> Today's linux-next merge of the net-next tree got a conflict in
> drivers/net/macvtap.c between commit ce232ce01d61 ("macvtap: signal
> truncated packets") from the net tree and commit 55ec8e25cd97 ("macvtap:
> remove unused parameter in macvtap_do_read()") from the net-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

The net-next commit in question was reverted last night.
