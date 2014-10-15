From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the net tree
Date: Tue, 14 Oct 2014 22:02:54 -0400 (EDT)
Message-ID: <20141014.220254.144210672646232483.davem@davemloft.net>
References: <20141015104411.306b138e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:46451 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755536AbaJOCC4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Oct 2014 22:02:56 -0400
In-Reply-To: <20141015104411.306b138e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, peppe.cavallaro@st.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 15 Oct 2014 10:44:11 +1100

> Hi all,
> 
> After merging the net tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/built-in.o: In function `.LANCHOR0':
> :(.rodata+0x6b764): undefined reference to `sti_gmac_data'
> :(.rodata+0x6b828): undefined reference to `sti_gmac_data'
> :(.rodata+0x6b8ec): undefined reference to `sti_gmac_data'
> :(.rodata+0x6b9b0): undefined reference to `sti_gmac_data'
> 
> Caused by commit 53b26b9bc9a5 ("stmmac: dwmac-sti: review the
> glue-logic for STi4xx and STiD127 SoCs") which renamed sti_gmac_data to
> stih4xx_dwmac_data (or something) without updating all the references
> to it (including the one added in the previous commit ...).
> 
> I reverted that commit for today.

Sigh, Giuseppe if I don't see a proper fix by tomorrow I'm
reverting all of the stmmac changes I applied today.
