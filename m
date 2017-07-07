From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: Re: [linux-next] cpus stalls detected few hours after booting next
 kernel
Date: Fri, 07 Jul 2017 16:36:10 +0530
Message-ID: <1499425570.19784.38.camel@abdul.in.ibm.com>
References: <1498728106.19484.21.camel@abdul>
         <20170629193614.376e27e6@roar.ozlabs.ibm.com>
         <20170629202305.6187367f@roar.ozlabs.ibm.com>
         <20170630004534.228f7c08@roar.ozlabs.ibm.com>
         <1498800138.19484.25.camel@abdul>
         <20170630172802.6d4ddca2@roar.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170630172802.6d4ddca2@roar.ozlabs.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicholas Piggin <npiggin@gmail.com>
Cc: sachinp <sachinp@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Paul McKenney <Paul.McKenney@us.ibm.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, paulus@samba.org, paulmck@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
List-Id: linux-next.vger.kernel.org

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

Yes, I was able to collect the perf data for rcu_invoke_callback event
on recent next kernel (4.12.0-next-20170705). the issue is rare to hit.

After booting the next kernel, I started this command 'perf record  -e
rcu:rcu_invoke_callback -a -g -- cat' and waited for 30 minutes.

five minutes after seeing the stalls messages, I did CTRL-C to end the
perf command.

@Nicholas : the perf.data report is too huge to attach here, shall I
ping you the internal location of file on slack/mail ? Also the machine
is in the same state if you want to use it ?

> 
> Does this bug show up with just the powerpc next branch?
> 
> Thanks,
> Nick
> 


-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre
