From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: manual merge of the powerpc tree with the arm tree
Date: Fri, 9 Mar 2012 00:39:37 +0000
Message-ID: <20120309003937.GC8680@flint.arm.linux.org.uk>
References: <20120308120422.e071cba36425eacbee1f8d98@canb.auug.org.au> <25744.1331174036@neuling.org> <20120308145131.fad50bbc79c36f0b0b12d101@canb.auug.org.au> <1331185951.3105.29.camel@pasglop> <1331249746.3105.40.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:49969 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753473Ab2CIAk1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Mar 2012 19:40:27 -0500
Content-Disposition: inline
In-Reply-To: <1331249746.3105.40.camel@pasglop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Michael Neuling <mikey@neuling.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>

On Fri, Mar 09, 2012 at 10:35:46AM +1100, Benjamin Herrenschmidt wrote:
> Actually, I didn't keep MAY_HAVE_SPARSE_IRQ, I kept HAVE_SPARSE_IRQ. If
> I remove it, then I get Kconfig warnings:
> 
> warning: (PPC) selects SPARSE_IRQ which has unmet direct dependencies
> (HAVE_GENERIC_HARDIRQS && HAVE_SPARSE_IRQ)

Do you have commit 2ed86b16eabe4efbf80cc725a8cbb5310746a2fc ?

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
