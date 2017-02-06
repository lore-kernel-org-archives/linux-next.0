From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: Re: [tip:sched/core] sched/core: Add debugging code to catch missing
 update_rq_clock() calls
Date: Mon, 6 Feb 2017 11:53:10 +0530
Message-ID: <45DC157B-EA1A-4E1C-9449-8DD317837FCB@linux.vnet.ibm.com>
References: <20170130213435.GM31613@codeblueprint.co.uk>
 <33118425-8548-475A-8DED-9A2424C0BCCC@linux.vnet.ibm.com>
 <1485863317.4498.2.camel@gmx.de>
 <CAOxpaSW_GnndoxLBPtyTrqPJ9XOWvgXOQNDf8D+6OohWeObn5Q@mail.gmail.com>
 <20170202155506.GX6515@twins.programming.kicks-ass.net>
 <3BAB5673-2BF8-46E0-8018-6A0F3DEEC9F7@linux.vnet.ibm.com>
 <20170203085301.GA6515@twins.programming.kicks-ass.net>
 <1486126774.4277.6.camel@gmx.de>
 <20170203133748.GB6515@twins.programming.kicks-ass.net>
 <20170203154457.GJ30506@linux.vnet.ibm.com>
 <20170203155453.GA23760@linux.vnet.ibm.com>
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43254 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750962AbdBFGX3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Feb 2017 01:23:29 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v166IUYj129372
        for <linux-next@vger.kernel.org>; Mon, 6 Feb 2017 01:23:28 -0500
Received: from e28smtp07.in.ibm.com (e28smtp07.in.ibm.com [125.16.236.7])
        by mx0b-001b2d01.pphosted.com with ESMTP id 28ekjr0md4-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Mon, 06 Feb 2017 01:23:28 -0500
Received: from localhost
        by e28smtp07.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <sachinp@linux.vnet.ibm.com>;
        Mon, 6 Feb 2017 11:53:23 +0530
In-Reply-To: <20170203155453.GA23760@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: Peter Zijlstra <peterz@infradead.org>, Matt Fleming <matt@codeblueprint.co.uk>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mike Galbraith <efault@gmx.de>, LKML <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Ross Zwisler <zwisler@gmail.com>


>>> I've seen it on tip. It looks like hot unplug goes really slow when
>>> there's running tasks on the CPU being taken down.
>>> 
>>> What I did was something like:
>>> 
>>>  taskset -p $((1<<1)) $$
>>>  for ((i=0; i<20; i++)) do while :; do :; done & done
>>> 
>>>  taskset -p $((1<<0)) $$
>>>  echo 0 > /sys/devices/system/cpu/cpu1/online
>>> 
>>> And with those 20 tasks stuck sucking cycles on CPU1, the unplug goes
>>> _really_ slow and the RCU stall triggers. What I suspect happens is that
>>> hotplug stops participating in the RCU state machine early, but only
>>> tells RCU about it really late, and in between it gets suspicious it
>>> takes too long.
>>> 
>>> I've yet to dig through the RCU code to figure out the exact sequence of
>>> events, but found the above to be fairly reliable in triggering the
>>> issue.
> 
>> If you send me the full splat from the dmesg and the RCU portions of
>> .config, I will take a look.  Is this new behavior, or a new test?
> 

I have sent the required files to you via separate email.

> If new behavior, I would be most suspicious of these commits in -rcu which
> recently entered -tip:
> 
> 19e4d983cda1 rcu: Place guard on rcu_all_qs() and rcu_note_context_switch() actions
> 913324b1364f rcu: Eliminate flavor scan in rcu_momentary_dyntick_idle()
> fcdcfefafa45 rcu: Pull rcu_qs_ctr into rcu_dynticks structure
> 0919a0b7e7a5 rcu: Pull rcu_sched_qs_mask into rcu_dynticks structure
> caa7c8e34293 rcu: Make rcu_note_context_switch() do deferred NOCB wakeups
> 41e4b159d516 rcu: Make rcu_all_qs() do deferred NOCB wakeups
> b457a3356a68 rcu: Make call_rcu() do deferred NOCB wakeups
> 
> Does reverting any of these help?

I tried reverting the above commits. That does not help. I can still recreate the issue.

Thanks
-Sachin
