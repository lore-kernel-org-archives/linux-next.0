From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [GIT PULL/NEXT] sched/arch: Introduce the
 finish_arch_post_lock_switch() scheduler callback
Date: Fri, 30 Mar 2012 14:52:55 +0100
Message-ID: <20120330135255.GC23295@arm.com>
References: <20120313092649.GA15406@elte.hu>
 <20120313095020.GA13220@flint.arm.linux.org.uk>
 <20120313101859.GA2626@elte.hu>
 <20120313112729.GA25835@flint.arm.linux.org.uk>
 <20120313115640.GA27378@elte.hu>
 <20120313121707.GA2174@flint.arm.linux.org.uk>
 <20120313124433.GA15333@elte.hu>
 <20120313130427.GC2174@flint.arm.linux.org.uk>
 <20120313133115.GA21634@elte.hu>
 <20120313154716.GA31293@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:40142 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758971Ab2C3Nx2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 30 Mar 2012 09:53:28 -0400
Content-Disposition: inline
In-Reply-To: <20120313154716.GA31293@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Russell King <rmk@arm.linux.org.uk>, Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>

Hi Ingo,

On Tue, Mar 13, 2012 at 03:47:16PM +0000, Ingo Molnar wrote:
> Anyway - regardless of any differences and flames about workflow 
> details, both you and Catalin should still feel free to use both 
> the original commit (1cf00341547a) or the tip:sched/arch branch 
> I provided (01f23e1630d9).

About the scheduler hook patch, would it go into mainline via the
sched/urgent or the sched/arch branch? I would like to rebase the
ARM-specific patches on top of one of these branches and send you a pull
request (with Russell's ack).

Alternatively, I can wait until some 3.4-rc (and merge the ARM patches
via Russell).

Thanks.

-- 
Catalin
