From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Feb 27 (microblaze build failure)
Date: Fri, 27 Feb 2015 11:59:58 -0800
Message-ID: <20150227195958.GA13445@roeck-us.net>
References: <20150227154917.6d285971@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:44632 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754997AbbB0UAI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 Feb 2015 15:00:08 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YRR4w-002jPj-O7
	for linux-next@vger.kernel.org; Fri, 27 Feb 2015 20:00:06 +0000
Content-Disposition: inline
In-Reply-To: <20150227154917.6d285971@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>

On Fri, Feb 27, 2015 at 03:49:17PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150226:
> 
> New Tree: rpi
> 
> The drm-intel tree gained a conflict against the drm-intel-fixes tree.
> 
> The rcu tree gained a build failure so I used the version from
> next-20150226.
> 
> The clk tree lost its build failure but gained another so I used the
> version from next-20150225.
> 
> Non-merge commits (relative to Linus' tree): 1432
>  1565 files changed, 41138 insertions(+), 36333 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
Building microblaze:mmu_defconfig ... failed
--------------
Error log:
arch/microblaze/kernel/cpu/mb.c: In function 'show_cpuinfo':
arch/microblaze/kernel/cpu/mb.c:105:2: error: 'x' undeclared (first use in this
function)
  x seq_puts(m, "Icache:\t\tno\n");
    ^

Joe Perches' fat fingers are to blame for that one.

Guenter
