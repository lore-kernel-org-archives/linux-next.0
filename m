From: Russell King <rmk+lkml@arm.linux.org.uk>
Subject: Re: [PATCH] Kallsyms problems (was: Re: linux-next: arm build
	failures)
Date: Sat, 20 Jun 2009 15:14:01 +0100
Message-ID: <20090620141401.GA23844@flint.arm.linux.org.uk>
References: <20090617162612.703adfd9.sfr@canb.auug.org.au> <tnx3a9ztg14.fsf@pc1117.cambridge.arm.com> <20090617230804.5e353ec9.sfr@canb.auug.org.au> <20090619151321.GA6223@flint.arm.linux.org.uk> <20090620155440.a7dfb2d4.sfr@canb.auug.org.au> <20090620124152.GI32531@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:46232 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751231AbZFTOOc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 20 Jun 2009 10:14:32 -0400
Content-Disposition: inline
In-Reply-To: <20090620124152.GI32531@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Catalin Marinas <catalin.marinas@arm.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mike Frysinger <vapier.adi@gmail.com>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>

On Sat, Jun 20, 2009 at 02:41:52PM +0200, Sam Ravnborg wrote:
> Just sent it. Overloaded with day-time stuff (again).

Sam, thanks, it does appear to solve the problem here as well.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
