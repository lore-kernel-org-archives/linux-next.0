From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: merge of the wireless-next tree into the net-next
 tree
Date: Wed, 04 Jan 2012 13:24:12 -0500 (EST)
Message-ID: <20120104.132412.1376413566875687968.davem@davemloft.net>
References: <20120104105947.8bac77d1d7198a49e6feeca8@canb.auug.org.au>
	<4F040799.7080604@qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:51480 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754084Ab2ADS1l (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Jan 2012 13:27:41 -0500
In-Reply-To: <4F040799.7080604@qca.qualcomm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kvalo@qca.qualcomm.com
Cc: sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linville@tuxdriver.com

From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 4 Jan 2012 10:02:33 +0200

> For a temporary solution I'll send a patch which forces ath6kl to
> build only as a module and I'll send ath6kl_core.ko patches ASAP
> after that.

That's not reasonable, fix it properly.
