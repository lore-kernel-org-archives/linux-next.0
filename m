From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the final tree
 (sparc-current tree related)
Date: Wed, 30 Mar 2011 21:10:44 -0700 (PDT)
Message-ID: <20110330.211044.212408233.davem@davemloft.net>
References: <20110331130127.1d60ba11.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:37832
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751114Ab1CaELW (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Mar 2011 00:11:22 -0400
In-Reply-To: <20110331130127.1d60ba11.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@gaisler.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 31 Mar 2011 13:01:27 +1100

> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/tty/serial/apbuart.c: In function 'apbuart_probe':
> drivers/tty/serial/apbuart.c:568: error: 'struct pdev_archdata' has no member named 'irqs'
> 
> Caused by commit 10544f128c33 ("sparc32, leon: APBUART driver must use
> archdata to get IRQ number").
> 
> I have reverted that commit for today (and commit c897dcf6311e
> "sparc32,leon: Fixed APBUART frequency detection" that conflicts with the
> revert).

Thanks, I'll make apbuart depend upon sparc to fix this.
