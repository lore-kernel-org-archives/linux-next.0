From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: cpus stalls detected few hours after booting next
 kernel
Date: Fri, 30 Jun 2017 17:28:02 +1000
Message-ID: <20170630172802.6d4ddca2@roar.ozlabs.ibm.com>
References: <1498728106.19484.21.camel@abdul>
        <20170629193614.376e27e6@roar.ozlabs.ibm.com>
        <20170629202305.6187367f@roar.ozlabs.ibm.com>
        <20170630004534.228f7c08@roar.ozlabs.ibm.com>
        <1498800138.19484.25.camel@abdul>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:32875 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751683AbdF3H2T (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Jun 2017 03:28:19 -0400
In-Reply-To: <1498800138.19484.25.camel@abdul>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Cc: sachinp <sachinp@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Paul McKenney <Paul.McKenney@us.ibm.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, paulus@samba.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, paulmck@linux.vnet.ibm.com

On Fri, 30 Jun 2017 10:52:18 +0530
Abdul Haleem <abdhalee@linux.vnet.ibm.com> wrote:

> On Fri, 2017-06-30 at 00:45 +1000, Nicholas Piggin wrote:
> > On Thu, 29 Jun 2017 20:23:05 +1000
> > Nicholas Piggin <npiggin@gmail.com> wrote:
> > 
> > > On Thu, 29 Jun 2017 19:36:14 +1000
> > > Nicholas Piggin <npiggin@gmail.com> wrote:
> > 
> > > > I don't *think* the replay-wakeup-interrupt patch is directly involved, but
> > > > it's likely to be one of the idle patches.  
> > 
> > Okay this turned out to be misconfigured sleep states I added for the
> > simulator, sorry for the false alarm.
> > 
> > > Although you have this in the backtrace. I wonder if that's a stuck
> > > lock in rcu_process_callbacks?
> > 
> > So this spinlock becomes top of the list of suspects. Can you try
> > enabling lockdep and try to reproduce it?
> 
> Yes, recreated again with CONFIG_LOCKDEP=y & CONFIG_DEBUG_LOCKDEP=y set.
> I do not see any difference in trace messages with and without LOCKDEP
> enabled.
> 
> Please find the attached log file.

Can you get an rcu_invoke_callback event trace that Paul suggested?

Does this bug show up with just the powerpc next branch?

Thanks,
Nick
