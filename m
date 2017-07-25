From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: Re: cpus stalls detected few hours after booting next
 kernel
Date: Tue, 25 Jul 2017 10:49:57 +0530
Message-ID: <1500959997.27017.23.camel@abdul.in.ibm.com>
References: <1498728106.19484.21.camel@abdul>
         <20170629193614.376e27e6@roar.ozlabs.ibm.com>
         <20170629202305.6187367f@roar.ozlabs.ibm.com>
         <20170630004534.228f7c08@roar.ozlabs.ibm.com>
         <1498800138.19484.25.camel@abdul>
         <20170630172802.6d4ddca2@roar.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54610 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750781AbdGYFUH (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 25 Jul 2017 01:20:07 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v6P5Ifxf000891
        for <linux-next@vger.kernel.org>; Tue, 25 Jul 2017 01:20:07 -0400
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2bwvyy5xr7-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Tue, 25 Jul 2017 01:20:07 -0400
Received: from localhost
        by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <abdhalee@linux.vnet.ibm.com>;
        Tue, 25 Jul 2017 15:20:04 +1000
In-Reply-To: <20170630172802.6d4ddca2@roar.ozlabs.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: sachinp <sachinp@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Paul McKenney <Paul.McKenney@us.ibm.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, paulus@samba.org, paulmck@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

On Fri, 2017-06-30 at 17:28 +1000, Nicholas Piggin wrote:
> On Fri, 30 Jun 2017 10:52:18 +0530
> Abdul Haleem <abdhalee@linux.vnet.ibm.com> wrote:
> 
> > On Fri, 2017-06-30 at 00:45 +1000, Nicholas Piggin wrote:
> > > On Thu, 29 Jun 2017 20:23:05 +1000
> > > Nicholas Piggin <npiggin@gmail.com> wrote:
> > > 
> > > > On Thu, 29 Jun 2017 19:36:14 +1000
> > > > Nicholas Piggin <npiggin@gmail.com> wrote:
> > > 
> > > > > I don't *think* the replay-wakeup-interrupt patch is directly involved, but
> > > > > it's likely to be one of the idle patches.  
> > > 
> > > Okay this turned out to be misconfigured sleep states I added for the
> > > simulator, sorry for the false alarm.
> > > 
> > > > Although you have this in the backtrace. I wonder if that's a stuck
> > > > lock in rcu_process_callbacks?
> > > 
> > > So this spinlock becomes top of the list of suspects. Can you try
> > > enabling lockdep and try to reproduce it?
> > 
> > Yes, recreated again with CONFIG_LOCKDEP=y & CONFIG_DEBUG_LOCKDEP=y set.
> > I do not see any difference in trace messages with and without LOCKDEP
> > enabled.
> > 
> > Please find the attached log file.
> 
> Can you get an rcu_invoke_callback event trace that Paul suggested?

Yes, I have collected the perf report.
> 
> Does this bug show up with just the powerpc next branch?

Now started seeing the call trace on mainline too (4.13.0-rc2)

> 
> Thanks,
> Nick
> 


-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre
