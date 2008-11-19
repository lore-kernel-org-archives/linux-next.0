From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: Tree for November 19 (mtd build error)
Date: Wed, 19 Nov 2008 18:58:24 +0000
Message-ID: <1227121104.27728.618.camel@macbook.infradead.org>
References: <20081119175917.7d21cf77.sfr@canb.auug.org.au>
	 <20081119105321.477e618a.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:46281 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752698AbYKSS6g (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Nov 2008 13:58:36 -0500
In-Reply-To: <20081119105321.477e618a.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 2008-11-19 at 10:53 -0800, Randy Dunlap wrote:
> On Wed, 19 Nov 2008 17:59:17 +1100 Stephen Rothwell wrote:
> 
> (.text+0x104879): undefined reference to `add_mtd_device'
> (.text+0x1048e1): undefined reference to `del_mtd_device'
> mtd.c:(.text+0x104999): undefined reference to `mtd_erase_callback'
> 
> 
> config attached.

CONFIG_SFC_MTD=y

What's that?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
