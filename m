From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [GIT PULL/NEXT] sched/arch: Introduce the
 finish_arch_post_lock_switch() scheduler callback
Date: Tue, 13 Mar 2012 16:47:16 +0100
Message-ID: <20120313154716.GA31293@elte.hu>
References: <20120313090040.GE27560@flint.arm.linux.org.uk>
 <20120313092649.GA15406@elte.hu>
 <20120313095020.GA13220@flint.arm.linux.org.uk>
 <20120313101859.GA2626@elte.hu>
 <20120313112729.GA25835@flint.arm.linux.org.uk>
 <20120313115640.GA27378@elte.hu>
 <20120313121707.GA2174@flint.arm.linux.org.uk>
 <20120313124433.GA15333@elte.hu>
 <20120313130427.GC2174@flint.arm.linux.org.uk>
 <20120313133115.GA21634@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:38603 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753927Ab2CMPrs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 13 Mar 2012 11:47:48 -0400
Content-Disposition: inline
In-Reply-To: <20120313133115.GA21634@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>


Anyway - regardless of any differences and flames about workflow 
details, both you and Catalin should still feel free to use both 
the original commit (1cf00341547a) or the tip:sched/arch branch 
I provided (01f23e1630d9).

[ At the end of the merge window I'll try to make sure that at 
  least one of them got upstream ;-) ]

Thanks,

	Ingo
