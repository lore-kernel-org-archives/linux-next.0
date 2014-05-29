From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: nommu build failures on ARM in linux-next
Date: Thu, 29 May 2014 19:55:34 +0100
Message-ID: <20140529185534.GK3693@n2100.arm.linux.org.uk>
References: <5387661F.1050000@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:38467 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750940AbaE2S5H (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 29 May 2014 14:57:07 -0400
Content-Disposition: inline
In-Reply-To: <5387661F.1050000@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, May 29, 2014 at 12:53:51PM -0400, Paul Gortmaker wrote:
> Hi Russell,
> 
> The allnoconfig builds in linux-next fail because __clear_cr
> lives in mmu.c without any stub or similar in nommu.c
> 
> Introduced by:
> 
> commit 247e4fff3aa927ad069447e6da05bb966b70dece
> Author: Russell King <rmk+kernel@arm.linux.org.uk>
> Date:   Sun Apr 13 18:57:29 2014 +0100
> 
>     ARM: provide common method to clear bits in CPU control register
>     
> Sample failure:
>   http://kisskb.ellerman.id.au/kisskb/buildresult/11264405/

ALIGNMENT_TRAP depends on CPU_CP15_MMU, so it's quite reasonable that
__clear_cr should exist in this case - but it doesn't because it's in
mmu.c.  I guess we need __clear_cr moved to arch/arm/kernel/setup.c.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
