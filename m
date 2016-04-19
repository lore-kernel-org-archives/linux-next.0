From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for Apr 19 (waketorture.c)
Date: Tue, 19 Apr 2016 09:56:06 -0700
Message-ID: <20160419165606.GB3837@linux.vnet.ibm.com>
References: <20160419151347.0bdf706b@canb.auug.org.au>
 <57165AC8.9070702@infradead.org>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e37.co.us.ibm.com ([32.97.110.158]:36586 "EHLO
	e37.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933651AbcDSQzy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Apr 2016 12:55:54 -0400
Received: from localhost
	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Tue, 19 Apr 2016 10:55:54 -0600
Content-Disposition: inline
In-Reply-To: <57165AC8.9070702@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Apr 19, 2016 at 09:20:24AM -0700, Randy Dunlap wrote:
> On 04/18/16 22:13, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20160418:
> > 
> 
> on x86_64:
> 
> kernel/built-in.o: In function `wake_torture_stats_print':
> waketorture.c:(.text+0x2f06d): undefined reference to `trace_clock_global'
> kernel/built-in.o: In function `wake_torture_waiter':
> waketorture.c:(.text+0x2f196): undefined reference to `trace_clock_local'
> waketorture.c:(.text+0x2f1bc): undefined reference to `trace_clock_local'
> waketorture.c:(.text+0x2f1d4): undefined reference to `trace_clock_local'
> waketorture.c:(.text+0x2f237): undefined reference to `trace_clock_local'
> waketorture.c:(.text+0x2f253): undefined reference to `trace_clock_local'
> kernel/built-in.o:waketorture.c:(.text+0x2f318): more undefined references to `trace_clock_local' follow
> kernel/built-in.o: In function `wake_torture_init':
> waketorture.c:(.init.text+0x2b3f): undefined reference to `trace_clock_global'
> 
> 
> Full randconfig file is attached.

I don't see the .config, could you please send it to me?

Looks like I need to add a few "depends" or "selects" clauses...

							Thanx, Paul
