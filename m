From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Apr 19 (waketorture.c)
Date: Tue, 19 Apr 2016 09:20:24 -0700
Message-ID: <57165AC8.9070702@infradead.org>
References: <20160419151347.0bdf706b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57051 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933495AbcDSQU0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Apr 2016 12:20:26 -0400
In-Reply-To: <20160419151347.0bdf706b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>

On 04/18/16 22:13, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160418:
> 

on x86_64:

kernel/built-in.o: In function `wake_torture_stats_print':
waketorture.c:(.text+0x2f06d): undefined reference to `trace_clock_global'
kernel/built-in.o: In function `wake_torture_waiter':
waketorture.c:(.text+0x2f196): undefined reference to `trace_clock_local'
waketorture.c:(.text+0x2f1bc): undefined reference to `trace_clock_local'
waketorture.c:(.text+0x2f1d4): undefined reference to `trace_clock_local'
waketorture.c:(.text+0x2f237): undefined reference to `trace_clock_local'
waketorture.c:(.text+0x2f253): undefined reference to `trace_clock_local'
kernel/built-in.o:waketorture.c:(.text+0x2f318): more undefined references to `trace_clock_local' follow
kernel/built-in.o: In function `wake_torture_init':
waketorture.c:(.init.text+0x2b3f): undefined reference to `trace_clock_global'


Full randconfig file is attached.


-- 
~Randy
