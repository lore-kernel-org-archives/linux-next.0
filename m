From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Wed, 2 Sep 2015 09:29:18 +0200
Message-ID: <20150902072918.GA2677@gmail.com>
References: <20150901135006.78be270e@canb.auug.org.au>
 <20150901074946.GF4029@linux.vnet.ibm.com>
 <20150902135800.068f0f4a@canb.auug.org.au>
 <20150902052612.GK4029@linux.vnet.ibm.com>
 <1441176051.2038.3.camel@stgolabs.net>
 <20150902071439.GM4029@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:33838 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750805AbbIBH3X (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Sep 2015 03:29:23 -0400
Content-Disposition: inline
In-Reply-To: <20150902071439.GM4029@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, peterz@infradead.org


* Paul E. McKenney <paulmck@linux.vnet.ibm.com> wrote:

> On Tue, Sep 01, 2015 at 11:40:51PM -0700, Davidlohr Bueso wrote:
> > On Tue, 2015-09-01 at 22:26 -0700, Paul E. McKenney wrote:
> > > Davidlohr, the error is due to sched_setscheduler_nocheck() not being
> > > exported, so that Stephen gets this failure when building modules.
> > > This is 04be76a9b067 (locktorture: Support rtmutex torturing) in -rcu.
> > > 
> > > Thoughts?
> > 
> > Right, the below should take care of it. Although I think it makes sense
> > to get this into at least 4.3 even if we won't use it until 4.4. Simply
> > because we already export sched_setscheduler(). If you agree I guess we
> > could route via -tip.
> 
> Given an ack from Peter or Ingo, I would happy to queue it.  But we are
> talking 4.4 rather than 4.3, sorry!

The export looks good to me:

Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
