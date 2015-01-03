From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Sat, 03 Jan 2015 14:45:30 -0500 (EST)
Message-ID: <20150103.144530.1032237292364564169.davem@davemloft.net>
References: <20150103091101.04b2c11e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:44217 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752247AbbACTpc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 3 Jan 2015 14:45:32 -0500
In-Reply-To: <20150103091101.04b2c11e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, richardcochran@gmail.com, jeffrey.t.kirsher@intel.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Sat, 3 Jan 2015 09:11:01 +1100

> After merging the net-next tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/net/ethernet/mellanox/mlx4/en_clock.c: In function 'mlx4_en_init_timestamp':
> drivers/net/ethernet/mellanox/mlx4/en_clock.c:249:2: error: implicit declaration of function 'CLOCKSOURCE_MASK' [-Werror=implicit-function-declaration]
>   mdev->cycles.mask = CLOCKSOURCE_MASK(48);

Stephen please let me know if this failure is persisting.
