From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for Mar 30 (waketorture.c)
Date: Wed, 30 Mar 2016 10:03:19 -0700
Message-ID: <20160330170319.GK4287@linux.vnet.ibm.com>
References: <20160330125012.35e0ca75@canb.auug.org.au>
 <56FC054F.8010706@infradead.org>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e19.ny.us.ibm.com ([129.33.205.209]:39784 "EHLO
	e19.ny.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753092AbcC3RKa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 30 Mar 2016 13:10:30 -0400
Received: from localhost
	by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Wed, 30 Mar 2016 13:10:29 -0400
Content-Disposition: inline
In-Reply-To: <56FC054F.8010706@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Mar 30, 2016 at 09:56:47AM -0700, Randy Dunlap wrote:
> On 03/29/16 18:50, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20160329:
> > 
> 
> 
> on i386 or x86_64:
> 
> waketorture.c:(.text+0x5d578): undefined reference to `trace_clock_global'
> waketorture.c:(.text+0x5d731): undefined reference to `trace_clock_local'
> waketorture.c:(.text+0x5d765): undefined reference to `trace_clock_local'
> waketorture.c:(.text+0x5d7a7): undefined reference to `trace_clock_local'
> waketorture.c:(.text+0x5d835): undefined reference to `trace_clock_local'
> waketorture.c:(.text+0x5d879): undefined reference to `trace_clock_local'
> kernel/built-in.o:waketorture.c:(.text+0x5d9a3): more undefined references to `trace_clock_local' follow
> waketorture.c:(.init.text+0x3e11): undefined reference to `trace_clock_global'
> 
> 
> on i386:
> 
> kernel/built-in.o: In function `wake_torture_stats_print':
> waketorture.c:(.text+0x4a990): undefined reference to `__udivdi3'
> waketorture.c:(.text+0x4a9eb): undefined reference to `__udivdi3'
> waketorture.c:(.text+0x4a9fd): undefined reference to `__udivdi3'
> waketorture.c:(.text+0x4aa19): undefined reference to `__umoddi3'
> waketorture.c:(.text+0x4aa39): undefined reference to `__udivdi3'
> 
> 
> 
> Let me know if you need .config files for any of these.

My mistake pushing a diagnostic commit to -next.  I have updated to
avoid doing so.

							Thanx, Paul
