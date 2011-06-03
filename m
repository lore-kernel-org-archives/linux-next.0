From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the final tree
 (sparc-current tree related)
Date: Fri, 03 Jun 2011 01:14:55 -0700 (PDT)
Message-ID: <20110603.011455.414200582548238157.davem@davemloft.net>
References: <20110603135347.a17e0b85.sfr@canb.auug.org.au>
	<20110602.222051.270790327969020201.davem@davemloft.net>
	<4DE8906F.5040501@gaisler.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:57109 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751137Ab1FCIPH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Jun 2011 04:15:07 -0400
In-Reply-To: <4DE8906F.5040501@gaisler.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: daniel@gaisler.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

From: Daniel Hellstrom <daniel@gaisler.com>
Date: Fri, 03 Jun 2011 09:42:39 +0200

> missed that, PCIC_PCI should depend on SPARC32_PCI instead of PCI in
> the following lines that were added by the patch
> 
> +config PCIC_PCI
> +	bool
> +	depends on PCI && !SPARC_LEON
> +	default y
> +

The fixed I pushed out used PCI && SPARC32 && !SPARC_LEON
