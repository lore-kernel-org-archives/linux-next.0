From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: linux-next: manual merge of the samsung tree with the arm-soc tree
Date: Fri, 05 Apr 2013 15:49:53 +0900
Message-ID: <2a5a01ce31c9$c7051670$550f4350$%kim@samsung.com>
References: <20130405160256.7ca6f52e25e0d2231eb1fcfe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:36399 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752241Ab3DEGuY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 5 Apr 2013 02:50:24 -0400
In-reply-to: <20130405160256.7ca6f52e25e0d2231eb1fcfe@canb.auug.org.au>
Content-language: ko
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Stephen Rothwell' <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'Catalin Marinas' <catalin.marinas@arm.com>, 'Olof Johansson' <olof@lixom.net>, 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 'Heiko Stuebner' <heiko@sntech.de>

Stephen Rothwell wrote:
> 
> Hi Kukjin,
> 
Hi,

> Today's linux-next merge of the samsung tree got a conflict in
> drivers/irqchip/irq-s3c24xx.c between commit de88cbb7b244 ("arm: Move
> chained_irq_(enter|exit) to a generic file") from the arm-soc tree (where
> it is called arch/arm/mach-s3c24xx/irq.c) and commit f0774d41da0e
> ("irqchip: s3c24xx: add devicetree support") from the samsung tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
Looks good to me, thanks.

- Kukjin
