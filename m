From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH] Fix abnormal rcu dynticks_nesting values related to
 async page fault
Date: Tue, 27 Nov 2012 08:16:39 -0800
Message-ID: <20121127161639.GF2474@linux.vnet.ibm.com>
References: <1353993325.14050.49.camel@ThinkPad-T5421.cn.ibm.com>
 <CAFTL4hydk-FT_hqCbcSPFcNCKnqxtWGz0VjTu3nNnQYfbtTz6Q@mail.gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e34.co.us.ibm.com ([32.97.110.152]:42482 "EHLO
	e34.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753645Ab2K0QTm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Nov 2012 11:19:42 -0500
Received: from /spool/local
	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Tue, 27 Nov 2012 09:19:41 -0700
Content-Disposition: inline
In-Reply-To: <CAFTL4hydk-FT_hqCbcSPFcNCKnqxtWGz0VjTu3nNnQYfbtTz6Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Li Zhong <zhong@linux.vnet.ibm.com>, linux-next list <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, sasha.levin@oracle.com, gleb@redhat.com, avi@redhat.com

On Tue, Nov 27, 2012 at 04:39:59PM +0100, Frederic Weisbecker wrote:
> 2012/11/27 Li Zhong <zhong@linux.vnet.ibm.com>:
> > I noticed some warnings complaining about dynticks_nesting value, like
> >
> > [  267.545032] ------------[ cut here ]------------
> > [  267.545032] WARNING: at kernel/rcutree.c:382 rcu_eqs_enter+0xab/0xc0()
> > [  267.545032] Hardware name: Bochs
> > [  267.545032] Modules linked in:
> > [  267.545032] Pid: 0, comm: swapper/2 Not tainted 3.7.0-rc5-next-20121115 #8
> > [  267.545032] Call Trace:
> > [  267.545032]  [<ffffffff8104714f>] warn_slowpath_common+0x7f/0xc0
> > [  267.545032]  [<ffffffff810471aa>] warn_slowpath_null+0x1a/0x20
> > [  267.545032]  [<ffffffff810e607b>] rcu_eqs_enter+0xab/0xc0
> > [  267.545032]  [<ffffffff810e60bb>] rcu_idle_enter+0x2b/0x70
> > [  267.545032]  [<ffffffff8100d44f>] cpu_idle+0x6f/0x100
> > [  267.545032]  [<ffffffff814bf055>] start_secondary+0x205/0x20c
> > [  267.545032] ---[ end trace 924ae80da035028d ]---
> >
> > After enabling rcu-dyntick tracing, I got following abnormal
> > dynticks_nesting values (13fffffffffffff, ff00000000000001,etc):
> >                         ...
> >  1      <idle>-0     [002] dN.2 18739.518567: rcu_dyntick: End 0 140000000000000                rcu_idle_exit
> >  2        sshd-696   [002] d..1 18739.518675: rcu_dyntick: ++= 140000000000000 140000000000001  rcu_irq_enter   - apf (not present)
> >
> >  3      <idle>-0     [002] d..2 18739.518705: rcu_dyntick: Start 140000000000001 0              rcu_idle_enter
> >  4      <idle>-0     [002] d..2 18739.521252: rcu_dyntick: End 0 1                              rcu_irq_enter   - apf (page ready)
> >  5      <idle>-0     [002] dN.2 18739.521261: rcu_dyntick: Start 1 0                            rcu_irq_exit    - apf (page ready)
> >  6      <idle>-0     [002] dN.2 18739.521263: rcu_dyntick: End 0 140000000000000                rcu_idle_exit
> >
> >  7        sshd-696   [002] d..1 18739.521299: rcu_dyntick: --= 140000000000000 13fffffffffffff  rcu_irq_exit    - apf (not present)
> 
> Calling rcu_irq_exit() without a matching rcu_irq_enter() after the
> last rcu_idle_exit() is illegal, isn't it?

It is OK to call rcu_irq_exit() without a matching rcu_irq_enter() -only-
if you have also called rcu_idle_exit() since the last rcu_idle_enter().
There will be a similar rule for rcu_user_exit().

More generally, it is OK to call rcu_irq_exit() without a matching
rcu_irq_enter() only if RCU believes that the CPU you are running on is
non-idle.  On 32-bit systems, you are only allowed a few tens of million
such unmatched rcu_irq_enter() calls in a given RCU-non-idle region.

All courtesy of RCU's need to tolerate architectures that enter
interrupt handlers without ever leaving them and vice versa.  ;-)

							Thanx, Paul
