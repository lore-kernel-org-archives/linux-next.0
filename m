From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Tue, 1 Sep 2015 00:49:46 -0700
Message-ID: <20150901074946.GF4029@linux.vnet.ibm.com>
References: <20150901135006.78be270e@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e38.co.us.ibm.com ([32.97.110.159]:52942 "EHLO
	e38.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754332AbbIAHtv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Sep 2015 03:49:51 -0400
Received: from /spool/local
	by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Tue, 1 Sep 2015 01:49:50 -0600
Content-Disposition: inline
In-Reply-To: <20150901135006.78be270e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>

On Tue, Sep 01, 2015 at 01:50:06PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> ERROR: "sched_setscheduler_nocheck" [kernel/locking/locktorture.ko] undefined!
> ERROR: "percpu_down_write" [kernel/locking/locktorture.ko] undefined!
> ERROR: "percpu_up_write" [kernel/locking/locktorture.ko] undefined!
> ERROR: "percpu_down_read" [kernel/locking/locktorture.ko] undefined!
> ERROR: "percpu_up_read" [kernel/locking/locktorture.ko] undefined!
> ERROR: "__percpu_init_rwsem" [kernel/locking/locktorture.ko] undefined!
> 
> Caused by commits
> 
>   04be76a9b067 ("locktorture: Support rtmutex torturing")
>   40b2996f9b32 ("locktorture: Add torture tests for percpu_rwsem")
> 
> and maybe more.
> 
> I have used the rcu tree from next-20150831 for today.

It is looking like I will be deferring these to v4.4, apologies for
the hassle!

							Thanx, Paul
