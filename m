From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [RFC PATCH v2] Add rcu user eqs exception hooks for async page fault
Date: Wed, 28 Nov 2012 15:25:07 +0100
Message-ID: <CAFTL4hxoFBLNQCABBpJRBgV-r-Mg5GSq7HbPfWJRraSvtviz4A@mail.gmail.com>
References: <1353993325.14050.49.camel@ThinkPad-T5421.cn.ibm.com>
	<CAFTL4hx0fc_Jo8wkuRZedW4DVEeQceiHMrWVqTqB5k065Wsg8Q@mail.gmail.com>
	<1354090704.3054.13.camel@ThinkPad-T5421.cn.ibm.com>
	<CAFTL4hxPSp1fs4=2g0yFs0d5nFisfUsfDAA9bHWcu+-+tO_ySw@mail.gmail.com>
	<20121128135345.GG928@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121128135345.GG928@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gleb Natapov <gleb@redhat.com>
Cc: Li Zhong <zhong@linux.vnet.ibm.com>, linux-next list <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, paulmck@linux.vnet.ibm.com, sasha.levin@oracle.com, avi@redhat.com
List-Id: linux-next.vger.kernel.org

2012/11/28 Gleb Natapov <gleb@redhat.com>:
> On Wed, Nov 28, 2012 at 01:55:42PM +0100, Frederic Weisbecker wrote:
>> Yes but if rcu_irq_*() calls are fine to be called there, and I
>> believe they are because exception_enter() exits the user mode, we
>> should start to protect there right now instead of waiting for a
>> potential future warning of illegal RCU use.
>>
> Async page not present is not much different from regular page fault
> exception when it happens not on idle task (regular #PF cannot happen
> on idle task), but code have a special handling for idle task. So why
> do you think rcu_irq_*() is required here, but not in page fault
> handler?

Because we are not supposed to fault in idle, at least I hope there
are no case around. Except on cases like here with KVM I guess but we
have that special async handler for that.

Note exception_enter() only takes cares of RCU user mode, not idle. If
the need arise in the future we can extend it to handle idle.

>> >
>> > I think we still need Gleb's patch about the idle check in
>> > kvm_async_pf_task_wait(), and maybe another patch for the
>> > exit_idle()/enter_idle() issue.
>>
>> Right.
>>
> Done.

 Thanks!
