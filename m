From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: linux-next: Tree for May 11 (build failures)
Date: Mon, 11 May 2015 14:43:39 +0100
Message-ID: <20150511134339.GE2067@n2100.arm.linux.org.uk>
References: <20150511170946.6064c5e9@canb.auug.org.au>
 <20150511133108.GA29164@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:37053 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750962AbbEKNnv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 May 2015 09:43:51 -0400
Content-Disposition: inline
In-Reply-To: <20150511133108.GA29164@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>, Tianping Fang <tianping.fang@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>

On Mon, May 11, 2015 at 06:31:08AM -0700, Guenter Roeck wrote:
> Building arm:keystone_defconfig ... failed
> --------------
> Error log:
> arch/arm/mm/mmu.c: In function 'early_paging_init':
> arch/arm/mm/mmu.c:1461:54: error: expected '(' before ')' token
>   asm volatile("mcr p15, 0, %0, c2, c0, 2" : : "ttbcr");
> 
> Introduced by 'ARM: re-implement physical address space switching'.

For some reason, that passed with an older gcc, though it definitely is
not correct.  A fix has already been merged and should be in the next
next.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
