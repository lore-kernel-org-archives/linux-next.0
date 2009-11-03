From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [-next regression] lockdep? tracing? BUG: unable to handle
	kernel paging request at
Date: Tue, 3 Nov 2009 18:08:31 +0100
Message-ID: <20091103170831.GB3074@elte.hu>
References: <1257263296.2891.97.camel@dhcp231-106.rdu.redhat.com> <1257264170.26028.3340.camel@gandalf.stny.rr.com> <1257267617.2891.107.camel@dhcp231-106.rdu.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754444AbZKCRIi@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1257267617.2891.107.camel@dhcp231-106.rdu.redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Paris <eparis@redhat.com>
Cc: rostedt@goodmis.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, zhaolei@cn.fujitsu.com, lizf@cn.fujitsu.com, Peter Zijlstra <a.p.zijlstra@chello.nl>
List-Id: linux-next.vger.kernel.org


* Eric Paris <eparis@redhat.com> wrote:

> On Tue, 2009-11-03 at 11:02 -0500, Steven Rostedt wrote:
> > [ Added Peter Zijlstra ]
> > 
> > On Tue, 2009-11-03 at 10:48 -0500, Eric Paris wrote:
> > > Linux-next from Oct 30 did not have this problem.  Linux next from
> > > yesterday (and today) I always hit this on boot.
> > 
> > Could you also give the SHA1 of Linux-next, as well as the config you
> > used.
> 
> False alarm, apparently this is due to a patch that I added.  Odd part 
> is, I don't touch anything even remotely close to this section of 
> code. I'm at a bit of a lose, but apply my patch, boom, revert, works.
> 
> I'll figure it out eventually I guess.

When i saw your crash earlier today my first guess was memory 
corruption: lockdep is one of the first things to blow up on kernel data 
structure memory corruption. It tracks all locks and affects everything 
so gets hit first.

( Nevertheless we do have fresh changes in the tracing tree so some
  genuine lockdep/tracing crash was not implausible either. )

	Ingo
