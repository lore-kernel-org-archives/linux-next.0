From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Wed, 2 Sep 2015 13:58:00 +1000
Message-ID: <20150902135800.068f0f4a@canb.auug.org.au>
References: <20150901135006.78be270e@canb.auug.org.au>
	<20150901074946.GF4029@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150901074946.GF4029@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>
List-Id: linux-next.vger.kernel.org

Hi Paul,

On Tue, 1 Sep 2015 00:49:46 -0700 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
>
> On Tue, Sep 01, 2015 at 01:50:06PM +1000, Stephen Rothwell wrote:
> > 
> > After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
> > failed like this:
> > 
> > ERROR: "sched_setscheduler_nocheck" [kernel/locking/locktorture.ko] undefined!
> > ERROR: "percpu_down_write" [kernel/locking/locktorture.ko] undefined!
> > ERROR: "percpu_up_write" [kernel/locking/locktorture.ko] undefined!
> > ERROR: "percpu_down_read" [kernel/locking/locktorture.ko] undefined!
> > ERROR: "percpu_up_read" [kernel/locking/locktorture.ko] undefined!
> > ERROR: "__percpu_init_rwsem" [kernel/locking/locktorture.ko] undefined!
> > 
> > Caused by commits
> > 
> >   04be76a9b067 ("locktorture: Support rtmutex torturing")
> >   40b2996f9b32 ("locktorture: Add torture tests for percpu_rwsem")
> > 
> > and maybe more.
> > 
> > I have used the rcu tree from next-20150831 for today.
> 
> It is looking like I will be deferring these to v4.4, apologies for
> the hassle!

This still fails to build but now I only get the error about
sched_setscheduler_nocheck.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
