From: Mike Galbraith <efault@gmx.de>
Subject: Re: [tip:sched/core] sched/core: Add debugging code to catch
 missing update_rq_clock() calls
Date: Fri, 03 Feb 2017 13:59:34 +0100
Message-ID: <1486126774.4277.6.camel@gmx.de>
References: <20160921133813.31976-8-matt@codeblueprint.co.uk>
         <tip-cb42c9a3ebbbb23448c3f9a25417fae6309b1a92@git.kernel.org>
         <87tw8gutp6.fsf@concordia.ellerman.id.au>
         <20170130213435.GM31613@codeblueprint.co.uk>
         <33118425-8548-475A-8DED-9A2424C0BCCC@linux.vnet.ibm.com>
         <1485863317.4498.2.camel@gmx.de>
         <CAOxpaSW_GnndoxLBPtyTrqPJ9XOWvgXOQNDf8D+6OohWeObn5Q@mail.gmail.com>
         <20170202155506.GX6515@twins.programming.kicks-ass.net>
         <3BAB5673-2BF8-46E0-8018-6A0F3DEEC9F7@linux.vnet.ibm.com>
         <20170203085301.GA6515@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:62016 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751958AbdBCNAP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 3 Feb 2017 08:00:15 -0500
In-Reply-To: <20170203085301.GA6515@twins.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Sachin Sant <sachinp@linux.vnet.ibm.com>
Cc: Ross Zwisler <zwisler@gmail.com>, Matt Fleming <matt@codeblueprint.co.uk>, Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, 2017-02-03 at 09:53 +0100, Peter Zijlstra wrote:
> On Fri, Feb 03, 2017 at 10:03:14AM +0530, Sachin Sant wrote:

> > I ran few cycles of cpu hot(un)plug tests. In most cases it works except one
> > where I ran into rcu stall:
> > 
> > [  173.493453] INFO: rcu_sched detected stalls on CPUs/tasks:
> > [  173.493473] > > 	> > 8-...: (2 GPs behind) idle=006/140000000000000/0 softirq=0/0 fqs=2996 
> > [  173.493476] > > 	> > (detected by 0, t=6002 jiffies, g=885, c=884, q=6350)
> 
> Right, I actually saw that too, but I don't think that would be related
> to my patch. I'll see if I can dig into this though, ought to get fixed
> regardless.

FWIW, I'm not seeing stalls/hangs while beating hotplug up in tip. (so
next grew a wart?)

	-Mike
