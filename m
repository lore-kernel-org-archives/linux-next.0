From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH -next] net: fix test_bpf build to depend on NET
Date: Tue, 13 May 2014 13:16:01 -0400 (EDT)
Message-ID: <20140513.131601.2024599128071503735.davem@davemloft.net>
References: <53724F44.2010608@infradead.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:43642 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751409AbaEMRQD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 13 May 2014 13:16:03 -0400
In-Reply-To: <53724F44.2010608@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: rdunlap@infradead.org
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>
Date: Tue, 13 May 2014 09:58:44 -0700

> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix build when CONFIG_NET is not enabled.
> Fixes these build errors:
> 
> WARNING: "sk_unattached_filter_destroy" [lib/test_bpf.ko] undefined!
> WARNING: "kfree_skb" [lib/test_bpf.ko] undefined!
> WARNING: "sk_unattached_filter_create" [lib/test_bpf.ko] undefined!
> WARNING: "sk_run_filter_int_skb" [lib/test_bpf.ko] undefined!
> WARNING: "__alloc_skb" [lib/test_bpf.ko] undefined!
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Applied, thanks Randy.
