From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the sparc-next tree with the sparc
 tree
Date: Tue, 05 Aug 2014 18:58:09 -0700 (PDT)
Message-ID: <20140805.185809.743966176538113451.davem@davemloft.net>
References: <20140806095845.25491f00@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:33909 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751981AbaHFB6K (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Aug 2014 21:58:10 -0400
In-Reply-To: <20140806095845.25491f00@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, bpicco@meloft.net

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 6 Aug 2014 09:58:45 +1000

> Today's linux-next merge of the sparc-next tree got a conflict in
> arch/sparc/mm/init_64.c between commit 4ca9a23765da ("sparc64: Guard
> against flushing openfirmware mappings") from the sparc tree and commit
> f6d4fb5cc047 ("sparc64 - add mem to iomem resource") from the
> sparc-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks Stephen, simple non-overlapping additions and I'm about to push
that resolution to my tree.

Thanks again!
