From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of sparc tree
Date: Tue, 17 Jun 2008 00:35:34 -0700 (PDT)
Message-ID: <20080617.003534.193689527.davem@davemloft.net>
References: <20080617172150.9ef1ea69.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:42236
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1752202AbYFQHfe (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Jun 2008 03:35:34 -0400
In-Reply-To: <20080617172150.9ef1ea69.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, bunk@kernel.org, geert@linux-m68k.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 17 Jun 2008 17:21:50 +1000

> Today's linux-next merge of the sparc tree got a trivial contextual
> conflict in include/asm-m68k/sbus.h between commit
> 69edc57f65f2d0bf63485cba4567876a1cfa3dae ("m68k/sun3/: possible
> cleanups") from the m68k tree and commit
> 878e7a6e498bec55f10a163197c41554fb078416 ("sparc: remove CONFIG_SUN4")
> from the sparc tree.
> 
> It was just close changes to the same file.  I fixed it up.

Thanks.
