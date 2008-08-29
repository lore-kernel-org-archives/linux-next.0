From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: rcu build warnings
Date: Fri, 29 Aug 2008 07:42:00 -0700
Message-ID: <20080829144200.GB6725@linux.vnet.ibm.com>
References: <20080829191948.95cde73f.sfr@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e36.co.us.ibm.com ([32.97.110.154]:53028 "EHLO
	e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751370AbYH2OmE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Aug 2008 10:42:04 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com [9.17.195.227])
	by e36.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id m7TEg13B006233
	for <linux-next@vger.kernel.org>; Fri, 29 Aug 2008 10:42:01 -0400
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id m7TEg1nV222126
	for <linux-next@vger.kernel.org>; Fri, 29 Aug 2008 08:42:01 -0600
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m7TEg06w032746
	for <linux-next@vger.kernel.org>; Fri, 29 Aug 2008 08:42:01 -0600
Content-Disposition: inline
In-Reply-To: <20080829191948.95cde73f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

On Fri, Aug 29, 2008 at 07:19:48PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> Commit cd95851785bcfe95fdf73689e8ecb5a1c5959231 ("rcu: fix classic RCU
> locking cleanup lockdep problem") from the sched tree used a long
> (instead of unsigned long) for the flags argument to
> spin_lock_irqsave/restore producing these warnings:
> 
> kernel/rcuclassic.c: In function 'rcu_init_percpu_data':
> kernel/rcuclassic.c:719: warning: comparison of distinct pointer types lacks a cast
> kernel/rcuclassic.c:727: warning: comparison of distinct pointer types lacks a cast

Hello, Steve,

Commit 0cd418ddb1ee88df7d16d5df06cb2da68eceb9e4 from linux-2.6-tip in the
tip/core/rcu section addresses this problem.  Please accept my apologies
for the hassle!!!

							Thanx, Paul

commit 0cd418ddb1ee88df7d16d5df06cb2da68eceb9e4
Author: Hiroshi Shimamoto <h-shimamoto@ct.jp.nec.com>
Date:   Mon Aug 18 14:39:21 2008 -0700

    rcuclassic: fix compiler warning
    
    CC      kernel/rcuclassic.o
    kernel/rcuclassic.c: In function 'rcu_init_percpu_data':
    kernel/rcuclassic.c:705: warning: comparison of distinct pointer
types lacks
    kernel/rcuclassic.c:713: warning: comparison of distinct pointer
types lacks
    
    flags should be unsigned long.
    
    Signed-off-by: Hiroshi Shimamoto <h-shimamoto@ct.jp.nec.com>
    Signed-off-by: Ingo Molnar <mingo@elte.hu>
