From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Wed, 01 Oct 2014 13:42:07 -0400 (EDT)
Message-ID: <20141001.134207.1431827965473600903.davem@davemloft.net>
References: <20141001170403.7a319458@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:34631 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751763AbaJARmL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Oct 2014 13:42:11 -0400
In-Reply-To: <20141001170403.7a319458@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, alexander.h.duyck@intel.com, jeffrey.t.kirsher@intel.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 1 Oct 2014 17:04:03 +1000

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 1 Oct 2014 17:00:49 +1000
> Subject: [PATCH] fm10k: using vmalloc requires including linux/vmalloc.h
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Applied, thanks Stephen.
