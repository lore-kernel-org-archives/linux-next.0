From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the final tree
 (devicetree tree related)
Date: Wed, 11 Apr 2012 09:35:40 -0400 (EDT)
Message-ID: <20120411.093540.1313049193929998.davem@davemloft.net>
References: <20120411151155.b1a614f174442a592d1c1561@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:54129 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755111Ab2DKNhv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Apr 2012 09:37:51 -0400
In-Reply-To: <20120411151155.b1a614f174442a592d1c1561@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: grant.likely@secretlab.ca, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, thomas.abraham@linaro.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 11 Apr 2012 15:11:55 +1000

> Hi all,
> 
> After merging the final tree, today's linux-next build (sparc64 defconfig)
> failed like this:
> 
> drivers/of/of_mdio.c: In function 'of_mdiobus_register':
> drivers/of/of_mdio.c:75:4: error: implicit declaration of function 'irq_of_parse_and_map' [-Werror=implicit-function-declaration]
> 
> Caused by commit e46c11b94787 ("of/irq: add empty irq_of_parse_and_map()
> for non-dt builds").  SPARC has CONFIG_OF but not CONFIG_OF_IRQ ...

If I had a nickel for every time an implicit dependency on CONFIG_OF_IRQ
was added to the tree... :-)
