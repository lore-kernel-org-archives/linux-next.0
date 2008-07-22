From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: sparc tree build failure
Date: Tue, 22 Jul 2008 15:47:30 -0700 (PDT)
Message-ID: <20080722.154730.06541591.davem@davemloft.net>
References: <20080722174151.8dc8f29e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:39070
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750855AbYGVWra (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Jul 2008 18:47:30 -0400
In-Reply-To: <20080722174151.8dc8f29e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, sam@ravnborg.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 22 Jul 2008 17:41:51 +1000

> Today's (and for a few days) linux-next build (sparc32 defconfig) failed
> like this:
> 
> In file included from include2/asm/page.h:4,
>                  from arch/sparc/kernel/vmlinux.lds.S:4:
> include/asm-sparc/page_64.h:11:2: #error No page size specified in kernel configuration
> 
> Due to the merge of page.h (I suspect).  The patch below fixes it.

Applied, thanks Stephen.
