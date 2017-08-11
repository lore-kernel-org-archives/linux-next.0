From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Fri, 11 Aug 2017 07:39:17 -0700
Message-ID: <20170811143917.GD3730@linux.vnet.ibm.com>
References: <20170811144352.585085e2@canb.auug.org.au>
 <20170811045453.GB3730@linux.vnet.ibm.com>
 <20170811091434.h6mkuuw3zcgkzg26@hirez.programming.kicks-ass.net>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49596 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753183AbdHKOjh (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 11 Aug 2017 10:39:37 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7BEdaH1009288
        for <linux-next@vger.kernel.org>; Fri, 11 Aug 2017 10:39:37 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2c9bk19xtq-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Fri, 11 Aug 2017 10:39:37 -0400
Received: from localhost
        by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Fri, 11 Aug 2017 10:39:19 -0400
Content-Disposition: inline
In-Reply-To: <20170811091434.h6mkuuw3zcgkzg26@hirez.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Aug 11, 2017 at 11:14:34AM +0200, Peter Zijlstra wrote:
> On Thu, Aug 10, 2017 at 09:54:53PM -0700, Paul E. McKenney wrote:
> > On Fri, Aug 11, 2017 at 02:43:52PM +1000, Stephen Rothwell wrote:
> > 
> > Looks like I need to rebase my patch on top of a9668cd6ee28, and
> > than put an smp_mb__after_spinlock() between the lock and the unlock.
> > 
> > Peter, any objections to that approach?  Other suggestions?
> 
> Hurm.. I'll have to try and understand that comment there again it
> seems.

My reasoning is as follows:

1.	The critical section is empty, so any prior references
	would be ordered only against later critical sections.

2.	A full barrier within the critical section will order those
	prior references against later critical sections just
	as easily as would one prior to the critical section.

Does that make sense, I should I have stayed away from the keyboard
at this early hour?  ;-)

							Thanx, Paul
