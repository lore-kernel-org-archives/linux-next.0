From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the sparc tree
Date: Thu, 17 Jul 2008 23:07:29 -0700 (PDT)
Message-ID: <20080717.230729.193700407.davem@davemloft.net>
References: <20080716173913.3b4050ff.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:42103
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751285AbYGRGHa (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 02:07:30 -0400
In-Reply-To: <20080716173913.3b4050ff.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, sam@ravnborg.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 16 Jul 2008 17:39:13 +1000

> Today's linux-next merge of the sparc tree got conflicts in
> include/asm-sparc64/mmu.h, include/asm-sparc64/page.h and
> include/asm-sparc64/pgtable.h between commit
> 5cd012990ab37dbef7d84cc74feb70ef5f792a12 ("sparc64: Remove 4MB and 512K
> base page size options") from the sparc-current tree and commit
> 0d4b5053275562b4ff7a9a98942936c9eb9b5c18 ("sparc: join the remaining
> header files") from the sparc tree.
> 
> I applied the appropriate parts of the sparc-current commit to
> include/asm-sparc/{mmu,page,pgtable}_64.h.

Stephen, thanks for all of these sparc merge conflict reports.

I'm respinning my sparc tree tonight and that should take care of all
of the conflicts.
