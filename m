From: Gleb Natapov <gleb@redhat.com>
Subject: Re: [RFC PATCH v2] Add rcu user eqs exception hooks for async page
 fault
Date: Thu, 29 Nov 2012 13:07:17 +0200
Message-ID: <20121129110717.GA9711@redhat.com>
References: <1353993325.14050.49.camel@ThinkPad-T5421.cn.ibm.com>
 <CAFTL4hx0fc_Jo8wkuRZedW4DVEeQceiHMrWVqTqB5k065Wsg8Q@mail.gmail.com>
 <1354090704.3054.13.camel@ThinkPad-T5421.cn.ibm.com>
 <CAFTL4hxPSp1fs4=2g0yFs0d5nFisfUsfDAA9bHWcu+-+tO_ySw@mail.gmail.com>
 <20121128135345.GG928@redhat.com>
 <CAFTL4hxoFBLNQCABBpJRBgV-r-Mg5GSq7HbPfWJRraSvtviz4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:55094 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751692Ab2K2LHW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 29 Nov 2012 06:07:22 -0500
Content-Disposition: inline
In-Reply-To: <CAFTL4hxoFBLNQCABBpJRBgV-r-Mg5GSq7HbPfWJRraSvtviz4A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Li Zhong <zhong@linux.vnet.ibm.com>, linux-next list <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, paulmck@linux.vnet.ibm.com, sasha.levin@oracle.com, avi@redhat.com

On Wed, Nov 28, 2012 at 03:25:07PM +0100, Frederic Weisbecker wrote:
> 2012/11/28 Gleb Natapov <gleb@redhat.com>:
> > On Wed, Nov 28, 2012 at 01:55:42PM +0100, Frederic Weisbecker wrote:
> >> Yes but if rcu_irq_*() calls are fine to be called there, and I
> >> believe they are because exception_enter() exits the user mode, we
> >> should start to protect there right now instead of waiting for a
> >> potential future warning of illegal RCU use.
> >>
> > Async page not present is not much different from regular page fault
> > exception when it happens not on idle task (regular #PF cannot happen
> > on idle task), but code have a special handling for idle task. So why
> > do you think rcu_irq_*() is required here, but not in page fault
> > handler?
> 
> Because we are not supposed to fault in idle, at least I hope there
> are no case around. Except on cases like here with KVM I guess but we
> have that special async handler for that.
> 
As far as I understand rcu_irq_enter() should be called before entering
the mode in which read-side critical sections can occur, but async page
fault does not uses RCU in case of faulting in idle. Actually, looking
closer, it may call kfree() if page ready notification arrives ahead
of not present notification (with todays KVM it cannot happen) and we
have to assume that kfree() uses rcu read even if it currently does not.
So may be it is possible to move rcu_irq_*() calls to be around unlikely
kfree() call only.

--
			Gleb.
