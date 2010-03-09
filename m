From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: Tree for March 8 (mtd)
Date: Mon, 08 Mar 2010 18:49:02 -0800
Message-ID: <1268102942.3908.957.camel@macbook.infradead.org>
References: <20100308152740.a007e8cb.sfr@canb.auug.org.au>
	 <4B9532FE.8030901@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:45273 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932118Ab0CICtN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Mar 2010 21:49:13 -0500
In-Reply-To: <4B9532FE.8030901@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>

On Mon, 2010-03-08 at 09:25 -0800, Randy Dunlap wrote:
> On 03/07/10 20:27, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20100305:
> > 
> > 
> > The mtd tree still has its 2 build failures for which I applied patches.
> 
> 
> drivers/mtd/sm_ftl.c:
> sm_ftl.c:(.text+0x9c110): undefined reference to `__nand_calculate_ecc'
> sm_ftl.c:(.text+0x9c123): undefined reference to `__nand_correct_data'
> sm_ftl.c:(.text+0x9c14a): undefined reference to `__nand_calculate_ecc'
> sm_ftl.c:(.text+0x9c15d): undefined reference to `__nand_correct_data'
> sm_ftl.c:(.text+0x9c9ac): undefined reference to `__nand_calculate_ecc'
> sm_ftl.c:(.text+0x9c9bf): undefined reference to `__nand_calculate_ecc'

Thanks.

http://git.infradead.org/mtd-2.6.git/commitdiff/7de6f798

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
