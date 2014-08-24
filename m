From: Eric Paris <eparis@redhat.com>
Subject: Re: arm64 audit build failures in -next
Date: Sun, 24 Aug 2014 16:35:34 -0400
Message-ID: <1408912534.4481.1.camel@localhost>
References: <E1XLCyO-0007E5-P1@cassiel.sirena.org.uk>
	 <20140823155043.GM24407@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:12498 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752750AbaHXUgM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 24 Aug 2014 16:36:12 -0400
In-Reply-To: <20140823155043.GM24407@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Guy Briggs <rgb@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux-audit@redhat.com, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org

I just pushed a clean copy of Linus' tree to my audit tree.  So my API
change is gone when he next pull for -next.  I'm on vacation this week
and really wanted to get it fixed right before I left.  It didn't
happen.  when I push a new tree into next I will pick up the arm audit
patch and fix the api in my tree.

-Eric

On Sat, 2014-08-23 at 10:50 -0500, Mark Brown wrote:
> On Sat, Aug 23, 2014 at 04:11:20PM +0100, Build bot for Mark Brown wrote:
> 
> > 	arm64-allmodconfig
> > ../arch/arm64/kernel/ptrace.c:1120:3: error: too many arguments to function 'audit_syscall_entry'
> 
> This has now been broken in -next for about a month with a fix available
> and since the merge window the arm64 audit support is in mainline so the
> fix can be directly applied without cross tree issues (the audit changes
> didn't get sent during the merge window).  Catalin and Will have also
> indicated that they want to remove the workaround that's in -next
> currently to allow defconfig to build which would make the situation
> even more pressing.
> 
> Do we have any idea when it will be possible to get a fix into -next?
