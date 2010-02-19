From: Russell King <rmk+lkml@arm.linux.org.uk>
Subject: Re: linux-next: build failure after final merge (arm tree)
Date: Fri, 19 Feb 2010 08:22:17 +0000
Message-ID: <20100219082217.GA7392@flint.arm.linux.org.uk>
References: <20100219173929.01b9e85f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:33951 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752296Ab0BSIWc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Feb 2010 03:22:32 -0500
Content-Disposition: inline
In-Reply-To: <20100219173929.01b9e85f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Miller <davem@davemloft.net>

On Fri, Feb 19, 2010 at 05:39:29PM +1100, Stephen Rothwell wrote:
> Hi Russell,
> 
> After merging the scsi-post-merge tree, today's linux-next build (sparc32
> defconfig) failed like this:
> 
> arch/sparc/mm/sun4c.c: In function 'sun4c_update_mmu_cache':
> arch/sparc/mm/sun4c.c:1943: error: 'pte' undeclared (first use
>  in this function)

Damn.

> Caused by commit 2dca0ca96ac340fbf4f9e0741dcf58ff3677e994 ("MM: Pass a
> PTE pointer to update_mmu_cache() rather than the PTE itself").
> 
> I applied the following patch for today. It may not be correct.

It looks correct to me - I'll merge it into the original commit tonight
unless David provides me with an alternative patch.

Thanks.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
