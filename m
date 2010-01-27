From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build failure
Date: Tue, 26 Jan 2010 20:49:42 -0800 (PST)
Message-ID: <20100126.204942.44952742.davem@davemloft.net>
References: <20100127131827.6aea9bf5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:43999
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753680Ab0A0Eta (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Jan 2010 23:49:30 -0500
In-Reply-To: <20100127131827.6aea9bf5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, ron.mercer@qlogic.com, leitao@linux.vnet.ibm.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 27 Jan 2010 13:18:27 +1100

> Hi Dave,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/net/qlge/qlge_main.c: In function 'ql_init_device':
> drivers/net/qlge/qlge_main.c:4502: error: label 'err_out' used but not defined
> 
> Caused by commit 8aae2600030f54494f9061d2cde141802d774be9 ("qlge: Add
> basic firmware dump") interacting with commit
> 4f9a91c81273b66afe0b6a9be460b47581b28246 ("qlge: Only free resources if
> they were allocated") from Linus' tree.
> 
> I applied the following merge fixup.

Thanks for letting me know, I'll do a merge and make sure this
gets cured just how you fixed it.
