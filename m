From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: mtd tree build failure
Date: Mon, 20 Oct 2008 08:24:50 +0100
Message-ID: <1224487490.6770.1509.camel@macbook.infradead.org>
References: <20081020163518.b858f3f7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:39638 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750966AbYJTHYy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Oct 2008 03:24:54 -0400
In-Reply-To: <20081020163518.b858f3f7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Mike Rapoport <mike@compulab.co.il>, Russell King <rmk+kernel@arm.linux.org.uk>

On Mon, 2008-10-20 at 16:35 +1100, Stephen Rothwell wrote:
> Caused by commit aaf7ea20000436df3cbb397ccb734ad1e2e5164d ("[MTD]
> [NAND] GPIO NAND flash driver").  I assume this needs to depend on
> some architecture/platform so I reverted it for now.

Hm, indeed. I thought it _did_ depend on ARM -- did I apply the wrong
version of the patch?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
