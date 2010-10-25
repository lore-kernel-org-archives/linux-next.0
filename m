From: Chris Ball <cjb@laptop.org>
Subject: Re: linux-next: build failure after merge of the mmc tree
Date: Mon, 25 Oct 2010 03:21:02 +0100
Message-ID: <20101025022102.GA23049@void.printf.net>
References: <20101025121238.db983f90.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from void.printf.net ([89.145.121.20]:43767 "EHLO void.printf.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750996Ab0JYCVG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 24 Oct 2010 22:21:06 -0400
Content-Disposition: inline
In-Reply-To: <20101025121238.db983f90.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Andrew Morton <akpm@linux-foundation.org>

Hi Stephen,

On Mon, Oct 25, 2010 at 12:12:38PM +1100, Stephen Rothwell wrote:
> Hi Chris,
> 
> After merging the mmc tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/mmc/card/block.c:57: error: 'CONFIG_MMC_BLOCK_MINORS' undeclared here (not in a function)
> 
> Caused by commit d8714fbfc66e16fc64a4525c02eebc34bac8385c ("mmc: make
> number of mmcblk minors configurable").  Forget to include a Kconfig
> update?
> 
> I have used the mmc tree from next-20101022 for today.

Sorry, yes.  I've tested and pushed a fixed version. 

Thanks very much,

-- 
Chris Ball   <cjb@laptop.org>   <http://printf.net/>
One Laptop Per Child
