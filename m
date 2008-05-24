From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Subject: Re: spontaneous reboots and hangs on x86_64
Date: Sat, 24 May 2008 18:11:06 +0200
Message-ID: <200805241811.06230.m.kozlowski@tuxland.pl>
References: <200805152201.49154.m.kozlowski@tuxland.pl> <200805162053.36390.m.kozlowski@tuxland.pl> <20080517132317.3265d52c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from orion.ambsoft.pl ([212.109.144.130]:56932 "EHLO
	orion.ambsoft.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755789AbYEXQLL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 24 May 2008 12:11:11 -0400
In-Reply-To: <20080517132317.3265d52c.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@elte.hu>, Adrian Bunk <bunk@kernel.org>, kernel-testers@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, Gregory Haskins <ghaskins@novell.com>

Hi,

> Hi Ingo,
> 
> On Fri, 16 May 2008 20:53:36 +0200 Mariusz Kozlowski <m.kozlowski@tuxland.pl> wrote:
> >
> > Ok I got bisection working finally, now I'm at d5be23e2 I have something like 80 revisions left and
> > I'm stuck with this:
> > 
> > In file included from kernel/sched.c:1861:
> > kernel/sched_rt.c: In function 'check_preempt_curr_rt':
> > kernel/sched_rt.c:653: error: implicit declaration of function 'cpupri_find'
> > kernel/sched_rt.c:653: error: 'struct root_domain' has no member named 'cpupri'
> > make[1]: *** [kernel/sched.o] Error 1
> > make: *** [kernel] Error 2
> 
> This error is caused by commit 677ceea32cf1d8ba9a4870bc58079cd7e7f77558
> ("sched: prioritize non-migratable tasks over migratable ones") in the
> sched tree (sched/for-akpm).  This commit is either just wrong, is was
> misrebased, or is just badly out of order.  It introduces a use of
> cpupri_find, but the function is not defined until commit
> ea9b3c95b7c666d4658a139b88587269e5baa647 ("sched: use a 2-d bitmap for
> searching lowest-pri CPU") about 146 commits later ...

Whatever it was its gone in recent linux-next releases, box boots without
problems.

	Mariusz
