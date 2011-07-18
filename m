From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree with Linus' tree
Date: Mon, 18 Jul 2011 12:33:34 -0700 (PDT)
Message-ID: <20110718.123334.586181689043364242.davem@davemloft.net>
References: <20110718144138.d57ab0a2a806e06fabbcfc9b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:56664 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750803Ab1GRTfo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 18 Jul 2011 15:35:44 -0400
In-Reply-To: <20110718144138.d57ab0a2a806e06fabbcfc9b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, iliak@ti.com, padovan@profusion.mobi, luiz.von.dentz@intel.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 18 Jul 2011 14:41:38 +1000

> Today's linux-next merge of the net tree got a conflict in
> net/bluetooth/l2cap_core.c between commit 9191e6ad897a ("Bluetooth: Fix
> regression in L2CAP connection procedure") from Linus' tree and commit
> e2fd318e3a92 ("Bluetooth: Fixes l2cap "command reject" reply according to
> spec") from the net tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Thanks Stephen, I'll sort this out next time I do a merge between
net-2.6 and net-next-2.6.
